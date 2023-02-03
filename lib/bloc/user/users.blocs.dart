import 'package:bloc/bloc.dart';
import 'package:github_app__bloc/bloc/user/users.events.dart';
import 'package:github_app__bloc/bloc/user/users.state.dart';
import 'package:github_app__bloc/model/users.model.dart';
import 'package:github_app__bloc/repository/users.repository.dart';

class UserBloc extends Bloc<UsersEvent,UserState>{
UsersRepository usersRepository = UsersRepository();
  UserBloc():super(SearchUsersInitialState()){
    on((SearchUsersEvent event, emit) async{
      print("bloc is processing");
    
      
      emit(SearchUsersLoadingState());
      try {
        ListUsers searchUsers = await usersRepository.searchUsers(event.name, event.currentPage, event.pageSize);
        int totalPage = (searchUsers.totalCount / event.pageSize).floor();
        emit(SearchUsersSuccessState(pageSize: event.pageSize, currentPage: event.currentPage, totalPage: totalPage, listUsers: searchUsers, currentName: event.name));
      } catch (e) {
        emit(SearchUsersFailedState(errorMessage: e.toString()));
      }
      print("end processing");
    });

    on((NextPageEvent event, emit) async{
      print("bloc is processing");
    
      
      emit(SearchUsersLoadingState());
      try {
        ListUsers searchUsers = await usersRepository.searchUsers(event.name, event.currentPage, event.pageSize);
        int totalPage = (searchUsers.totalCount / event.pageSize).floor();
        emit(SearchUsersSuccessState(pageSize: event.pageSize, currentPage: event.currentPage, totalPage: totalPage, listUsers: searchUsers, currentName: event.name));
      } catch (e) {
        emit(SearchUsersFailedState(errorMessage: e.toString()));
      }
      print("end processing");
    });
  }
  
}