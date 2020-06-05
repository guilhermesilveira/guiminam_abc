import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guiminamabc/widgets/letter.dart';
import 'package:guiminamabc/widgets/photo.dart';

class Letters extends StatelessWidget {

  final _player = AudioCache();

  @override
  Widget build(BuildContext context) {
    AudioPlayer.logEnabled = true;
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: _buildAllLetters(context),
    );
  }

  List<Widget> _buildAllLetters(BuildContext context) {
    var widgets = List<Widget>();
    var fotos = {
      "f": "fonte",
      "l": "livro",
      "b": "bolo",
      "t": "totoro",
      "p": "pajeon",
      "m": "mandu",
      "j": "jardim",
    };
    for (String letra in fotos.keys) {
      var foto = fotos[letra];
      widgets.add(InkWell(
          child: Letter(letra),
          onTap: () {
            _navigateTo(context, letra, foto);
          }));
    }
    return widgets;
  }

  void _navigateTo(BuildContext context, String letra, String nome) {
    _player.play('audios/$nome.mp3');
    Navigator.push(context,
        MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(letra)),
        body: Center(
          child: Photo("$nome.jpg"),
        ),
      );
    }));
  }
}
