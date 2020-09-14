import 'package:flutter/material.dart';

class NameWidget extends StatelessWidget {
  final String _name;

  const NameWidget({@required String name})
      : this._name = name,
        assert(name != null);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        _name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontFamily: 'Pacifico',
        ),
      ),
    );
  }
}
