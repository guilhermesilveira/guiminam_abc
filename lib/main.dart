import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Guiminam ABC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Guiminam ABC'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: _buildAllLetters(context),
        ),
      ),
    );
  }

  List<Widget> _buildAllLetters(BuildContext context) {
    var widgets = List<Widget>();
    var fotos = {
      "f": "fonte.jpg",
      "l": "livro.jpg",
      "b": "bolo.jpg",
      "t": "totoro.jpg",
      "p": "pajeon.jpg",
      "m": "mandu.jpg",
      "j": "jardim.jpg",
    };
    for (String letra in fotos.keys) {
      var foto = fotos[letra];
      widgets.add(InkWell(
          child: _buildLetter(letra),
          onTap: () {
            _navigateTo(context, letra, foto);
          }));
    }
    return widgets;
  }

  Widget _buildLetter(String letra) {
    var texto = Text(
      letra.toUpperCase(),
      style: const TextStyle(fontSize: 24, color: Colors.white),
    );
    return Container(
        padding: const EdgeInsets.all(10),
        child: FittedBox(
          fit: BoxFit.contain,
          child: texto,
        ),
        color: Colors.teal[400]);
  }

  void _navigateTo(BuildContext context, String letra, String foto) {
    Navigator.push(context,
        MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text(letra)),
        body: Center(
          child: LetterWidget(foto),
        ),
      );
    }));
  }
}

class LetterWidget extends StatelessWidget {
  final String _foto;

  LetterWidget(this._foto);

  @override
  Widget build(BuildContext context) {
    final uri = "assets/images/$_foto";
    print(uri);
    return Image(image: AssetImage(uri));
  }
}
