import 'package:auto_route/auto_route.dart';
import 'package:flash/screens/template_review/container_colored_for_choose.dart';
import 'package:flash/screens/template_review/quality_change_widget.dart';
import 'package:flash/screens/template_review/template_review_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/person_model.dart';
import '../../res/app_dimensions.dart';
import '../../utils/app_router.gr.dart';
import '../../utils/app_settings.dart';

class TemplateReviewScreen extends StatefulWidget {
  const TemplateReviewScreen({
    super.key,
    required this.student,
    required this.appDimensions,
  });

  final PersonModel student;
  final AppDimensions appDimensions;

  @override
  State<TemplateReviewScreen> createState() => _TemplateReviewScreenState();
}

class _TemplateReviewScreenState extends State<TemplateReviewScreen> {
  @override
  void initState() {
    final admin = Provider.of<AppSettings>(context, listen: false).currentAdmin;
    final teacher =
        Provider.of<AppSettings>(context, listen: false).currentTeacher;
    final student =
        Provider.of<AppSettings>(context, listen: false).currentStudent;

    if (admin != null && teacher != null && student != null) {
      Provider.of<TemplateReviewProvider>(context, listen: false).setupPersons(
        admin: admin,
        teacher: teacher,
        student: student,
      );
    } else {
      AutoRouter.of(context).navigate(const AddAdminRoute());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppSettings appWatcher = Provider.of<AppSettings>(context);
    final TemplateReviewProvider watcher =
        Provider.of<TemplateReviewProvider>(context);
    final TemplateReviewProvider reader =
        Provider.of<TemplateReviewProvider>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: const Color(0xf0A65200),
        backgroundColor: const Color(0xffffb873),
        onPressed: () => reader.save().whenComplete(
              () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Сохранено'),
                ),
              ),
            ),
        child: const Icon(Icons.save),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: widget.appDimensions.padding(),
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
                  Text(
                    'Ученик: ${widget.student.name}',
                    style: TextStyle(
                      color: const Color(0xFF003F49),
                      fontWeight: FontWeight.bold,
                      fontSize: widget.appDimensions.textTitleSize(),
                    ),
                  ),
                  Image.asset(
                    'assets/logo.png',
                    width: widget.appDimensions.logoSize(),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.appDimensions.padding(),
                  vertical: 16,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text:
                        'Обратная связь по образовательным результатам за период ',
                    style: TextStyle(
                      color: const Color(0xFF003F49),
                      fontWeight: FontWeight.w600,
                      fontSize: widget.appDimensions.textTitleSize(),
                    ),
                    children: [
                      TextSpan(
                        text: watcher.monthController.text,
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: const Color(0xFF003F49),
                          fontWeight: FontWeight.w600,
                          fontSize: widget.appDimensions.textTitleSize(),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDateRangePicker(
                              context: context,
                              // initialDate: DateTime.now(),
                              firstDate: DateTime(2019),
                              lastDate: DateTime(2060),
                            ).then(
                              (date) => reader.setupDate(
                                date ??
                                    DateTimeRange(
                                      start: DateTime.now(),
                                      end: DateTime.now(),
                                    ),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
              DropdownMenu(
                initialSelection: '1 - 3 уровни',
                onSelected: reader.onSelectedDropLevel,
                dropdownMenuEntries: ['1 - 3 уровни', '4 - 7 уровни']
                    .map((e) => DropdownMenuEntry(value: e, label: e))
                    .toList(),
              ),
              const SizedBox(height: 8),
            ],
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: watcher.qualities.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: widget.appDimensions.padding(),
                  ),
                  child: watcher.qualities[index].values.isNotEmpty
                      ? QualityChangeWidget(
                          isLast: index == watcher.qualities.length - 1,
                          quality: watcher.qualities[index],
                          currentQuality: watcher.qualities[index].currentValue,
                          onChanged: (String? value) =>
                              reader.changeCurrentQuality(index, value),
                        )
                      : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
