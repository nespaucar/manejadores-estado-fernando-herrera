import 'package:app_manejadores_estado/models/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) => emit(UserSetState(event.user)));
    on<ChangeUserAge>((event, emit) {
      if(!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(newEdad: event.age)));
    });
    on<AddProfession>((event, emit) {
      if(!state.existUser) return;
      final profesiones = [...state.user!.profesiones!, 'Profesion: ${state.user!.profesiones!.length}'];
      emit(UserSetState(state.user!.copyWith(newProfesiones: profesiones)));
    });
    on<DeleteUser>((event, emit) => emit(const UserInitialState()));
  }
}