import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Widget> listPartner;
  List<Widget> listOffers;
  List<Widget> listNews;
  List<Widget> listCharity;

  //widget item pada setiap GridView
  Widget customTile(Image image, String caption)
  {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)
              ),
              border: Border.all(
                  color: Colors.grey
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              image,
              Text(caption,
                style: TextStyle(
                  fontSize: 14
                ),
                overflow: TextOverflow.ellipsis,
                //overflow adalah atribut pengaturan dimana ketika ukuran text melebihi
                //ruang yang ada
              )
            ],
          ),
        ),
      ),
    );
  }

  //widget IconButton yang sudah di custom
  Widget customIcon({IconButton iconButton, String caption})
  {
    return Container(
      width: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Column(
          children: <Widget>[
            iconButton,
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 10
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listPartner = List<Widget>();
    listOffers = List<Widget>();
    listNews = List<Widget>();
    listCharity = List<Widget>();
    for(int i = 0; i < 5; i++){
      listPartner.add(customTile(Image.asset('assets/resto.jpg'), 'Partner ' + (i+1).toString()));
      listOffers.add(customTile(Image.asset('assets/offer.jpg'), 'Offers ' + (i+1).toString()));
      listNews.add(customTile(Image.asset('assets/news.png'), 'News ' + (i+1).toString()));
      listCharity.add(customTile(Image.asset('assets/charity.jpg'), 'Charity ' + (i+1).toString()));
    }

  }

  @override
  Widget build(BuildContext context) {
    // Hint:
    // Bagian Partner, Offers, News, dan Charity dibuat menggunakan GridView.builder
    // dengan menambahkan atribut berupa scrollDirection.
    // Tempatkan GridView.builder pada Container dan deklarasikan
    // atribut height pada Container agar mencegah adanya error berupa
    // "Horizontal viewport was given unbounded height" pada saat Flutter
    // melakukan render GridView, mengingat lebar dari GridView secara default
    // menyesuaikan dengan parent Widget-nya.
    //
    // Contoh:
    // Container(
    //    height: 150,
    //    child: GridView.builder(
    //      ...
    //    )
    // )


    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: 125,
            color: Colors.lightBlue,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.grey
                    )
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          customIcon(
                            iconButton: IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.payment, color: Colors.redAccent,)
                            ),
                            caption: 'Payment'
                          ),
                          customIcon(
                            iconButton: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.laptop, color: Colors.orangeAccent,)
                            ),
                            caption: 'Conference'
                          ),
                          customIcon(
                            iconButton: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.phone, color: Colors.lightGreen,)
                            ),
                            caption: 'Call'
                          ),
                          customIcon(
                              iconButton: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.email, color: Colors.grey,)
                              ),
                              caption: 'Email'
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          customIcon(
                            iconButton: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.group, color: Colors.green,)
                            ),
                            caption: 'Messenger'
                          ),
                          customIcon(
                              iconButton: IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.thumb_up, color: Colors.blueAccent,)
                              ),
                              caption: 'Favourite'
                          ),
                          customIcon(
                              iconButton: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.history, color: Colors.orangeAccent,)
                              ),
                              caption: 'History'
                          ),
                          customIcon(
                              iconButton: IconButton(
                                onPressed: (){},
                                icon: Icon(Icons.more_horiz, color: Colors.grey,)
                              ),
                              caption: 'More'
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                      color: Colors.grey
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Partners near me',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 115,
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              mainAxisSpacing: 15,
                            ),
                            itemBuilder: (context, index)
                            {
                              return listPartner[index];
                            },
                            itemCount: listPartner.length,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Colors.grey
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Offers',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 125,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 15,
                              ),
                              itemBuilder: (context, index)
                              {
                                return listOffers[index];
                              },
                              itemCount: listOffers.length,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Colors.grey
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('News',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 140,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 15,
                              ),
                              itemBuilder: (context, index)
                              {
                                return listNews[index];
                              },
                              itemCount: listNews.length,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width - 40,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: Colors.grey
                        )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Charity',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            height: 110,
                            child: GridView.builder(
                              scrollDirection: Axis.horizontal,
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 15,
                              ),
                              itemBuilder: (context, index)
                              {
                                return listCharity[index];
                              },
                              itemCount: listCharity.length,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),
            ],
          )
        ],
      ),
    );
  }
}
