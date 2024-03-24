import 'package:auto_route/auto_route.dart';
import 'package:flash/screens/template_review/template_review_provider.dart';
import 'package:flash/screens/template_review/template_review_sсreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../res/app_dimensions.dart';
import '../../utils/app_router.gr.dart';
import '../../utils/app_settings.dart';
import '../../utils/responsive_widget.dart';

@RoutePage()
class ResponsiveTemplateReviewScreen extends StatefulWidget {
  const ResponsiveTemplateReviewScreen({
    super.key,
    @PathParam('id') required this.id,
  });

  final String id;

  @override
  State<ResponsiveTemplateReviewScreen> createState() =>
      _ResponsiveTemplateReviewScreenState();
}

class _ResponsiveTemplateReviewScreenState
    extends State<ResponsiveTemplateReviewScreen> {
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
    final student = Provider.of<AppSettings>(context).currentStudent;
    if (student != null) {
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
    } else {
      return const Scaffold(
        body: Center(
          child: SizedBox(
            height: 64,
            width: 64,
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
  }
}
