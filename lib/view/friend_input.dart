import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../viewModel/friend_view_model.dart';

class FriendInput extends StatefulWidget {
  final SuggestFriendsDFS<String> friendSuggestions;

  FriendInput({required this.friendSuggestions});

  @override
  _FriendInputState createState() => _FriendInputState();
}

class _FriendInputState extends State<FriendInput> {

  final SuggestFriendsDFS<String> friendSuggestions = SuggestFriendsDFS();

  late TextEditingController yourNameController;
  late TextEditingController friendNameController;
  String? friendName;
  Set<String> suggestedFriends = {};

  List<String> friendList = [];

  @override
  void initState() {
    super.initState();
    yourNameController = TextEditingController();
    friendNameController = TextEditingController();
  }

  void updateSuggestions() {  // The updateSuggestions function is used to update the list of suggested friends when the user interacts with the input field
    setState(() {
      friendName = yourNameController.text;
      if (friendName != null && friendName!.isNotEmpty) {
        suggestedFriends = widget.friendSuggestions.getSuggestedFriends(friendName!);
        // Include suggestions from the newly added friends
        friendList.forEach((friend) {
          final parts = friend.split(' - ');
          if (parts.length == 2 && parts[0] == friendName) {
            suggestedFriends.add(parts[1]);
          }
        }
        );
      } else {
        suggestedFriends.clear();
      }
    });
  }



  void addFriendManually() {
    Get.defaultDialog(
      title: 'Add Friend',
      content: Column(
        children: [
          TextField(
            controller: yourNameController,
            decoration: InputDecoration(labelText: 'Your Name'),
          ),
          TextField(
            controller: friendNameController,
            decoration: InputDecoration(labelText: 'Your Friend\'s Name'),
          ),
          ElevatedButton(
            onPressed: () {
              final yourName = yourNameController.text;
              final friendName = friendNameController.text;
              widget.friendSuggestions.addFriendship(yourName, friendName);
               friendSuggestions.findGroups();
              yourNameController.clear();
              friendNameController.clear();
              Get.back();
              setState(() {
                friendList.add('$yourName - $friendName');
              });
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: addFriendManually,
          child: Text('Add Friend'),
        ),

        SizedBox(height: 20,),

        Text(
          'Friend Suggestions for:',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
        ),

        TextField(
          controller: yourNameController,
          decoration: InputDecoration(labelText: 'Enter your friend\'s name'),
          onChanged: (_) => updateSuggestions(),
        ),
        SizedBox(height: 10),
        Text('Suggestions found:',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        Text(suggestedFriends.join(', ')),
        SizedBox(height: 50),
        Text('Available Friend\'s List:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 20),
        SingleChildScrollView(
          child: Column(
            children: friendList.map((friend) => Text(friend)).toList(),
          ),
        ),
      ],
    );
  }
}