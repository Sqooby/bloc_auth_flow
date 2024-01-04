import 'package:bloc_auth_flow/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  // get instance of firestore& Firebaseauth

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String, dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //go through each individual user
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

  //send message

  Future<void> sendMessage(String receiverID, message) async {
    //get currenct user info
    final String currenctUserID = _auth.currentUser!.uid;
    final String currenctUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    //create a new message

    Message newMessage = Message(
        senderID: currenctUserID,
        senderEmail: currenctUserEmail,
        reciverID: receiverID,
        message: message,
        timestamp: timestamp);

    //construct chat room id for the two users

    List<String> ids = [currenctUserID, receiverID];

    ids.sort(); // sort the ids (this ensure the chatroomID is the same for 2 people)
    String chatRoomID = ids.join('_');

    // add new message to database
    await _firestore.collection('chat_rooms').doc(chatRoomID).collection('messages').add(newMessage.toMap());
  }

  // get message

  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
