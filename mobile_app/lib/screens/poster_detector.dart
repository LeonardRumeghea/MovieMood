import 'dart:io';

import 'package:mobile_app/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PosterDetector extends StatefulWidget {
  const PosterDetector({super.key});

  @override
  State<PosterDetector> createState() => _PosterDetectorState();
}

class _PosterDetectorState extends State<PosterDetector> {
  late File _loadedImage;
  bool _isImageLoaded = false;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Poster Detection'),
          backgroundColor: accentColor,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _showOptions,
          backgroundColor: accentColor,
          child: const Icon(Icons.add_a_photo, color: Colors.white),
        ),
        body: Center(
          child: Container(
            child: _isImageLoaded
                ? Container(
                    height: screenSize.height * 0.5,
                    width: screenSize.width * 0.7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          spreadRadius: 10,
                        )
                      ],
                      image: DecorationImage(
                        image: Image.file(
                          _loadedImage,
                          height: screenSize.height * 0.5,
                          width: screenSize.width * 0.7,
                        ).image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : const Text('Image not loaded',
                    style: TextStyle(fontSize: 20, fontFamily: 'Roboto')),
          ),
        ));
  }

  Future _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _loadedImage = File(pickedFile.path);
        _isImageLoaded = true;
      });
    }
  }

  Future _showOptions() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        title: const Text('Load image:'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(thickness: 1),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _getImage(ImageSource.gallery);
              },
              child: const Text(
                'Chose from Library',
                style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _getImage(ImageSource.camera);
              },
              child: const Text(
                'Take image',
                style: TextStyle(fontSize: 20, fontFamily: 'Roboto'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
