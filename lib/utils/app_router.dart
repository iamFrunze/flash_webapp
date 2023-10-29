import 'package:auto_route/auto_route.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: AddAdminRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: AddTeacherRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: AddStudentRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: ResponsiveTemplateReviewRoute.page,
          path: '/:id',
        ),
      ];
}
