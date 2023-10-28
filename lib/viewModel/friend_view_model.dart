import 'dart:collection';

class SuggestFriendsDFS<T> {     // This class represents a graph of friends and their relationships using an adjacency list.
  final HashMap<T, List<T>> _adj = HashMap();  // _adj is a HashMap that serves as an adjacency list to store relationships between friends. It maps a person to a list of their friends.
  final List<Set<T>> groups = [];     // 'groups' is a list that will store sets of friends who are part of the same group (connected together) after performing DFS.

  void addFriendship(T src, T dest) {    //This function is used to add a friendship connection between two friends. It takes two parameters: src (the source friend) and dest (the destination friend). It adds each friend to the other's list of friends in the adjacency list.
    _adj.putIfAbsent(src, () => <T>[]);
    _adj[src]!.add(dest);
    _adj.putIfAbsent(dest, () => <T>[]);
    _adj[dest]!.add(src);
  }

  void findGroups() {      // This function finds groups (connected components) of friends using Depth-First Search. It initializes a visited map to keep track of visited friends and an empty list of groups to store the connected components.
    Map<T, bool> visited = HashMap();

    for (T t in _adj.keys) {
      visited[t] = false;
    }

    for (T t in _adj.keys) {
      if (visited[t] == false) {
        Set<T> group = HashSet();
        _dfs(t, visited, group);
        groups.add(group);
      }
    }
  }

  void _dfs(T v, Map<T, bool> visited, Set<T> group) {  // This function returns a set of suggested friends for a given person a
    visited[v] = true;
    group.add(v);
    for (T x in _adj[v] ?? []) {
      if ((visited[x] ?? true) == false) _dfs(x, visited, group);
    }
  }

  Set<T> getSuggestedFriends(T a) {
    if (groups.isEmpty) findGroups();

    var result = groups.firstWhere((element) => element.contains(a),
        orElse: () => <T>{});

    if (result.isNotEmpty) result.remove(a);

    return result;
  }
}