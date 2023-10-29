import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:teacher_review/data/person_model.dart';
import 'package:teacher_review/res/app_dimensions.dart';
import 'package:teacher_review/screens/template_review/quality_change_widget.dart';
import 'package:teacher_review/screens/template_review/template_review_provider.dart';

import '../../utils/app_settings.dart';

class TemplateReviewScreen extends StatelessWidget {
  const TemplateReviewScreen({
    super.key,
    required this.student,
    required this.appDimensions,
  });

  final PersonModel student;
  final AppDimensions appDimensions;

  @override
  Widget build(BuildContext context) {
    final AppSettings appWatcher = Provider.of<AppSettings>(context);
    final TemplateReviewProvider watcher =
        Provider.of<TemplateReviewProvider>(context);
    final TemplateReviewProvider reader =
        Provider.of<TemplateReviewProvider>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: const Color(0xf0A65200),
        backgroundColor: const Color(0xffffb873),
        onPressed: () => Share.share('Hello'),
        child: const Icon(Icons.send),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: appDimensions.padding(),
              ),
              decoration: const BoxDecoration(
                color: Color(0xFF35C4AF),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: appDimensions.logoSize(),
                  ),
                  Text(
                    'Ученик: ${student.name}',
                    style: TextStyle(
                      color: const Color(0xFF003F49),
                      fontWeight: FontWeight.bold,
                      fontSize: appDimensions.textTitleSize(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      'assets/logo.png',
                      width: appDimensions.logoSize(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: appDimensions.padding(),
                vertical: 16,
              ),
              child: Text(
                'Обратная связь по образовательным результатам за период сентябрь-октябрь 2023 года',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: const Color(0xFF003F49),
                  fontWeight: FontWeight.w600,
                  fontSize: appDimensions.textTitleSize(),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: watcher.qualities.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: appDimensions.padding(),
                  ),
                  child: QualityChangeWidget(
                    quality: watcher.qualities[index],
                    currentQuality: watcher.qualities[index].currentValue,
                    onChanged: (String? value) =>
                        watcher.changeCurrentQuality(index, value),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 64,
            ),
            const Text(
                'Если Вы хотите получить более подробную информацию об успехах ребенка, напишите нам и мы с вами организуем обратный звонок с более детальной информацией.'),
            const SizedBox(
              height: 64,
            )
          ],
        ),
      ),
    );
  }
}
