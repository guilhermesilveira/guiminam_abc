
import 'package:flutter/widgets.dart';

class Photo extends StatelessWidget {
  final String _foto;

  Photo(this._foto);

  @override
  Widget build(BuildContext context) {
    final uri = "assets/images/$_foto";
    print(uri);
    return Image(image: AssetImage(uri));
  }
}
