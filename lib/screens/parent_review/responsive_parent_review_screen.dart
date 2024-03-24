import 'package:auto_route/auto_route.dart';
import 'package:flash/screens/parent_review/parent_review_screen.dart';
import 'package:flutter/material.dart';

import '../../res/app_dimensions.dart';
import '../../utils/responsive_widget.dart';

@RoutePage()
class ResponsiveParentReviewScreen extends StatefulWidget {
  const ResponsiveParentReviewScreen({
    super.key,
    @pathParam required this.id,
  });

  final String id;

  @override
  State<ResponsiveParentReviewScreen> createState() =>
      _ResponsiveParentReviewScreenState();
}

class _ResponsiveParentReviewScreenState
    extends State<ResponsiveParentReviewScreen> {
  @override
  void initState() {
    debugPrint('id is ${widget.id}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: ParentReviewScreen(
        id: widget.id,
        appDimensions: AppDesktopDimensions(),
      ),
      mobile: ParentReviewScreen(
        id: widget.id,
        appDimensions: AppMobileDimensions(),
      ),
      tablet: ParentReviewScreen(
        id: widget.id,
        appDimensions: AppTabletDimensions(),
      ),
    );
  }
}
