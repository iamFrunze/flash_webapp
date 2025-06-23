import 'package:flash/screens/parent_review/parent_review_provider.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

import '../../res/app_dimensions.dart';

class ParentReviewScreen extends StatefulWidget {
  const ParentReviewScreen({
    super.key,
    required this.appDimensions,
    required this.id,
  });

  final AppDimensions appDimensions;
  final String id;

  @override
  State<ParentReviewScreen> createState() => _ParentReviewScreenState();
}

class _ParentReviewScreenState extends State<ParentReviewScreen> {
  @override
  void initState() {
    if (mounted) {
      Provider.of<ParentReviewProvider>(context, listen: false).init(widget.id);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ParentReviewProvider watcher =
        Provider.of<ParentReviewProvider>(context);
    final ParentReviewProvider reader =
        Provider.of<ParentReviewProvider>(context, listen: false);
    Logger().i('123123');
    if (watcher.isExists != null) {
      if (watcher.qualities != null && watcher.student != null) {
        return Scaffold(
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: widget.appDimensions.logoSize(),
                    ),
                    Text(
                      'Ученик: ${watcher.student!.name}',
                      style: TextStyle(
                        color: const Color(0xFF003F49),
                        fontWeight: FontWeight.bold,
                        fontSize: widget.appDimensions.textTitleSize(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Image.asset(
                        'assets/logo.png',
                        width: widget.appDimensions.logoSize(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.appDimensions.padding(),
                  vertical: 16,
                ),
                child: Text(
                  'Обратная связь по пройденным темам и образовательным итогам за период ноябрь-апрель 2024-2025 учебного года',
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
                //         text: watcher.month,
                //         style: TextStyle(
                //           decoration: TextDecoration.underline,
                //           color: const Color(0xFF003F49),
                //           fontWeight: FontWeight.w600,
                //           fontSize: widget.appDimensions.textTitleSize(),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: watcher.qualities!.length + 3,
                        itemBuilder: (BuildContext context, int themeIndex) {
                          if (themeIndex == 0) {
                            // В начало списка
                            return const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Информация об успеваемости:',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            );
                          }
                          if (themeIndex == 8) {
                            // После 7-го элемента (index 1–7 → 7 элементов, index 8 — наш текст)
                            return const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Перечень тем, которые будут изучаться в следующих месяцах:',
                                style: TextStyle(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                            );
                          }

                          if (themeIndex == 15) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.appDimensions.padding(),
                                vertical: 16,
                              ),
                              child: const Text(
                                '\n\n       В случае снижения мотивации ребёнка относительно посещения занятий, выполнения домашних работ, резких ухудшений оценок в школе по английскому языку, напишите, пожалуйста, администратору с описанием ситуации. Мы передадим информацию в методический отдел, найдем решение для корректировки ситуации и свяжемся с Вами для обратной связи и более детального общения.'
                                '\n\n       Ведь правильная цель изучения английского языка - это освоить (доучить) язык до того уровня, при котором ребёнок сможет применять полученные знания, как в школе (самостоятельно выполнять домашнее задание, повышать успеваемость и оценки своими усилиями), так и во взрослой жизни, закладывая фундамент его успешного будущего. '
                                '\n\n       Важно помнить, что качественное изучение (освоение) языка - это не простой  и не быстрый процесс!'
                                '\n\n       Семиуровневая программа “Flash”, наша миссия и весь процесс обучения направлены на то, чтобы помочь вашим детям добиться этой цели! Успехов в обучении!',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            );
                          }

                          final itemIndex =
                              themeIndex > 8 ? themeIndex - 2 : themeIndex - 1;

                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: widget.appDimensions.padding(),
                            ),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  watcher.qualities![itemIndex].name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  watcher.qualities![itemIndex].quality
                                      .replaceAll(';', '\n'),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      } else {
        return const Scaffold(
          body: Center(
            child: Text(
              'Еще нет информации об ученике',
            ),
          ),
        );
      }
    } else {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
