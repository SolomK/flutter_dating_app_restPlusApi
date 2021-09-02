import 'package:dating/dating/models/models.dart';
import 'package:equatable/equatable.dart';


abstract class DatingEvent extends Equatable {
  const DatingEvent();
}

class DatingLoad extends DatingEvent {
  const DatingLoad();

  @override
  List<Object> get props => [];
}

class DatingCreate extends DatingEvent {
  final Dating dating;

  const DatingCreate(this.dating);

  @override
  List<Object> get props => [dating];

  @override
  String toString() => 'Course Created {course: $dating}';
}

class DatingUpdate extends DatingEvent {
  final Dating dating;

  const DatingUpdate(this.dating);

  @override
  List<Object> get props => [dating];

  @override
  String toString() => 'Course Updated {course: $dating}';
}

class DatingDelete extends DatingEvent {
  final Dating dating;

  const DatingDelete(this.dating);

  @override
  List<Object> get props => [dating];

  @override
  toString() => 'Course Deleted {course: $dating}';
}