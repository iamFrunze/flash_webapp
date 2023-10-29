import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:teacher_review/data/person_model.dart';
import 'package:teacher_review/res/app_dimensions.dart';
import 'package:teacher_review/screens/template_review/template_review_sreen.dart';
import 'package:teacher_review/utils/responsive_widget.dart';

@RoutePage()
class ResponsiveTemplateReviewScreen extends StatelessWidget {
  const ResponsiveTemplateReviewScreen({
    super.key,
    @PathParam('id') required this.id,
    required this.student,
  });

  final PersonModel student;
  final String id;

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: TemplateReviewScreen(
        student: student,
        appDimensions: AppDesktopDimensions(),
      ),
      mobile: TemplateReviewScreen(
        student: student,
        appDimensions: AppMobileDimensions(),
      ),
      tablet: TemplateReviewScreen(
        student: student,
        appDimensions: AppTabletDimensions(),
      ),
    );
  }
}
