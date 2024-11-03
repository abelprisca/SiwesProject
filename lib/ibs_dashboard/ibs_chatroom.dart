import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class IBSChatRoomScreen extends StatefulWidget {
  @override
  _IBSChatRoomScreenState createState() => _IBSChatRoomScreenState();
}

class _IBSChatRoomScreenState extends State<IBSChatRoomScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final DateFormat _dateFormat = DateFormat('yyyy-MM-dd HH:mm'); // Format for date and time

  Future<void> _selectDocument() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.any);
    if (result != null && result.files.isNotEmpty) {
      final file = File(result.files.single.path!);
      final fileName = result.files.single.name;
      await _uploadDocument(file, fileName);
    }
  }

  Future<void> _uploadDocument(File file, String fileName) async {
    final request = http.MultipartRequest('POST', Uri.parse('http://your-backend-url/upload'));
    request.files.add(await http.MultipartFile.fromPath('file', file.path, filename: fileName));
    
    final response = await request.send();
    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      final filePath = responseData; // Replace with actual JSON parsing for file URL
      setState(() {
        _messages.add({
          'text': '📄 $fileName', // Display file name
          'time': _dateFormat.format(DateTime.now()), // Display current date and time
          'filePath': filePath, // Store file URL for later access
        });
      });
    } else {
      print("File upload failed");
    }
  }

  void _sendMessage() {
    if (_messageController.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'text': _messageController.text.trim(),
        'time': _dateFormat.format(DateTime.now()), // Format message timestamp
      });
    });
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chatroom")),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: message.containsKey('filePath') ? Colors.green[100] : Colors.blue[100],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Add download/view file logic here
                            },
                            child: Text(
                              message['text']!,
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            message['time']!, // Display formatted time
                            style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.attach_file, color: const Color.fromARGB(255, 10, 83, 143)),
                  onPressed: _selectDocument,
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: Colors.blue),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
