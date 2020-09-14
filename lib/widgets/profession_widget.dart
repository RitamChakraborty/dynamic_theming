import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfessionWidget extends StatelessWidget {
  final String _profession;

  const ProfessionWidget({@required String profession})
      : this._profession = profession,
        assert(profession != null);

  @override
  Widget build(BuildContext context) {
    var professionText = Text(
      _profession.toUpperCase(),
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: 'Yanone Kaffeesatz',
        letterSpacing: 2,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          professionText,
          Container(
            margin: const EdgeInsets.only(top: 8.0),
            color: Theme.of(context).dividerColor,
            height: 2,
            width: 100,
          )
        ],
      ),
    );
  }
}
