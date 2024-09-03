import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Adicionada importação do http
import 'package:flutter_svg/flutter_svg.dart'; // Adicionada importação do flutter_svg

class AvatarScreen extends StatefulWidget {
  @override
  _AvatarScreenState createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  final TextEditingController _textController = TextEditingController();
  String _avatarSvg = '';

  Future<void> _generateAvatar() async {
    final seed = _textController.text;
    final apiUrl = 'https://api.dicebear.com/9.x/pixel-art/svg?seed=$seed';
    final response = await http.get(Uri.parse(apiUrl));
    final svgString = response.body;
    setState(() {
      _avatarSvg = svgString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generateAvatar,
              child: Text('Generate Avatar'),
            ),
            SizedBox(height: 20),
            _avatarSvg.isNotEmpty
                ? Container(
                    width: 200,
                    height: 200,
                    child: SvgPicture.string(_avatarSvg, fit: BoxFit.contain),
                  )
                : Text('No avatar generated yet'),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: AvatarScreen(),
  ));
}
