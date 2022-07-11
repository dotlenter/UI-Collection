import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'master_page_bloc.freezed.dart';
part 'master_page_event.dart';
part 'master_page_state.dart';

@injectable
class MasterPageBloc extends Bloc<MasterPageEvent, MasterPageState> {
  MasterPageBloc() : super(_Initial()) {
    on<MasterPageEvent>((event, emit) async {
      await event.when(
          initializeHomePage: () => _handleInitializeHomePage(emit));
    });
  }

  FutureOr<void> _handleInitializeHomePage(Emitter emit) {
    emit(MasterPageState.homePageInitialized());
  }
}
