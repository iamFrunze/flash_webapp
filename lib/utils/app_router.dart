import 'package:auto_route/auto_route.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: AddAdminRoute.page,
          path: '/',
        ),
        AutoRoute(
          page: AddTeacherRoute.page,
          path: '/teachers',
        ),
        AutoRoute(
          page: AddStudentRoute.page,
          path: '/students',
        ),
        AutoRoute(
          page: ResponsiveTemplateReviewRoute.page,
          path: '/:id',
        ),
        AutoRoute(
          page: NotFoundRoute.page,
          path: '/notfound',
        ),
        AutoRoute(
          page: ResponsiveParentReviewRoute.page,
          path: '/student/:id',
          guards: [CheckIfBookExists()],
        ),
      ];
}

class CheckIfBookExists extends AutoRouteGuard {
  final database = FirebaseDatabase.instance.ref("students");

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    debugPrint('params ::: ${await resolver.route.pathParams.get('id')}');
    final id = resolver.route.pathParams.get("id");
    final book = await checkStudentIsExists(id);
    if (book) {
      // await router.push(ResponsiveParentReviewRoute(id: id));

      resolver.next(true);
    } else {
      router.push(const NotFoundRoute());
    }
  }

  Future<bool> checkStudentIsExists(String id) async {
    final students = await database.get();
    debugPrint('resolve ${students.value}');
    if (students.exists) {
      Map<dynamic, dynamic> studentsParse =
          students.value as Map<dynamic, dynamic>;
      return studentsParse.containsKey(id);
    } else {
      return false;
    }
  }
}
