import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class PersonModel extends Equatable {
  const PersonModel({required this.name, required this.uuid});

  final String uuid;
  final String name;

  @override
  List<Object?> get props => <String>[uuid, name];
}
