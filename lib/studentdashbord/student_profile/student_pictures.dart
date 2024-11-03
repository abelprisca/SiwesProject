import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class SIWESUploadScreen extends StatefulWidget {
  const SIWESUploadScreen({super.key});

  @override
  _SIWESUploadScreenState createState() => _SIWESUploadScreenState();
}

class _SIWESUploadScreenState extends State<SIWESUploadScreen> {
  final List<String> _dates = [];
  final List<String> _descriptions = [];
  final List<File> _images = [];
  final ImagePicker _picker = ImagePicker();

  Future<void> _uploadImage() async {
    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _images.add(File(pickedFile.path));
        _descriptions.add(''); // Placeholder for description
        _dates.add(DateTime.now().toString()); // Store current date and time
      });
    }
  }

  void _updateDescription(int index, String value) {
    setState(() {
      _descriptions[index] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Share Your SIWES Experience',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Document your journey during your industrial training. '
              'Upload pictures that capture your experiences, '
              'and provide descriptions to reflect on what you learned. '
              'Let your story inspire others!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Upload Picture'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.file(
                          _images[index],
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'Description',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) => _updateDescription(index, value),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Uploaded on: ${_dates[index]}',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}