import 'package:flutter/material.dart';
import 'package:github_app__bloc/pages/SearchUsers.dart';


class Cards extends StatelessWidget {
  const Cards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
            // clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.search),
                  title: const Text('Find a user',style: TextStyle(fontSize: 34),),
                  subtitle: Text(
                    'GitHub User Profile Finder',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'You can type user name on the search bar & it will show the profile of the user along with their other relevant informations',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
               ElevatedButton(
                onPressed: (){
                  print("pressed");
                   Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchUsers()),
                        );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Go !'),
                )
              ],
            ),
          ),
      
      Card(
            // clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.search),
                  title: const Text('Find a repository',style: TextStyle(fontSize: 34),),
                  subtitle: Text(
                    'GitHub Repository Finder',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'You can type repo name on the search bar & it will show the repository along with their other relevant informations',
                    style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  ),
                ),
               ElevatedButton(
                onPressed: (){
                  print("pressed");
                   Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchUsers()),
                        );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Go !'),
                )
              ],
            ),
          ),
      
      ],
    );
  }
}