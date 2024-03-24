// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flash/screens/add_admin/add_admin_screen.dart' as _i1;
import 'package:flash/screens/add_student/add_student_screen.dart' as _i2;
import 'package:flash/screens/add_teacher/add_teacher_screen.dart' as _i3;
import 'package:flash/screens/not_found/not_fount_screen.dart' as _i4;
import 'package:flash/screens/parent_review/responsive_parent_review_screen.dart'
    as _i5;
import 'package:flash/screens/template_review/responsive_template_review_screen.dart'
    as _i6;
import 'package:flutter/material.dart' as _i8;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    AddAdminRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddAdminScreen(),
      );
    },
    AddStudentRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddStudentScreen(),
      );
    },
    AddTeacherRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AddTeacherScreen(),
      );
    },
    NotFoundRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.NotFoundScreen(),
      );
    },
    ResponsiveParentReviewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ResponsiveParentReviewRouteArgs>(
          orElse: () =>
              ResponsiveParentReviewRouteArgs(id: pathParams.getString('id')));
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.ResponsiveParentReviewScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    ResponsiveTemplateReviewRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ResponsiveTemplateReviewRouteArgs>(
          orElse: () => ResponsiveTemplateReviewRouteArgs(
              id: pathParams.getString('id')));
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.ResponsiveTemplateReviewScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddAdminScreen]
class AddAdminRoute extends _i7.PageRouteInfo<void> {
  const AddAdminRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AddAdminRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddAdminRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddStudentScreen]
class AddStudentRoute extends _i7.PageRouteInfo<void> {
  const AddStudentRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AddStudentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddStudentRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AddTeacherScreen]
class AddTeacherRoute extends _i7.PageRouteInfo<void> {
  const AddTeacherRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AddTeacherRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddTeacherRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.NotFoundScreen]
class NotFoundRoute extends _i7.PageRouteInfo<void> {
  const NotFoundRoute({List<_i7.PageRouteInfo>? children})
      : super(
          NotFoundRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotFoundRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ResponsiveParentReviewScreen]
class ResponsiveParentReviewRoute
    extends _i7.PageRouteInfo<ResponsiveParentReviewRouteArgs> {
  ResponsiveParentReviewRoute({
    _i8.Key? key,
    required String id,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ResponsiveParentReviewRoute.name,
          args: ResponsiveParentReviewRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ResponsiveParentReviewRoute';

  static const _i7.PageInfo<ResponsiveParentReviewRouteArgs> page =
      _i7.PageInfo<ResponsiveParentReviewRouteArgs>(name);
}

class ResponsiveParentReviewRouteArgs {
  const ResponsiveParentReviewRouteArgs({
    this.key,
    required this.id,
  });

  final _i8.Key? key;

  final String id;

  @override
  String toString() {
    return 'ResponsiveParentReviewRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.ResponsiveTemplateReviewScreen]
class ResponsiveTemplateReviewRoute
    extends _i7.PageRouteInfo<ResponsiveTemplateReviewRouteArgs> {
  ResponsiveTemplateReviewRoute({
    _i8.Key? key,
    required String id,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          ResponsiveTemplateReviewRoute.name,
          args: ResponsiveTemplateReviewRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ResponsiveTemplateReviewRoute';

  static const _i7.PageInfo<ResponsiveTemplateReviewRouteArgs> page =
      _i7.PageInfo<ResponsiveTemplateReviewRouteArgs>(name);
}

class ResponsiveTemplateReviewRouteArgs {
  const ResponsiveTemplateReviewRouteArgs({
    this.key,
    required this.id,
  });

  final _i8.Key? key;

  final String id;

  @override
  String toString() {
    return 'ResponsiveTemplateReviewRouteArgs{key: $key, id: $id}';
  }
}
