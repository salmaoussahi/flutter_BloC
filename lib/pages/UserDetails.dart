import 'package:flutter/material.dart';
import 'package:github_app__bloc/model/users.model.dart';
import 'package:url_launcher/url_launcher.dart';


class UserDetails extends StatelessWidget {
  
  User user;
   UserDetails({ required this.user});
_launchURLBrowser() async {
  var url = Uri.parse(user.htmlUrl);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    print("username");
   
    print(user);
    return Scaffold(
      body: Center(
      child: Card(
        child: SizedBox(
          width: MediaQuery.of(context).size.width*0.9,
          height: MediaQuery.of(context).size.height*0.9,
          child: Column(children: [
            Center(child: Text(user.login,style: TextStyle(fontSize: 24,color: Colors.black),),),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.width*0.8, 
              child: Image.network(user.avatarUrl)
              ),
            ListTile(
              title: Text(user.type),
              subtitle: Text(user.nodeId),
              trailing: CircleAvatar(child: Text(user.score.toString()),),
            ),
            
            ElevatedButton(
                 onPressed: _launchURLBrowser,
                 style: ButtonStyle(
                   padding:
                       MaterialStateProperty.all(const EdgeInsets.all(5.0)),
                   textStyle: MaterialStateProperty.all(
                     const TextStyle(color: Colors.black),
                   ),
                 ), child: Text("Visit github Account"),)
            
          ]
          ),
        ),
      ),)
    );
  }
}