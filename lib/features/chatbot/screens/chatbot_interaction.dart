// lib/features/chatbot/screens/chatbot_interaction_screen.dart
import 'package:flutter/material.dart';
//import 'package:welb/features/chatbot/services/chatbot_service.dart';

class ChatbotInteractionScreen extends StatefulWidget {
  const ChatbotInteractionScreen({super.key});

  @override
  State<ChatbotInteractionScreen> createState() => _ChatbotInteractionScreenState();
}

class _ChatbotInteractionScreenState extends State<ChatbotInteractionScreen> {
  final _textController = TextEditingController();
  final _scrollController = ScrollController();
  //final ChatbotService _chatbotService = ChatbotService();
  List<ChatMessage> _messages = [];

  void _sendMessage() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _messages.add(ChatMessage(text: _textController.text, isUser: true));
        _textController.clear();
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      });

      // Simulate chatbot response
      Future.delayed(const Duration(seconds: 1), () {
        setState(() {

          /*_messages.add(
            ChatMessage(
              text: _chatbotService.generateResponse(_messages.last.text),
              isUser: false,
            ),
          );*/


          _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat with Uzima'),
        actions: [
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: () {
              // Escalate to human support
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Connecting to human support...')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(message.text),
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({required this.text, required this.isUser});
}