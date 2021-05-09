import 'package:bloc_pattern_flutter/UserRepository.dart';
import 'package:bloc_pattern_flutter/data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

class UserEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class FetchUserData extends UserEvent {

}

class UserState extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class Loading extends UserState {}

class Error extends UserState {}

class Success extends UserState {
  final _userList;

  Success(this._userList);

  List<User> get getData => _userList;

  @override
  List<Object> get props => [_userList];
}

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepo;

  UserBloc(this.userRepo) : super(null);

  @override
  // TODO: implement initialState
  UserState get initialState => Loading();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // TODO: implement mapEventToState
    if (event is FetchUserData) {
      yield Loading();

      try {
        List<User> userList = await userRepo.getAllUser();
        yield Success(userList);

      } catch (_) {
        print(_);
        yield Error();
      }
    }
  }
}
