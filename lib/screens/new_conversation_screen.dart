import 'package:flutter/material.dart';

class NewConversationScreen extends StatefulWidget {
  const NewConversationScreen({super.key});

  @override
  State<NewConversationScreen> createState() => _NewConversationScreenState();
}

class _NewConversationScreenState extends State<NewConversationScreen> {
  final TextEditingController _fromController = TextEditingController();
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _messageController = TextEditingController(); // New controller for the message
  String _selectedOption = 'Send'; // Dropdown value

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _messageController.dispose(); // Dispose the new controller
    super.dispose();
  }

  void _sendMessage() {
    // Here you can define what happens when the button is pressed
    String from = _fromController.text;
    String to = _toController.text;
    String message = _messageController.text; // Get the message text

    // You might want to do something with the values (e.g., save, send, etc.)
    print('From: $from');
    print('To: $to');
    print('Message: $message');
    print('Selected Option: $_selectedOption');

    // Perform action based on selected dropdown option
    if (_selectedOption == 'Send and close') {
      // Handle send and close
      Navigator.pop(context); // Go back to the previous screen
    } else if (_selectedOption == 'Send later') {
      // Handle send later logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message scheduled to send later.')),
      );
    } else {
      // Default action for 'Send'
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Message sent!')),
      );
    }
  }

  void _deleteMessage() {
    // Clear all text fields
    _fromController.clear();
    _toController.clear();
    _messageController.clear();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Message deleted.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('New Conversation'),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16.0),
                TextField(
                  controller: _fromController,
                  decoration: const InputDecoration(
                    labelText: 'From',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _toController,
                  decoration: const InputDecoration(
                    labelText: 'To',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.topRight,
                  child: DropdownButton<String>(
                    value: _selectedOption,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption = newValue!;
                      });
                    },
                    items: <String>['Send', 'Send and close', 'Send later']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: _messageController,
                  maxLines: 4, // Increased height for message box
                  decoration: const InputDecoration(
                    labelText: 'Type a message...',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Delete Button
          FloatingActionButton(
            onPressed: _deleteMessage,
            backgroundColor: Colors.white,
            child: const Icon(Icons.delete,color: Colors.black), // Delete icon
          ),
          const SizedBox(width: 16), // Spacing between buttons
          // Send Button
          FloatingActionButton(
            onPressed: _sendMessage,
            backgroundColor: Colors.white,
            child: const Icon(Icons.send, color: Colors.black), // Send icon
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
