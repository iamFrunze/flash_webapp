import 'package:flutter/material.dart';
import 'package:teacher_review/data/review_model.dart';

class QualityChangeWidget extends StatelessWidget {
  const QualityChangeWidget({
    super.key,
    required this.quality,
    required this.currentQuality,
    this.onChanged,
  });

  final ReviewModel quality;
  final String currentQuality;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            quality.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          RadioListTile(
            value: quality.value1,
            title: Text(quality.value1),
            groupValue: currentQuality,
            onChanged: onChanged,
            activeColor: const Color(0xffFF7F00),
          ),
          RadioListTile(
            value: quality.value2,
            title: Text(quality.value2),
            groupValue: currentQuality,
            onChanged: onChanged,
            activeColor: const Color(0xffFF7F00),
          ),
          RadioListTile(
            value: quality.value3,
            title: Text(quality.value3),
            groupValue: currentQuality,
            onChanged: onChanged,
            activeColor: const Color(0xffFF7F00),
          ),
        ],
      ),
    );
  }
}
