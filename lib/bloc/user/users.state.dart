import 'package:github_app__bloc/model/users.model.dart';

abstract class UserState{
  final int currentPage;
  final int pageSize;
  final int totalPage;
  final String currentName;
  final List<User> users;

  UserState(
    {required this.pageSize,
    required this.currentPage,
    required this.totalPage, 
    required this.users,
    required this.currentName});
}

class SearchUsersSuccessState extends UserState{
  SearchUsersSuccessState({required super.pageSize, required super.currentPage, required super.totalPage, required super.users, required super.currentName});
}
class SearchUsersLoadingState extends UserState{
  SearchUsersLoadingState({required super.pageSize, required super.currentPage, required super.totalPage, required super.users, required super.currentName});
}
class SearchUsersFailedState extends UserState{
  final String errorMessage;

  SearchUsersFailedState({required super.pageSize, required super.currentPage, required super.totalPage, required super.users, required super.currentName, required this.errorMessage});


}
class SearchUsersInitialState extends UserState{
  SearchUsersInitialState({required super.pageSize, required super.currentPage, required super.totalPage, required super.users, required super.currentName});
}