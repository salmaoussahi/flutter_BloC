import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app__bloc/bloc/user/users.blocs.dart';
import 'package:github_app__bloc/bloc/user/users.events.dart';
import 'package:github_app__bloc/bloc/user/users.state.dart';
import 'package:github_app__bloc/pages/UserDetails.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchUsers extends StatelessWidget {
   
final Uri _url = Uri.parse('https://flutter.dev');
  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    return Scaffold(
      appBar:PreferredSize(
      preferredSize: const Size.fromHeight(150),
      child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Image.asset("assets/images/GitHub_Logo_White.png",width: 150,)
            ],
          ),
        ),
      
      ),
      body: Column(
          children: [
            Row(
              children: [
                Expanded(child: Text("Find User !",style: TextStyle(fontSize: 28,color: Colors.black),)),
                BlocBuilder<UserBloc,UserState>(builder: (context, state) {
                  if(state is SearchUsersSuccessState){
                    return Text(state.currentPage.toString()+'/'+state.totalPage.toString());
                  }
                  return Text("");
                  
                })
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: username,
                    decoration: InputDecoration(
                    hintText: 'Enter a username',
                    ),
                  ),
                ),
                IconButton( 
                onPressed: (() {
                  print(username.text);
                  String name = username.text;
                  context.read<UserBloc>().add(SearchUsersEvent( 0, 15, name: name));
                }), 
                
                icon: Icon(Icons.search),)
              ],
            ),
    
            BlocBuilder<UserBloc,UserState>(builder: (context,state){
              if(state is SearchUsersLoadingState){
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SearchUsersFailedState){
                return Center(
                  child: Text("Erreur : "+state.errorMessage),
                );
              } else if(state is SearchUsersSuccessState){
                print(state.listUsers.toJson());
                return Expanded(
                  child: LazyLoadScrollView(
                    onEndOfPage: () { 
                      context.read<UserBloc>().add(NextPageEvent(currentPage: state.currentPage+1, pageSize: state.pageSize, name:  state.currentName));

                     },
                    child: ListView.separated(
                      itemBuilder: ((context, index) => 
                      Card(
                         clipBehavior: Clip.antiAlias,
                          child: Column(
                            children: [
                              ListTile(
                                leading: CircleAvatar(backgroundImage: NetworkImage(state.listUsers.items[index].avatarUrl),),
                                title: Text(state.listUsers.items[index].login,
                                      style: TextStyle(fontSize: 26),),
                                subtitle: Row(
                                  children: [
                                    Text(
                                      "${state.listUsers.items[index].score}",
                                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                                    ),
                                    Icon(Icons.star)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                       
                                    ElevatedButton(
                                      onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => UserDetails(user:state.listUsers.items[index] ,)),
                                          );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                      ),
                                      child: Text('See More Details'),
                                      ),
                                    
                                  ],
                                ),
                              ),            
                            ],
                        ),
                  
                     
                      )
                      ), 
                      separatorBuilder: ((context, index) {
                        return Divider(
                          height: 2,
                        );
                      }), 
                      itemCount: state.listUsers.items.length
                      ),
                  ),
                );
              }else{
                return Container();
              }
            })
          ],
        ),
    );
  }

//    _launchUrl(String htmlUrl) async {
//     print(htmlUrl);
//   if (!await launchUrl(_url)) {
//     throw 'Could not launch $_url';
//   }
// }
  
}