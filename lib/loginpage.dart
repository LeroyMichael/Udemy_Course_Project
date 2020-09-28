import 'homepage.dart';
import 'package:flutter/material.dart';
import 'customscrollbehavior.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  void doLogin()
  {
    if(_controllerUsername.text.length == 0 || _controllerPassword.text.length == 0)
    {
      showDialog(
          context: context,
          builder: (context)
          {
            return AlertDialog(
              title: Text('Oops!'),
              content: Text('Username & Password must be filled in!'),
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

    //lakukan simulasi login
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
                    child: Text('Logging in',
                      textAlign: TextAlign.center,
                    )
                ),
              ],
            ),
          );
        }
    );

    //navigasi ke halaman berikutnya
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
    // SingleChildScrollView merupakan sebuah Widget "wadah/container"
    // yang memungkinkan widget-widget yang ada didalamnya tetap ditampung
    // meskipun resolusi layar tidak cukup dalam menampung widget-widget tersebut.
    // Sesuai namanya, SingleChildScrollView menyajikan widget-widget tersebut
    // kedalam "wadah" yang dapat discroll.
    // Widget ini sering sekali digunakan untuk mencegah RenderOverflow pada tampilan
    // ketika aplikasi sedang digunakan oleh user, misalkan saja ketika user hendak
    // melakukan input berupa text dimana resolusi display menjadi lebih kecil karena
    // munculnya keyboard virtual pada display.

    // ScrollConfiguration adalah Widget yang memungkinkan developer
    // untuk memodifikasi "material-material" yang ada pada saat user melakukan
    // scroll pada aplikasi. Contohnya adalah efek glow pada aplikasi ketika
    // user melakukan scroll hingga paling atas/bawah dari sebuah list.
    // Untuk proyek ini, "Material-material" yang disebut sebagai ScrollBehavior
    // telah dideklarasi didalam class MyBehavior. Modifikasi yang dideklarasi
    // pada class ini adalah penghilangan efek "glow" ketika scroll dilakukan pada
    // aplikasi.

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
                        child: Text('Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Mont'
                          ),
                        ),
                      ),
                    ),
                    onPressed: doLogin,
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
