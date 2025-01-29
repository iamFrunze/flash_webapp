import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class PersonModel extends Equatable {
  const PersonModel({
    required this.name,
    required this.uuid,
    this.lvl = 0,
  });

  final String uuid;
  final String name;
  final int lvl;

  @override
  List<Object?> get props => <String>[uuid, name, lvl.toString()];
}
