import 'package:flutter/material.dart';
import 'package:mysignup_app/homepage.dart';

class page extends StatefulWidget {
  @override
  _pageState createState() => _pageState();
}

class _pageState extends State<page> {
  GlobalKey<FormState> _key = GlobalKey();
  bool _autovalidate = false;
  String names, email, mobile, collegeName, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Form(
        key: _key,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                ),
                Image(
                  image: AssetImage("images/mascot.png"),
                  width: 100,
                  height: 100,
                ),
                buildLoginTile(
                    inputfieldtype: "Name",
                    icons: Icon(Icons.person),
                    inputVar: (input) => this.names = input),
                buildLoginTile(
                    inputfieldtype: "Password",
                    icons: Icon(Icons.mail_outline),
                    inputVar: (input) => this.email = input,
                    obscure: true),
                buildLoginTile(
                    inputfieldtype: "Email",
                    icons: Icon(Icons.mail_outline),
                    inputVar: (input) => this.email = input),
                buildLoginTile(
                    inputfieldtype: "Mobile",
                    icons: Icon(Icons.phone_android),
                    inputVar: (String input) => this.mobile = input),
                buildLoginTile(
                    inputfieldtype: "College Name",
                    icons: Icon(Icons.school),
                    inputVar: (String input) => this.collegeName = input),
                SizedBox(
                  height: 25,
                ),
                ButtonTheme(
                  buttonColor: Colors.deepPurple,
                  height: 40,
                  minWidth: 200,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    onPressed: () {
                      _sendtonextscreen();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _sendtonextscreen() {
    if (_key.currentState.validate()) {
      _key.currentState.save();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => homePage(
            name: this.names,
            email: this.email,
            mobile: this.mobile,
            collegeName: this.collegeName,
          ),
        ),
      );
    } else {
      setState(() {
        _autovalidate = true;
      });
    }
  }

  ListTile buildLoginTile({
    String inputfieldtype,
    Widget icons,
    Function inputVar,
    bool obscure = false,
  }) {
    return ListTile(
      // leading: Icon(Icons.person),
      title: TextFormField(
        validator: (input) {
          return input.isEmpty ? 'Enter $inputfieldtype' : null;
          // if (input.isEmpty) {
          //   return 'enter $inputfieldtype';
          // }
        },
        obscureText: obscure,
        decoration: InputDecoration(
          labelText: inputfieldtype,
          icon: icons,
        ),
        onSaved: inputVar,
      ),
    );
  }
}
