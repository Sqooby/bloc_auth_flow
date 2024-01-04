import 'package:bloc_auth_flow/components/user_tile.dart';
import 'package:bloc_auth_flow/pages/chat_page.dart';
import 'package:bloc_auth_flow/services/auth/auth_service.dart';
import 'package:bloc_auth_flow/components/my_drawer.dart';
import 'package:bloc_auth_flow/services/chat/chat_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  //chat & auth service
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Home'),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  // build a list of users excepr for the current logged in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        //error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        //loadgin..

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        //return list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) => _buildUserListItem(userData, context)).toList(),
        );
      },
    );
  }

  //build individual list tile for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    //display all user except current user
    if (_authService.getCurrentUser()!.email != userData['email']) {
      return UserTile(
        text: userData['email'],
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                reciverEmail: userData['email'],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
