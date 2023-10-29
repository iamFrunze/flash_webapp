import 'package:flutter/cupertino.dart';

import '../../data/review_model.dart';

class TemplateReviewProvider extends ChangeNotifier {
  final qualities = <ReviewModel>[
    quality1,
    quality2,
    quality3,
    quality4,
    quality5,
    quality6,
    quality7,
  ];

  void changeCurrentQuality(int index, String? value) {
    qualities[index].currentValue = value ?? qualities[index].value1;
    notifyListeners();
  }
}
