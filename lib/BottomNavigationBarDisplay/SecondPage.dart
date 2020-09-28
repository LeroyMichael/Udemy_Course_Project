import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> listName;

  Widget itemList({String caption, ImageProvider imageProvider, void Function() onPressed})
  {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: CircleAvatar(
                    backgroundColor: Colors.amberAccent,
                    radius: 22,
                    backgroundImage: imageProvider
                ),
              ),
              Text(caption,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Mont'
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listName = List<String>();
    for(int i = 0; i < 20; i++)
      listName.add('Person ' + (i+1).toString());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index)
        {
          return itemList(
            caption: listName[index],
            onPressed: (){},
            imageProvider: AssetImage('assets/person.png')
          );
        },
        separatorBuilder: (context, index)
        {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: Colors.black38,
            ),
          );
        },
        itemCount: listName.length,
    );
  }
}
