import 'loginpage.dart';
import 'signuppage.dart';
import 'package:flutter/material.dart';

//merupakan halaman pertama yang tampil pada saat aplikasi tampil
class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Image.asset('assets/logo.jpg')
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: RaisedButton(
                child: Container(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 50,
                  child: Center(
                    child: Text('I have an account',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Mont'
                      ),
                    ),
                  ),
                ),
                onPressed: ()
                {
                  Navigator.push(context, PageRouteBuilder(
                    pageBuilder: (context, firstAnimation, secondAnimation)
                    {
                      return LoginPage();
                    },
                    transitionDuration: Duration(milliseconds: 750)
                  ));
                },
                color: Colors.blueAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 10),
                    child: Text('Don\'t have an account?'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: InkWell(
                      onTap: ()
                      {
                        Navigator.push(context, PageRouteBuilder(
                            pageBuilder: (context, firstAnimation, secondAnimation)
                            {
                              return SignUpPage();
                            },
                            transitionDuration: Duration(milliseconds: 750)
                        ));
                      },
                      child: Text('Sign Up',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
