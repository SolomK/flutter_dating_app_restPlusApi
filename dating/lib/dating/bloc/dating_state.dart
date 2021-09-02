import 'package:dating/dating/models/models.dart';
import 'package:equatable/equatable.dart';


class DatingState extends Equatable {
  const DatingState();

  @override
  List<Object> get props => [];
}

class DatingLoading extends DatingState {}

class DatingLoadSuccess extends DatingState {
  final List<Dating> dating;

  DatingLoadSuccess([this.dating = const []]);

  @override
  List<Object> get props => [dating];
}

class DatingOperationFailure extends DatingState {}
