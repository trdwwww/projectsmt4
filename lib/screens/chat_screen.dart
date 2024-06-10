import 'package:flutter/material.dart';
import 'dart:async';

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  static String routeName = "/chat";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];

  void _handleSend() {
    setState(() {
      _messages.add(Message(text: _controller.text, isUser: true));
      _controller.clear();
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        String userMessage = _messages.last.text.toLowerCase();
        if (userMessage == 'sela') {
          _messages.add(Message(text: 'cantik', isUser: false));
        } else if (userMessage == 'tes') {
          _messages.add(Message(text: 'saya akan membantu anda', isUser: false));
        }
        else if (userMessage == 'halo') {
          _messages.add(Message(text: 'apa yang bisa saya bantu?', isUser: false));
        }
        else if (userMessage == 'yoga siapa?') {
          _messages.add(Message(text: 'pacarr selaaa', isUser: false));
        }
      });
    });
  }

  Widget _buildMessage(Message message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.orange : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) => _buildMessage(_messages[index]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: 'Ketik pesan...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _handleSend,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}