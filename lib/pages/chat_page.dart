// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_auth_flow/components/chat_bubble.dart';
import 'package:bloc_auth_flow/components/my_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:bloc_auth_flow/services/auth/auth_service.dart';
import 'package:bloc_auth_flow/services/chat/chat_services.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;
  ChatPage({
    Key? key,
    required this.receiverEmail,
    required this.receiverID,
  }) : super(key: key);

//text controller
  final TextEditingController _messageController = TextEditingController();

  //chat&auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  //send message
  void sendMessage() async {
    //if there is something in the textfield
    if (_messageController.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messageController.text);
      //clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      body: Column(
        children: [
          //display all messages
          Expanded(
            child: _buildMessageList(),
          ),
          //user input
          _buiildUserInput(),
        ],
      ),
    );
  }

  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatService.getMessage(receiverID, senderID),
      builder: (context, snapshot) {
        // errors
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading..');
        }

        // return list view

        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  //build message item

  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    //is currenet user
    bool isCurrentUser = data['senderID'] == _authService.getCurrentUser()!.uid;

    // aling message to the right if sender is the current user, otherwise left

    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;

    return Container(
      alignment: alignment,
      child: ChatBubble(message: data['message'], isCurrentUser: isCurrentUser),
    );
  }

  //buiild User input

  Widget _buiildUserInput() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          //textfield should take up most of the space
          Expanded(
            child: MyTextField(
              hintText: "Type a message",
              controller: _messageController,
              obscureText: false,
            ),
          ),

          //send button
          Container(
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: const EdgeInsets.only(right: 25),
            child: IconButton(
              onPressed: sendMessage,
              icon: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
