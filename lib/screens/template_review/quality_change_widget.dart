import 'package:flash/screens/template_review/template_review_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/review_model.dart';

class QualityChangeWidget extends StatelessWidget {
  const QualityChangeWidget({
    super.key,
    required this.quality,
    required this.currentQuality,
    this.onChanged,
    required this.isLast,
  });

  final ReviewModel quality;
  final String currentQuality;
  final ValueChanged<String?>? onChanged;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final watcher = Provider.of<TemplateReviewProvider>(context);
    final reader = Provider.of<TemplateReviewProvider>(context, listen: false);

    return Card(
      child: Column(
        children: [
          Text(
            quality.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            primary: false,
            itemCount: quality.values.length,
            shrinkWrap: true,
            separatorBuilder: (ctx, index) => Divider(),
            itemBuilder: (context, index) {
              return RadioListTile(
                value: quality.values[index],
                title: Text(quality.values[index]),
                groupValue: currentQuality,
                onChanged: onChanged,
                activeColor: const Color(0xffFF7F00),
              );

              /// ЕСЛИ БЛЯТЬ ОНИ ЗАХОТЯТ ВЕРНУТЬ ЧЕКБОКСЫ
              // if (!isLast) {
              //   return RadioListTile(
              //     value: quality.values[index],
              //     title: Text(quality.values[index]),
              //     groupValue: currentQuality,
              //     onChanged: onChanged,
              //     activeColor: const Color(0xffFF7F00),
              //   );
              // } else {
              //   return CheckboxListTile(
              //     value: watcher.recomendationQuality[index],
              //     title: Text(quality.values[index]),
              //     onChanged: (value) => reader.checkRec(index, value),
              //     activeColor: const Color(0xffFF7F00),
              //   );
              // }
            },
          ),
        ],
      ),
    );
  }
}
