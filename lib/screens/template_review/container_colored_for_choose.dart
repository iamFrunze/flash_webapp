import 'package:flash/data/review_model.dart';
import 'package:flutter/material.dart';

class ContainerColoredWithChoose extends StatelessWidget {
  const ContainerColoredWithChoose({
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
              return GestureDetector(
                onTap: () => onChanged!(quality.values[index]),
                child: Container(
                  color: quality.values[index] != currentQuality ? Colors.transparent : Colors.green,
                  child: Text(quality.values[index]),
                ),
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