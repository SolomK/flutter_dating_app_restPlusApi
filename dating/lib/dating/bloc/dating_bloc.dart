import 'package:dating/dating/bloc/dating_event.dart';
import 'package:dating/dating/bloc/dating_state.dart';
import 'package:dating/dating/repository/dating_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


class DatingBloc extends Bloc<DatingEvent, DatingState> {
  final DatingRepository datingRepository;

  DatingBloc({ required this.datingRepository})
      : super(DatingLoading());

  @override
  Stream<DatingState> mapEventToState(DatingEvent event) async* {
    if (event is DatingLoad) {
      yield DatingLoading();
      try {
        final dating = await datingRepository.getDating();
        yield DatingLoadSuccess(dating);
      } catch (_) {
        yield DatingOperationFailure();
      }
    }

    if (event is DatingCreate) {
      try {
        await datingRepository.createDating(event.dating);
        final courses = await datingRepository.getDating();
        yield DatingLoadSuccess(courses);
      } catch (_) {
        yield DatingOperationFailure();
      }
    }

    if (event is DatingUpdate) {
      try {
        await datingRepository.updateDating(event.dating);
        final dating = await datingRepository.getDating();
        yield DatingLoadSuccess(dating);
      } catch (_) {
        yield DatingOperationFailure();
      }
    }

    if (event is DatingDelete) {
      try {
        await datingRepository.deleteDating(event.dating.username);
        final courses = await datingRepository.getDating();
        yield DatingLoadSuccess(courses);
      } catch (_) {
        yield DatingOperationFailure();
      }
    }
  }
}