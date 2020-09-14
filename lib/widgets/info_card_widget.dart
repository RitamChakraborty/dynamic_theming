import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoCardWidget extends StatelessWidget {
  final String _label;
  final String _text;
  final IconData _icon;

  InfoCardWidget({@required String label, @required String text, @required IconData icon})
      :this._label = label,
        this._text = text,
        this._icon = icon,
  assert(label != null),
        assert(text != null),
        assert(icon != null);

  @override
  Widget build(BuildContext context) {
    var setWidth = () {
      var size = MediaQuery.of(context).size;
      double height = size.height;
      double width = size.width;

      if (height > width) {
        return width * 0.9;
      } else {
        return width * 0.5;
      }
    };

    var title = Text(
      _label,
      style: TextStyle(
        fontSize: 20,
        fontFamily: "Open Sans",
      ),
    );

    var subtitle = Text(
      _text,
      style: TextStyle(
        color: Theme.of(context).accentColor,
        fontSize: 18,
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SizedBox(
          width: setWidth(),
          child: ListTile(
            title: title,
            subtitle: subtitle,
            leading: Icon(_icon, color: Theme.of(context).primaryColor,),
          ),
        ),
      ),
    );
  }
}
