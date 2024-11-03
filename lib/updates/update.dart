import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Feed App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NewsFeedScreen(),
    );
  }
}

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  final List<Post> _posts = []; // List to hold posts
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();
  XFile? _image; // Variable to hold selected image
  Color _bgColor = Colors.white; // Default background color
  Color _textColor = Colors.black; // Default text color

  // Categories related to SIWES
  final List<String> _categories = [
    'Internship',
    'Project',
    'Research',
    'Workshop',
    'Seminar',
    'Learning',
    'Fun',
    'Experience',
    'Networking'
  ];
  
  String? _selectedCategory;

  // Function to add a new post
  void _addPost() {
    if (_contentController.text.isNotEmpty || _image != null) {
      setState(() {
        _posts.add(Post(
          category: _selectedCategory ?? 'General',
          userId: 'User123', // Placeholder for user ID
          content: _contentController.text,
          imageUrl: _image?.path, // Use path as image URL for local display
          bgColor: _bgColor,
          textColor: _textColor,
          timestamp: DateTime.now(),
        ));
        // Clear the input fields
        _contentController.clear();
        _image = null;
        _bgColor = Colors.white; // Reset background color
        _textColor = Colors.black; // Reset text color
        _selectedCategory = null; // Reset selected category
      });
    }
  }

  // Function to pick an image from gallery
  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? selectedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = selectedImage;
    });
  }

  // Function to select background color
  void _selectBgColor(Color color) {
    setState(() {
      _bgColor = color;
    });
  }

  // Function to select text color
  void _selectTextColor(Color color) {
    setState(() {
      _textColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News Feed')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Category',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {}); // Update the UI on search input change
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                if (_searchController.text.isNotEmpty &&
                    !_posts[index].category.toLowerCase().contains(_searchController.text.toLowerCase())) {
                  return Container(); // Skip this post if it doesn't match the search query
                }
                return Card(
                  margin: EdgeInsets.all(8.0),
                  color: _posts[index].bgColor,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Category: ${_posts[index].category}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey)),
                        SizedBox(height: 4),
                        Text('Posted by ${_posts[index].userId}', style: TextStyle(color: Colors.grey)),
                        SizedBox(height: 8),
                        Text(_posts[index].content, style: TextStyle(color: _posts[index].textColor)),
                        SizedBox(height: 8),
                        if (_posts[index].imageUrl != null)
                          Image.file(File(_posts[index].imageUrl!), height: 150, fit: BoxFit.cover),
                        SizedBox(height: 8),
                        Text(_posts[index].timestamp.toString(), style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                DropdownButtonFormField<String>(
                  hint : Text('Select Category'),
                  value :_selectedCategory,
                  items :_categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value :category,
                      child :Text(category),
                    );
                  }).toList(),
                  onChanged :(value){
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
          ),
          Padding(
            padding:
                const EdgeInsets.all(8.0),
            child:
                TextField(
                  controller :_contentController,
                  decoration :InputDecoration(labelText :'What\'s on your mind?'),
                  maxLines :3,
                ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal :8.0),
            child:
                Row(mainAxisAlignment :MainAxisAlignment.spaceBetween ,
                  children : [
                    Column(
                      crossAxisAlignment :CrossAxisAlignment.start,
                      children : [
                        Text('Background Color:', style :TextStyle(fontSize :16)),
                        Row(
                          children:[
                            GestureDetector(
                              onTap :()=>_selectBgColor(Colors.red),
                              child :Container(width :30,height :30,color :Colors.red),
                            ),
                            SizedBox(width :8),
                            GestureDetector(
                              onTap :()=>_selectBgColor(Colors.green),
                              child :Container(width :30,height :30,color :Colors.green),
                            ),
                            SizedBox(width :8),
                            GestureDetector(
                              onTap :()=>_selectBgColor(Colors.blue),
                              child :Container(width :30,height :30,color :Colors.blue),
                            ),
                            SizedBox(width :8),
                            GestureDetector(
                              onTap :()=>_selectBgColor(Colors.yellow),
                              child :Container(width :30,height :30,color :Colors.yellow),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment :CrossAxisAlignment.start,
                      children:[
                        Text('Text Color:', style :TextStyle(fontSize :16)),
                        Row(
                          children:[
                            GestureDetector(
                              onTap :()=>_selectTextColor(Colors.black),
                              child :Container(width :30,height :30,color :Colors.black),
                            ),
                            SizedBox(width :8),
                            GestureDetector(
                              onTap :()=>_selectTextColor(Colors.white),
                              child :Container(width :30,height :30,color :Colors.white),
                            ),
                            SizedBox(width :8),
                            GestureDetector(
                              onTap :()=>_selectTextColor(Colors.grey),
                              child :Container(width :30,height :30,color :Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    )
                  ]
                )
          ),

          Padding(
            padding:
                const EdgeInsets.all(8.0),
            child:
                ElevatedButton(onPressed:_addPost ,child :Text('Post')),
          )
        ],
      ),
    );
  }
}

// Post model class
class Post {
  final String category;
  final String userId;
  final String content;
  final String? imageUrl;
  final Color bgColor;
  final Color textColor; // Added text color property
  final DateTime timestamp;

  Post({required this.category, required this.userId, required this.content, this.imageUrl, required this.bgColor, required this.textColor, required this.timestamp});
}