// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;
import 'package:teacher_review/data/person_model.dart' as _i7;
import 'package:teacher_review/screens/add_admin/add_admin_screen.dart' as _i1;
import 'package:teacher_review/screens/add_student/add_student_screen.dart'
    as _i2;
import 'package:teacher_review/screens/add_teacher/add_teacher_screen.dart'
    as _i3;
import 'package:teacher_review/screens/template_review/responsive_template_review_screen.dart'
    as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    AddAdminRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddAdminScreen(),
      );
    },
    AddStudentRoute.name: (routeData) {
      final args = routeData.argsAs<AddStudentRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AddStudentScreen(
          key: args.key,
          teacher: args.teacher,
          admin: args.admin,
        ),
      );
    },
    AddTeacherRoute.name: (routeData) {
      final args = routeData.argsAs<AddTeacherRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AddTeacherScreen(
          key: args.key,
          admin: args.admin,
        ),
      );
    },
    ResponsiveTemplateReviewRoute.name: (routeData) {
      final args = routeData.argsAs<ResponsiveTemplateReviewRouteArgs>();
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ResponsiveTemplateReviewScreen(
          key: args.key,
          id: args.id,
          student: args.student,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AddAdminScreen]
class AddAdminRoute extends _i5.PageRouteInfo<void> {
  const AddAdminRoute({List<_i5.PageRouteInfo>? children})
      : super(
          AddAdminRoute.name,
          initialChildren: children,
        );

  static const String name = 'AddAdminRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddStudentScreen]
class AddStudentRoute extends _i5.PageRouteInfo<AddStudentRouteArgs> {
  AddStudentRoute({
    _i6.Key? key,
    required _i7.PersonModel teacher,
    required _i7.PersonModel admin,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AddStudentRoute.name,
          args: AddStudentRouteArgs(
            key: key,
            teacher: teacher,
            admin: admin,
          ),
          initialChildren: children,
        );

  static const String name = 'AddStudentRoute';

  static const _i5.PageInfo<AddStudentRouteArgs> page =
      _i5.PageInfo<AddStudentRouteArgs>(name);
}

class AddStudentRouteArgs {
  const AddStudentRouteArgs({
    this.key,
    required this.teacher,
    required this.admin,
  });

  final _i6.Key? key;

  final _i7.PersonModel teacher;

  final _i7.PersonModel admin;

  @override
  String toString() {
    return 'AddStudentRouteArgs{key: $key, teacher: $teacher, admin: $admin}';
  }
}

/// generated route for
/// [_i3.AddTeacherScreen]
class AddTeacherRoute extends _i5.PageRouteInfo<AddTeacherRouteArgs> {
  AddTeacherRoute({
    _i6.Key? key,
    required _i7.PersonModel admin,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          AddTeacherRoute.name,
          args: AddTeacherRouteArgs(
            key: key,
            admin: admin,
          ),
          initialChildren: children,
        );

  static const String name = 'AddTeacherRoute';

  static const _i5.PageInfo<AddTeacherRouteArgs> page =
      _i5.PageInfo<AddTeacherRouteArgs>(name);
}

class AddTeacherRouteArgs {
  const AddTeacherRouteArgs({
    this.key,
    required this.admin,
  });

  final _i6.Key? key;

  final _i7.PersonModel admin;

  @override
  String toString() {
    return 'AddTeacherRouteArgs{key: $key, admin: $admin}';
  }
}

/// generated route for
/// [_i4.ResponsiveTemplateReviewScreen]
class ResponsiveTemplateReviewRoute
    extends _i5.PageRouteInfo<ResponsiveTemplateReviewRouteArgs> {
  ResponsiveTemplateReviewRoute({
    _i6.Key? key,
    required String id,
    required _i7.PersonModel student,
    List<_i5.PageRouteInfo>? children,
  }) : super(
          ResponsiveTemplateReviewRoute.name,
          args: ResponsiveTemplateReviewRouteArgs(
            key: key,
            id: id,
            student: student,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'ResponsiveTemplateReviewRoute';

  static const _i5.PageInfo<ResponsiveTemplateReviewRouteArgs> page =
      _i5.PageInfo<ResponsiveTemplateReviewRouteArgs>(name);
}

class ResponsiveTemplateReviewRouteArgs {
  const ResponsiveTemplateReviewRouteArgs({
    this.key,
    required this.id,
    required this.student,
  });

  final _i6.Key? key;

  final String id;

  final _i7.PersonModel student;

  @override
  String toString() {
    return 'ResponsiveTemplateReviewRouteArgs{key: $key, id: $id, student: $student}';
  }
}
