import 'package:equatable/equatable.dart';

class Board extends Equatable {
  const Board({
    required this.board,
  });

  final List<BoardElement> board;

  Board copyWith({
    List<BoardElement>? board,
  }) {
    return Board(
      board: board ?? this.board,
    );
  }

  factory Board.fromJson(Map<String, dynamic> json) {
    return Board(
      board: json["board"] == null
          ? []
          : List<BoardElement>.from(
              json["board"]!.map((x) => BoardElement.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "board": board.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$board, ";
  }

  @override
  List<Object?> get props => [
        board,
      ];
}

class BoardElement extends Equatable {
  const BoardElement({
    required this.lvl,
    required this.themes,
  });

  final String? lvl;
  final List<Theme> themes;

  BoardElement copyWith({
    String? lvl,
    List<Theme>? themes,
  }) {
    return BoardElement(
      lvl: lvl ?? this.lvl,
      themes: themes ?? this.themes,
    );
  }

  factory BoardElement.fromJson(Map<String, dynamic> json) {
    return BoardElement(
      lvl: json["lvl"],
      themes: json["themes"] == null
          ? []
          : List<Theme>.from(json["themes"]!.map((x) => Theme.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "lvl": lvl,
        "themes": themes.map((x) => x.toJson()).toList(),
      };

  @override
  String toString() {
    return "$lvl, $themes, ";
  }

  @override
  List<Object?> get props => [
        lvl,
        themes,
      ];
}

class Theme extends Equatable {
  Theme({
    required this.theme,
    required this.values,
    List<bool>? selected,
  }) : selected = List.generate(values.length, (_) => false);

  final String? theme;
  final List<String> values;
  final List<bool> selected;

  Theme copyWith({
    String? theme,
    List<String>? values,
    List<bool>? selected,
  }) {
    return Theme(
      theme: theme ?? this.theme,
      values: values ?? this.values,
      selected: selected ?? this.selected,
    );
  }

  factory Theme.fromJson(Map<String, dynamic> json) {
    return Theme(
      theme: json["theme"],
      values: json["values"] == null
          ? []
          : List<String>.from(json["values"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "theme": theme,
        "values": values.map((x) => x).toList(),
      };

  @override
  String toString() {
    return "$theme, $values, $selected";
  }

  @override
  List<Object?> get props => [theme, values, selected];
}
