import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NameListTile extends StatelessWidget {
  final Color color;
  final String name;
  final String role;
  const NameListTile({
    Key? key,
    required this.color,
    required this.name,
    required this.role,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      contentPadding: EdgeInsets.all(0),
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.solidCircle,
            color: color,
            size: 12,
          ),
        ],
      ),
      title: Transform.translate(
        offset: Offset(-38, 0),
        child: Text(
          name,
          maxLines: 1,
          // minFontSize: 9,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: color, fontSize: 11),
        ),
      ),
      trailing: Text(
        role,
        maxLines: 1,
        // minFontSize: 9,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w300,
          fontSize: 9,
        ),
      ),
    );
  }
}
