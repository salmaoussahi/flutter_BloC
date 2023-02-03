abstract class UsersEvent{}

class SearchUsersEvent extends UsersEvent{
  final String name;
  final int currentPage;
  final int pageSize;

  SearchUsersEvent(this.currentPage, this.pageSize, {required this.name});
}

class NextPageEvent extends UsersEvent{
  final String name;
  final int currentPage;
  final int pageSize;

  NextPageEvent({required this.currentPage,required this.pageSize, required this.name});
}