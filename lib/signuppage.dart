import 'package:flutter/material.dart';
import 'customscrollbehavior.dart';
import 'homepage.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController _controllerUsername;
  TextEditingController _controllerPassword;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controllerUsername = TextEditingController();
    _controllerPassword = TextEditingController();
  }

  @override
  void dispose() {
    _controllerUsername.dispose();
    _controllerPassword.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  //method untuk memeriksa apakah sebuah string merupakan alphanumeric
  //jika alphanumeric maka return true
  //jika bukan alphanumeric maka return false
  bool isAlphanumeric(String word)
  {
    final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
    return validCharacters.hasMatch(word);
  }

  bool isUsernameValid()
  {
    if(_controllerUsername.text.length < 3 || _controllerPassword.text.length > 10)
      return false;
    if(isAlphanumeric(_controllerUsername.text))
      return true;
    return false;
  }

  void doSignUp()
  {
    //validasi username
    if(!isUsernameValid())
    {
      showDialog(
          context: context,
          builder: (context)
          {
            return AlertDialog(
              title: Text('Oops!'),
              content: Text('Username must be alphanumeric with at least 3 characters and at most 10 characters'),
              actions: <Widget>[
                FlatButton(
                  child: Text('I got it'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            );
          }
      );
      return;
    }

    //validasi password
    if(_controllerPassword.text.length < 3)
    {
      showDialog(
          context: context,
          builder: (context)
          {
            return AlertDialog(
              title: Text('Oops!'),
              content: Text('Password must be at least 3 characters'),
              actions: <Widget>[
                FlatButton(
                  child: Text('I got it'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            );
          }
      );
      return;
    }

    //lakukan simulasi signup
    showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            content: Row(
              children: <Widget>[
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.lightBlue),
                ),
                Expanded(
                    child: Text('Registering.\nPlease wait a moment.',
                      textAlign: TextAlign.center,
                    )
                ),
              ],
            ),
          );
        }
    );

    //navigasi ke halaman home setelah signup
    Future.delayed(Duration(seconds: 4),()
    {
      Navigator.pushReplacement(context, PageRouteBuilder(
          pageBuilder: (context, firstAnimation, secondAnimation)
          {
            return HomePage();
          },
          settings: RouteSettings(
              arguments: _controllerUsername.text
          )
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScrollConfiguration(
        behavior: MyBehavior(),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                    tag: 'logo',
                    child: Image.asset('assets/logo.jpg')
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Text('Username',
                          style: TextStyle(
                              fontSize: 18
                          ),
                        )
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                  child: TextField(
                    controller: _controllerUsername,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 25),
                    child: Container(
                        width: MediaQuery.of(context).size.width - 100,
                        child: Text('Password',
                          style: TextStyle(
                              fontSize: 18
                          ),
                        )
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50, top: 10),
                  child: TextField(
                    controller: _controllerPassword,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                    ),
                    obscureText: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: RaisedButton(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 130,
                      height: 50,
                      child: Center(
                        child: Text('Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Mont'
                          ),
                        ),
                      ),
                    ),
                    onPressed: doSignUp,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
