import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TextComposer extends StatefulWidget {
  const TextComposer({Key? key, required this.sendMessage}) : super(key: key);

  final Function({String text, File imgFile}) sendMessage;

  @override
  State<TextComposer> createState() => _TextComposerState();
}

class _TextComposerState extends State<TextComposer> {

  bool _isComposing = false;
  final TextEditingController controller = TextEditingController();

  void _reset(){
    controller.clear();
    setState(() {
      _isComposing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () async{
              File? imgFile;
              ImagePicker imgPicker = ImagePicker();
              var img = await imgPicker.pickImage(source: ImageSource.camera);
              if(img == null) {
                return;
              }
              imgFile = File(img.path);
              widget.sendMessage(imgFile: imgFile);
            },
            icon: const Icon(Icons.photo_camera),
          ),
          Expanded(
            child: TextField(
              controller: controller,
              decoration:
                  const InputDecoration.collapsed(hintText: 'Enviar uma mensagem'),
              onChanged: (text) {
                setState(() {
                  _isComposing = text.isNotEmpty;
                });
              },
              onSubmitted: (text) {
                widget.sendMessage(text: text);
                _reset();
              },
            ),
          ),
          IconButton(
            onPressed: _isComposing ? (){
              widget.sendMessage(text: controller.text);
              _reset();
            } : null,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
