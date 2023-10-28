# dfs_algorithm_flutter

# Friend Suggestions App

The Friend Suggestions App is a Flutter application that helps users find friend suggestions based on their existing connections using the Depth-First Search (DFS) algorithm.

## Table of Contents
- [Features](#features)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Running the App](#running-the-app)
- [Usage](#usage)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [License](#license)

## Features

- Add and visualize friend connections.
- Find friend suggestions using the Depth-First Search algorithm.
- Manually add friend connections.
- Interactive Flutter app with a user-friendly interface.

## Prerequisites

To run this application, you need:

- [Flutter](https://flutter.dev/) installed on your local machine.
- A code editor (e.g., [Visual Studio Code](https://code.visualstudio.com/)).

### Installation

1. Clone this repository to your local machine using Git:

   git clone https://github.com/yourusername/friend-suggestions-app.git

2. Navigate to the project directory:

  cd dfs_algorithm_flutter

3. Install the required dependencies using Flutter:

  flutter pub get
  
4. Running the App

Make sure you have an Android/iOS emulator running or a physical device connected.

To launch the app, run the following command:

  flutter run

This will build the app and start it on your connected device/emulator.

#### Usage
Open the app on your device/emulator.

The app will initially display a Documentation Page having information about the DFS alogirthm and it use in the app.

You can manually add friend connections by clicking the "Add Friend" button and entering your name and your friend's name. The added friends will be displayed in the "Friend List."

Use the search bar to find friend suggestions based on your connections and the connections of your friends. The suggestions will be displayed below the search bar.

##### Documentation

  # DFS Algorithm

The app uses a Depth-First Search (DFS) algorithm to find groups of connected friends. When you search for friend suggestions, the algorithm explores the graph of friend connections to suggest friends who are not already in your connections.

# How to interact
You can manually add friends by clicking the "Add Friend" button and providing your name and your friend's name.
The app's main screen displays your friend suggestions and allows you to search for suggestions based on your existing connections and those of your friends.
The app stores these connections and uses them to suggest new friends to you.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
