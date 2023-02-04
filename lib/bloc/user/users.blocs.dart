import 'package:bloc/bloc.dart';
import 'package:github_app__bloc/bloc/user/users.events.dart';
import 'package:github_app__bloc/bloc/user/users.state.dart';
import 'package:github_app__bloc/model/users.model.dart';
import 'package:github_app__bloc/repository/users.repository.dart';

class UserBloc extends Bloc<UsersEvent,UserState>{
UsersRepository usersRepository = UsersRepository();
  UserBloc():super(SearchUsersInitialState(pageSize: 0, currentPage: 0, totalPage: 0, users: [], currentName: "")){
    on((SearchUsersEvent event, emit) async{
      print("bloc is processing");
    
      
      emit(SearchUsersLoadingState(
        pageSize: state.pageSize, 
        currentPage: state.currentPage, 
        totalPage: state.totalPage, 
        users: state.users, 
        currentName: state.currentName));
      try {
        ListUsers searchUsers = await usersRepository.searchUsers(event.name, event.currentPage, event.pageSize);
        int totalPage = (searchUsers.totalCount / event.pageSize).floor()+1;
        emit(SearchUsersSuccessState(pageSize: event.pageSize, currentPage: event.currentPage, totalPage: totalPage, users: searchUsers.items, currentName: event.name));
      } catch (e) {
        emit(SearchUsersFailedState(
          pageSize: state.pageSize, 
        currentPage: state.currentPage, 
        totalPage: state.totalPage, 
        users: state.users, 
        currentName: state.currentName,
        errorMessage: e.toString()));
      }
      print("end processing");
    });

    on((NextPageEvent event, emit) async{
      print("bloc is processing");

     
      try {
        ListUsers searchUsers = await usersRepository.searchUsers(event.name, event.currentPage, event.pageSize);
        int totalPage = (searchUsers.totalCount / event.pageSize).floor();
        List<User> currentListOfUsers = [...state.users];
        print(currentListOfUsers);
        currentListOfUsers.addAll(searchUsers.items);
        print(currentListOfUsers.length);

        emit(SearchUsersSuccessState(pageSize: event.pageSize, currentPage: event.currentPage, totalPage: totalPage, users: currentListOfUsers, currentName: event.name));
      } catch (e) {
        emit(SearchUsersFailedState(pageSize: state.pageSize, 
        currentPage: state.currentPage, 
        totalPage: state.totalPage, 
        users: state.users, 
        currentName: state.currentName,
        errorMessage: e.toString()));
      }
      print("end processing");
    });
  }
  
}