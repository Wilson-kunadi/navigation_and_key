import 'package:flutter/material.dart';

class homePage extends StatelessWidget {
  final String name, email, mobile, collegeName;
  homePage(
      {Key key, @required this.name, this.email, this.mobile, this.collegeName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image(
                width: 100,
                height: 100,
                image: AssetImage("images/mascot.png"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.02,
              ),
              child: listTileBody("Name", this.name, Icon(Icons.person)),
            ),
            Divider(thickness: 2),
            listTileBody("Email", this.email, Icon(Icons.mail_outline)),
            Divider(thickness: 2),
            listTileBody("mobile", this.mobile, Icon(Icons.phone_android)),
            Divider(thickness: 2),
            listTileBody("College Name", this.collegeName, Icon(Icons.school)),
          ],
        ),
      ),
    );
  }

  ListTile listTileBody(String title, String subtitle, Widget icons) {
    return ListTile(
      leading: CircleAvatar(
        child: icons,
      ),
      title: Text(title),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        style: TextStyle(),
      ),
    );
  }
}
