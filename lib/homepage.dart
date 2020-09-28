import 'package:flutter/material.dart';
import 'BottomNavigationBarDisplay/FirstPage.dart';
import 'BottomNavigationBarDisplay/SecondPage.dart';
import 'BottomNavigationBarDisplay/ThirdPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username;
  int selectedIndex;
  List<Widget> listPage;
  List<String> listTitleAppBar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedIndex = 0;
  }

  // Untuk melakukan passing data username yang diterima dari halaman sebelumnya
  // ke halaman Settings, didalam proyek ini sudah dideklarasikan pada bagian
  // constructor dari ThirdPage.
  // Jadi untuk melakukan passing data, cukup deklarasikan pada saat Objek tersebut dibuat.
  // Contoh: ThirdPage(username: username)

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    username = ModalRoute.of(context).settings.arguments;
    listTitleAppBar = List<String>();
    listTitleAppBar.add('Home - ' + username);
    listTitleAppBar.add('Contacts');
    listTitleAppBar.add('Settings');

    listPage = List<Widget>();
    listPage.add(FirstPage());
    listPage.add(SecondPage());
    listPage.add(ThirdPage(username: username));
  }

  //method untuk menampilkan dialog konfirmasi logout
  //ketika user menekan tombol back
  Future<bool> onWillPop() async {
    bool flag = await showDialog(
        context: context,
        builder: (context)
        {
          return AlertDialog(
            title: Text('Confirmation'),
            content: Text('Are you sure want to logout?'),
            actions: <Widget>[
              FlatButton(
                child: Text('No'),
                onPressed: () => Navigator.pop(context, false),
              ),
              FlatButton(
                child: Text('Yes'),
                onPressed: () => Navigator.pop(context, true),
              )
            ],
          );
        }
    );
    return Future.value(flag);
  }

  void onTap(int index)
  {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope merupakan Widget yang memungkinkan
    // developer untuk mendeklarasikan proses yang akan
    // dijalankan sesaat sebelum program menjalankan Navigator.pop(context)
    // (biasanya hal ini terjadi apabila user menekan tombol "back"
    // pada aplikasi)
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(listTitleAppBar[selectedIndex],
            style: TextStyle(
                fontFamily: 'Mont'
            ),
          ),
          leading: Container(),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
        ),
        body: listPage[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTap,
          currentIndex: selectedIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home',
              style: TextStyle(
                  fontFamily: 'Mont',
                  fontSize: 12
                ),
              )
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.contacts),
                title: Text('Contacts',
                  style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 12
                  ),
                )
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings',
                  style: TextStyle(
                      fontFamily: 'Mont',
                      fontSize: 12
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
