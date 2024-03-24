import 'package:flash/screens/parent_review/parent_review_provider.dart';
import 'package:flutter/material.dart';
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
    Provider.of<ParentReviewProvider>(context, listen: false).init(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ParentReviewProvider watcher =
    Provider.of<ParentReviewProvider>(context);
    final ParentReviewProvider reader =
    Provider.of<ParentReviewProvider>(context, listen: false);

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
                  'Обратная связь по итогам экзамена за первое полугодие 2023 г.',
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: widget.appDimensions.padding(),
                          vertical: 16,
                        ),
                        child: const Text(
                          'В школе Английского языка “Flash” экзамены нацелены на мониторинг и контроль уровня знаний всех аспектов языка наших студентов по итогам 1 полугодия с целью дальнейшего устранения пробелов через коррекционные программы 2 полугодия.'
                              '\nЭкзамен состоит из следующих частей:'
                              '\n❗️лексико-грамматический диктант (для контроля уровня освоения знаний лексики и грамматики пройденных уроков)'
                              '\n❗️чтение - для контроля качества и скорости чтения'
                              '\n❗️устная часть (контроль уровня монологической и диалогической речи)'
                              '\n❗️С 4 уровня  в экзаменационный блок добавляется написание сочинения и аудирование'
                              '\nВсе виды деятельности оцениваются по 12 бальной шкале , где 10-12 баллов - это «5», 7-9 баллов - это “4”, 4-6 баллов - это «3», 1-3 балла - это «2».',
                          style: TextStyle(
                            color: Color(0xFF003F49),
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        primary: false,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: watcher.qualities!.length + 1,
                        itemBuilder: (BuildContext context, int index) {
                          if (index < watcher.qualities!.length) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.appDimensions.padding(),
                              ),
                              child: Card(
                                child: ListTile(
                                  title: Text(
                                    watcher.qualities![index].name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle:
                                  Text(watcher.qualities![index].quality),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.appDimensions.padding(),
                                vertical: 16,
                              ),
                              child: const Text(
                                '\nРекомендации:'
                                    '\n 📌 Продолжаем контролировать выполнение домашнего задания'
                                    '\n 📌 Продолжаем системно посещать занятия'
                                    '\n 📌 Продолжаем общаться с детьми по поводу целей обучения для повышения внутренней мотивации!'
                                '\nЕсли Вы хотите получить более подробную информацию об успехах ребенка, напишите нам и мы с вами организуем обратный звонок с более детальной информацией. Желаем дальнейших успехов в изучении языка!',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            );
                          }
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
