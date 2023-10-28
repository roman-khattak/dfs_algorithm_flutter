
import 'package:dfs_algorithm_flutter/viewModel/friend_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'friend_input.dart';

class HomeScreen extends StatelessWidget {
  final SuggestFriendsDFS<String> friendSuggestions = SuggestFriendsDFS();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Friend Suggestions')),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              FriendInput(friendSuggestions: friendSuggestions),
            ],
          ),
        ),
      ),
    );
  }
}



