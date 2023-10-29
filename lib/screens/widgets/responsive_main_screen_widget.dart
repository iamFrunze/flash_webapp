import 'package:flutter/material.dart';
import 'package:teacher_review/data/person_model.dart';
import 'package:teacher_review/res/app_dimensions.dart';
import 'package:teacher_review/screens/widgets/main_widget.dart';
import 'package:teacher_review/utils/responsive_widget.dart';

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
  });

  final String title;
  final String? subTitle;
  final List<PersonModel> listData;
  final Function(String title) addElement;
  final Function(PersonModel person) onDeleteElement;
  final Function(PersonModel person) onTapCard;

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
        appDimensions: AppTabletDimensions(),
      ),
    );
  }
}
