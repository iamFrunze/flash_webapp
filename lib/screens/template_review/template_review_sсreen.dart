import 'package:auto_route/auto_route.dart';
import 'package:flash/screens/template_review/lvl_page/lvl_page.dart';
import 'package:flash/screens/template_review/lvl_page/settings_lvling.dart';
import 'package:flash/screens/template_review/quality_change_widget.dart';
import 'package:flash/screens/template_review/template_review_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:provider/provider.dart';

import '../../data/person_model.dart';
import '../../res/app_dimensions.dart';
import '../../utils/app_router.gr.dart';
import '../../utils/app_settings.dart';

class TemplateReviewScreen extends riverpod.ConsumerStatefulWidget {
  const TemplateReviewScreen({
    super.key,
    required this.student,
    required this.appDimensions,
  });

  final PersonModel student;
  final AppDimensions appDimensions;

  @override
  riverpod.ConsumerState<TemplateReviewScreen> createState() =>
      _TemplateReviewScreenState();
}

class _TemplateReviewScreenState
    extends riverpod.ConsumerState<TemplateReviewScreen> {
  late final PersonModel? admin;
  late final PersonModel? teacher;
  late final PersonModel? student;

  @override
  void initState() {
    admin = Provider.of<AppSettings>(context, listen: false).currentAdmin;
    teacher = Provider.of<AppSettings>(context, listen: false).currentTeacher;
    student = Provider.of<AppSettings>(context, listen: false).currentStudent;

    if (admin != null && teacher != null && student != null) {
      ref.read(lvlModelProvider.notifier).initPersons(
            admin: admin!,
            teacher: teacher!,
            student: student!,
          );
      Provider.of<TemplateReviewProvider>(context, listen: false).setupPersons(
        admin: admin!,
        teacher: teacher!,
        student: student!,
      );
    } else {
      AutoRouter.of(context).navigate(const AddAdminRoute());
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final lvls = ref.watch(lvlModelProvider).value;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: const Color(0xf0A65200),
        backgroundColor: const Color(0xffffb873),
        onPressed: () {
          ref.read(lvlModelProvider.notifier).saveData().whenComplete(
                () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Сохранено'),
                  ),
                ),
              );
        },
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
                child: Text(
                  'Обратная связь по образовательным итогам за период ноябрь-январь 2024-2025 учебного года',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF003F49),
                    fontWeight: FontWeight.w600,
                    fontSize: widget.appDimensions.textTitleSize(),
                  ),
                ),
                // child: RichText(
                //   textAlign: TextAlign.center,
                //   text: TextSpan(
                //     text:
                //         'Обратная связь по образовательным результатам за период ',
                //     style: TextStyle(
                //       color: const Color(0xFF003F49),
                //       fontWeight: FontWeight.w600,
                //       fontSize: widget.appDimensions.textTitleSize(),
                //     ),
                //     children: [
                //       TextSpan(
                //         text: watcher.monthController.text,
                //         style: TextStyle(
                //           decoration: TextDecoration.underline,
                //           color: const Color(0xFF003F49),
                //           fontWeight: FontWeight.w600,
                //           fontSize: widget.appDimensions.textTitleSize(),
                //         ),
                //         recognizer: TapGestureRecognizer()
                //           ..onTap = () {
                //             showDateRangePicker(
                //               context: context,
                //               // initialDate: DateTime.now(),
                //               firstDate: DateTime(2019),
                //               lastDate: DateTime(2060),
                //             ).then(
                //               (date) => reader.setupDate(
                //                 date ??
                //                     DateTimeRange(
                //                       start: DateTime.now(),
                //                       end: DateTime.now(),
                //                     ),
                //               ),
                //             );
                //           },
                //       ),
                //     ],
                //   ),
                // ),
              ),
              if (lvls != null)
                DropdownMenu(
                  initialSelection: lvls[ref.watch(changePageProvider)].lvl,
                  onSelected: (value) {
                    ref.read(lvlModelProvider.notifier).changeLvl(value);
                  },
                  dropdownMenuEntries: lvls
                      .map((e) =>
                          DropdownMenuEntry(value: e.lvl, label: e.lvl ?? ''))
                      .toList(),
                )
              else
                const CircularProgressIndicator(),
              const SizedBox(height: 8),
            ],
          ),
          LvlPage(appDimensions: widget.appDimensions),

          /// TODO: Дефолтная версия
          // /*
          // Expanded(
          //   child: ListView.builder(
          //     shrinkWrap: true,
          //     itemCount: watcher.qualities.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       return Padding(
          //         padding: EdgeInsets.symmetric(
          //           horizontal: widget.appDimensions.padding(),
          //         ),
          //         child: watcher.qualities[index].values.isNotEmpty
          //             ? QualityChangeWidget(
          //                 isLast: index == watcher.qualities.length - 1,
          //                 quality: watcher.qualities[index],
          //                 currentQuality: watcher.qualities[index].currentValue,
          //                 onChanged: (String? value) =>
          //                     reader.changeCurrentQuality(index, value),
          //               )
          //             : Container(),
          //       );
          //
          //
          //     },
          //   ),
          // ),
          //
          //  */
        ],
      ),
    );
  }
}
