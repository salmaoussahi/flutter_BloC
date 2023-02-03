import 'package:github_app__bloc/model/users.model.dart';

abstract class UserState{}

class SearchUsersSuccessState extends UserState{
  final int currentPage;
  final int pageSize;
  final int totalPage;
  final String currentName;
  final ListUsers listUsers;

  SearchUsersSuccessState({required this.pageSize,required this.currentPage,required this.totalPage, required this.listUsers,required this.currentName});
}
class SearchUsersLoadingState extends UserState{}
class SearchUsersFailedState extends UserState{
  final String errorMessage;

  SearchUsersFailedState({ required this.errorMessage});


}
class SearchUsersInitialState extends UserState{}