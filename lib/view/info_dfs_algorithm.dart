import 'package:dfs_algorithm_flutter/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlgorithmExplanationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Algorithm Explanation'),
        actions: [
          IconButton(onPressed: (){Get.to(()=> HomeScreen());}, icon: Icon(Icons.navigate_next))
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SuggestFriends with DFS Algorithm',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Introduction',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'The SuggestFriends with DFS algorithm is an implementation of Depth-First Search (DFS) within a Flutter app. It is designed to provide friend suggestions based on existing friend connections in a social network or any domain where such suggestions are relevant.',
              ),
              SizedBox(height: 16),
              Text(
                'Approach',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '1. Adjacency List: The algorithm uses an adjacency list, represented by a HashMap, to store relationships between individuals. For each person (T), it maintains a list of their friends (List<T>).',
              ),
              Text(
                '2. Grouping Friends: To find friend groups, the algorithm uses DFS to traverse the network. It starts from an individual, marks them as visited, and explores their connections. The groups are stored in the groups list as sets of connected individuals.',
              ),
              Text(
                '3. Suggestions: The algorithm provides friend suggestions for a given person (T). It searches for the group that includes that person and retrieves the friends from that group. This helps identify friends who are connected to others in the same group but not to the given individual.',
              ),
              SizedBox(height: 16),

            ],
          ),
        ),
      ),
    );
  }
}
