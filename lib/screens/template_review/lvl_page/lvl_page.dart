import 'package:flash/screens/template_review/lvl_page/settings_lvling.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../res/app_dimensions.dart';

class LvlPage extends ConsumerWidget {
  const LvlPage({super.key, required this.appDimensions});

  final AppDimensions appDimensions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(lvlModelProvider);
    final lvls = data.value;
    final lvl = ref.watch(changePageProvider);

    if (lvls != null) {
      return Expanded(
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: lvls[lvl].themes.length + 2,
          itemBuilder: (BuildContext context, int themeIndex) {
            if (themeIndex == 0) {
              // В начало списка
              return const Align(
                alignment: Alignment.center,
                child: Text(
                  'Информация об успеваемости:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              );
            }
            if (themeIndex == 8) {
              // После 7-го элемента (index 1–7 → 7 элементов, index 8 — наш текст)
              return const Align(
                alignment: Alignment.center,
                child: Text(
                  'Перечень тем, которые будут изучаться в следующих месяцах:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              );
            }

            final itemIndex = themeIndex > 8 ? themeIndex - 2 : themeIndex - 1;

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: appDimensions.padding(),
                vertical: 8,
              ),
              child: Card(
                child: ListTile(
                  title: Text(
                    lvls[lvl].themes[itemIndex].theme ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: ListView.builder(
                    shrinkWrap: true,
                    itemCount: lvls[lvl].themes[itemIndex].values.length,
                    itemBuilder: (BuildContext context, int valueIndex) {
                      final element = lvls[lvl].themes[itemIndex];
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: appDimensions.padding(),
                        ),
                        child: CheckboxListTile(
                          value: element.selected[valueIndex],
                          title: Text(element.values[valueIndex]),
                          onChanged: (value) {
                            final tempSelected = element.selected;
                            tempSelected[valueIndex] = value ?? false;
                            element.copyWith(selected: tempSelected);
                            ref
                                .read(lvlModelProvider.notifier)
                                .updateData(lvls);
                          },
                          activeColor: const Color(0xffFF7F00),
                        ),
                      );
                    },
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              height: 8,
            );
          },
        ),
      );
    } else {
      return const Expanded(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
