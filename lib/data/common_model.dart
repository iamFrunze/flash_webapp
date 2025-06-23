import 'package:equatable/equatable.dart';

import '../screens/template_review/lvl_page/lvl_model.dart';

class Common extends Equatable {
  const Common({
    required this.common,
  });

  final List<Theme> common;

  Common copyWith({
    List<Theme>? common,
  }) {
    return Common(
      common: common ?? this.common,
    );
  }

  factory Common.fromJson(Map<String, dynamic> json) {
    return Common(
      common: json["common"] == null
          ? []
          : List<Theme>.from(json["common"]!.map((x) => Theme.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
    "common": common.map((x) => x.toJson()).toList(),
  };

  @override
  String toString() {
    return "$common, ";
  }

  @override
  List<Object?> get props => [
    common,
  ];
}

