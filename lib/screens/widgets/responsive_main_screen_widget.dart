import 'package:flutter/material.dart';

import '../../data/person_model.dart';
import '../../res/app_dimensions.dart';
import '../../utils/responsive_widget.dart';
import 'main_widget.dart';

class ResponsiveMainScreenWidget extends StatelessWidget {
  const ResponsiveMainScreenWidget({
    super.key,
    required this.title,
    this.subTitle,
    required this.listData,
    required this.addElement,
    required this.controller,
    required this.onTapCard,
    required this.onDeleteElement,
    required this.isStudent,
  });

  final String title;
  final String? subTitle;
  final List<PersonModel> listData;
  final Future<void> Function(String title) addElement;
  final Function(PersonModel person) onDeleteElement;
  final Function(PersonModel person) onTapCard;
  final bool isStudent;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: MainWidget(
        title: title,
        subTitle: subTitle,
        listData: listData,
        addElement: addElement,
        onDeleteElement: onDeleteElement,
        controller: controller,
        onTapCard: onTapCard,
        isStudent: isStudent,
        appDimensions: AppDesktopDimensions(),
      ),
      mobile: MainWidget(
        title: title,
        subTitle: subTitle,
        listData: listData,
        addElement: addElement,
        onDeleteElement: onDeleteElement,
        controller: controller,
        onTapCard: onTapCard,
        isStudent: isStudent,
        appDimensions: AppMobileDimensions(),
      ),
      tablet: MainWidget(
        title: title,
        subTitle: subTitle,
        listData: listData,
        addElement: addElement,
        onDeleteElement: onDeleteElement,
        controller: controller,
        onTapCard: onTapCard,
        isStudent: isStudent,
        appDimensions: AppTabletDimensions(),
      ),
    );
  }
}
