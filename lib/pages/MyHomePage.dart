import 'package:flutter/material.dart';
import 'package:github_app__bloc/pages/Cards.dart';
import 'package:github_app__bloc/pages/MyAppBar.dart';
import 'package:github_app__bloc/pages/SearchUsers.dart';


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
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

      body: Cards()
      // body: SearchUsers()
    );
  }
}