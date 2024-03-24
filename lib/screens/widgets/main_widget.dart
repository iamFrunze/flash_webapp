import 'package:auto_route/auto_route.dart';
import 'package:flash/screens/widgets/tiles.dart';
import 'package:flutter/material.dart';

import '../../data/person_model.dart';
import '../../res/app_dimensions.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({
    super.key,
    required this.title,
    this.subTitle,
    required this.listData,
    required this.addElement,
    required this.controller,
    required this.onTapCard,
    required this.appDimensions,
    required this.onDeleteElement,
    required this.isStudent,
  });

  final String title;
  final String? subTitle;
  final bool isStudent;
  final List<PersonModel> listData;
  final Future<void> Function(String title) addElement;
  final Function(PersonModel person) onDeleteElement;
  final Function(PersonModel person) onTapCard;
  final AppDimensions appDimensions;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: const Color(0xf0A65200),
        backgroundColor: const Color(0xffffb873),
        onPressed: () {
          showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Добавить'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: controller,
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Назад',
                    style: TextStyle(color: Color(0xf0A65200)),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    addElement(controller.text).whenComplete(
                      () => Navigator.pop(
                        context,
                      ),
                    );
                  },
                  child: const Text(
                    'Добавить',
                    style: TextStyle(color: Color(0xf0A65200)),
                  ),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: appDimensions.padding(),
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF00ada3),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                    visible: AutoRouter.of(context).canNavigateBack,
                    child: IconButton(
                      onPressed: () {
                        AutoRouter.of(context).back();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          color: const Color(0xFF003F49),
                          fontWeight: FontWeight.bold,
                          fontSize: appDimensions.textTitleSize(),
                        ),
                      ),
                      if (subTitle != null)
                        Text(
                          subTitle!,
                          style: TextStyle(
                            color: const Color(0xFF003F49),
                            fontWeight: FontWeight.bold,
                            fontSize: appDimensions.textSubTitleSize(),
                          ),
                        ),
                    ],
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: appDimensions.logoSize(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          listData.isNotEmpty
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: listData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: appDimensions.padding(),
                        ),
                        child: TilesWidget(
                          key: ValueKey<String>(listData[index].uuid),
                          id: isStudent ? listData[index].uuid : null,
                          title: listData[index].name,
                          onTap: () => onTapCard(listData[index]),
                          onDelete: () => onDeleteElement(listData[index]),
                        ),
                      );
                    },
                  ),
                )
              : const Center(
                  child: Text('Нажмите на +, чтобы добавить'),
                )
        ],
      ),
    );
  }
}
