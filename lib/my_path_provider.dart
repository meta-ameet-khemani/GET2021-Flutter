import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class MyPathProvider extends StatefulWidget {
  final CounterStorage counterStorage;
  MyPathProvider(this.counterStorage);
  @override
  _MyPathProviderState createState() => _MyPathProviderState();
}

class _MyPathProviderState extends State<MyPathProvider> {
  String _fileContent;
  TextEditingController _textEditingController = TextEditingController();

  void readFileContent() {
    widget.counterStorage.readData().then((value) {
      setState(() {
        _fileContent = value;
      });
    });
  }

  void _writeContent() async {
    await widget.counterStorage.writeData(_textEditingController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Path Provider'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$_fileContent'),
              RaisedButton(
                onPressed: readFileContent,
                child: Text('Get File Directory'),
              ),
              TextField(
                controller: _textEditingController,
              ),
              RaisedButton(
                onPressed: _writeContent,
                child: Text('Write to file'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/counter.txt');
  }

  Future<String> readData() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      return contents;
    } catch (error) {
      print('Error in reading file : ${error.toString()}');
      return error.toString();
    }
  }

  Future<File> writeData(String content) async {
    final file = await _localFile;
    return file.writeAsString('$content');
  }
}
