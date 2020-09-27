import 'package:dynamic_theming/widgets/info_card_widget.dart';
import 'package:dynamic_theming/widgets/name_widget.dart';
import 'package:dynamic_theming/widgets/profession_widget.dart';
import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final _name = NameWidget(name: "Ritam Chakraborty");

  final _profession = ProfessionWidget(
    profession: "Flutter Developer",
  );

  final _address = InfoCardWidget(
    label: "Address",
    text: "Minapore, India",
    icon: Icons.map,
  );

  final _phone = InfoCardWidget(
    label: "Phone No",
    text: "+91 987 6453 210",
    icon: Icons.add,
  );

  final _email = InfoCardWidget(
    label: "Email",
    text: "ritamchakraborty@gmail.com",
    icon: Icons.email,
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final backgroundPicture = Container(
      height: size.height * 0.5,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: Image.asset(
            "images/wallpaper.jpg",
          ).image,
        ),
      ),
    );

    final cards = Container(
      height: size.height,
      margin: EdgeInsets.only(top: size.height * 0.4),
      child: Container(
        height: size.height * 0.6,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: size.height * 0.1),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          boxShadow: [
            BoxShadow(
              offset: Offset(-5, -5),
              color: Theme.of(context).shadowColor.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: SizedBox.expand(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [_phone, _email, _address],
            ),
          ),
        ),
      ),
    );

    final avatar = Container(
      height: size.height * 0.5,
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(size.height * 0.1),
        child: Container(
          color: Colors.white,
          child: Container(
            height: size.height * 0.2,
            width: size.height * 0.2,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: Image.asset("images/profile_picture.jpeg").image,
              ),
            ),
          ),
        ),
      ),
    );

    final texts = Container(
      height: size.height * 0.4,
      width: size.width,
      padding: EdgeInsets.only(top: 32.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _name,
          SizedBox(height: 16),
          _profession,
        ],
      ),
    );

    return Container(
      height: size.height,
      child: Stack(
        fit: StackFit.loose,
        children: [
          backgroundPicture,
          cards,
          avatar,
          texts,
        ],
      ),
    );
  }
}
