import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  //deklarasi parameter yang dibuat pada constructor ThirdPage
  //parameter yang diterima berupa "username"
  String username;
  ThirdPage({Key key, this.username}) : super(key: key);

  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  bool flagSwitch;
  String usernameID;
  String displayName;

  // Hint:
  // Didalam class State ini, gunakan syntax "widget.username"
  // untuk mengakses variabel "username" pada widget ThirdPage.
  // Contoh:
  //    String ID;
  //    ID = widget.username;

  void initState()
  {
    super.initState();
    flagSwitch = false;
    usernameID = widget.username;
    displayName = widget.username;
  }

  //widget item Setting menggunakan Switcher
  Widget itemSettingWithSwitcher({String itemTitle, String description, void Function () onPressed, void Function() switcherOnChanged})
  {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(itemTitle,
                  style: TextStyle(fontSize: 16),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(description,
                  style: TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                )
              ],
            ),
          ),
          Switch(
            value: flagSwitch,
            activeColor: Colors.blueAccent,
            onChanged: (value)
            {
              setState(() {
                flagSwitch = value;
              });

              // method switcherOnChanged adalah method yang dijalankan
              // ketika switch berubah
              // method ini bisa di deklarasikan untuk
              // kepentingan seperti update status switch pada server
              if(switcherOnChanged == null)
                return;
              switcherOnChanged();
            },
          )
        ],
      ),
    );
  }

  //widget item Setting tanpa Switcher
  Widget itemSetting({String itemTitle, String description, void Function () onPressed})
  {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        height: 50,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(itemTitle,
                      style: TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                    description == null ? Container() :
                    Text(description,
                      style: TextStyle(color: Colors.redAccent),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }

  //widget setting Photo
  Widget photoSetting({void Function () iconOnPressed})
  {
    return Stack(
      children: <Widget>[
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/food.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black26,
            ),
            child: IconButton(
              icon: Icon(Icons.photo_camera, color: Colors.white,),
              onPressed: iconOnPressed,
              iconSize: 20,
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        photoSetting(
            iconOnPressed: () {}
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Colors.transparent),
        ),
        itemSetting(
            itemTitle: 'Your Display Name',
            description: displayName,
            onPressed: () {}
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Colors.black38),
        ),
        itemSetting(
            itemTitle: 'Your username ID',
            description: usernameID,
            onPressed: () {}
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Colors.black38),
        ),
        itemSettingWithSwitcher(
            itemTitle: 'Allow New Invitation',
            description: 'When turned off, you are not be able to receive any invitations',
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Colors.black38),
        ),
        itemSetting(
            itemTitle: 'Announcement',
            onPressed: (){}
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Colors.black38),
        ),
        itemSetting(
            itemTitle: 'Export My Reference',
            onPressed: (){}
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Colors.black38),
        ),
        itemSetting(
            itemTitle: 'Log Out',
            onPressed: (){}
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(color: Colors.black38),
        ),
      ],
    );
  }
}
