import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tri_nethra/screens/CrimeAwareness/WVPage.dart';
import 'package:tri_nethra/screens/root.dart';

class News {
  String url;
  String imgurl;
  String text;
  News({this.url, this.imgurl, this.text});
}

class CarouselDemo extends StatefulWidget {
  CarouselDemo() : super();

  final String title = "Carousel Demo";

  @override
  CarouselDemoState createState() => CarouselDemoState();
}

class CarouselDemoState extends State<CarouselDemo> {
  //
  CarouselSlider carouselSlider;
  int _current = 0;
  List<News> nlist = [
    News(
        text: 'All Police Stations In Hyderabad To Get Cyber Crime Wing',
        url:
            'https://www.ndtv.com/hyderabad-News/police-stations-in-hyderabad-to-get-cyber-crime-wing-2155065',
        imgurl:
            'https://img.freepik.com/free-vector/colored-hacker-code-realistic-composition-with-person-creates-codes-hacking-stealing-information-vector-illustration_1284-18005.jpg?size=626&ext=jpg'),
    News(
        text: 'Take inspiration from Hyd Police: Mayawati to UP Police',
        url:
            'https://www.deccanherald.com/national/national-politics/take-inspiration-from-hyd-police-mayawati-to-up-police-783145.html',
        imgurl:
            'https://www.deccanherald.com/sites/dh/files/article_images/2019/12/06/file76uvaov25ck1aik7wh00-1575613361.jpg'),
    News(
      text:
          'Telangana Police bust international kidney racket, MBA graduate booked',
      url:
          'https://www.indiatoday.in/india/story/telangana-police-bust-international-kidney-racket-turkey-sri-lanka-mba-graduate-held-1702372-2020-07-20',
      imgurl:
          'https://images.unsplash.com/photo-1560575193-c2c9e886aefe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
    )
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.orange[900],
                  Colors.orange[500],
                  Colors.orange[400]
                ])),
            child: Container(
              child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: AppBar().preferredSize.height,
                    ),
                    Stack(
                      children: <Widget>[
                        carouselSlider = CarouselSlider(
                          height: MediaQuery.of(context).size.height / 1.5,
                          initialPage: 0,
                          enlargeCenterPage: false, //true,
                          autoPlay: true,
                          reverse: false,
                          enableInfiniteScroll: true,
                          autoPlayInterval: Duration(seconds: 4),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 2000),
                          pauseAutoPlayOnTouch: Duration(seconds: 10),
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (index) {
                            setState(() {
                              _current = index;
                            });
                          },
                          items: nlist.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return InkWell(
                                  onTap: () {
                                    print('l');
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                WVP(url: i.url)));
                                  },
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.black38,
                                        ),
                                        child: Column(
                                          children: <Widget>[
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              child: Image(
                                                height: 300,
                                                width: 300,
                                                image: NetworkImage(i.imgurl),
                                                fit: BoxFit.fill,
                                                // fit: BoxFit.scaleDown,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                i.text,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                        Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: map<Widget>(nlist, (index, url) {
                              return Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 2.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == index
                                      ? Colors.orange
                                      : Colors.white,
                                ),
                              );
                            }),
                          ),
                          bottom: 10,
                          width: MediaQuery.of(context).size.width,
                          // left: (MediaQuery.of(context).size.width / 2) - 5,
                        ),
                        Positioned(
                          child: Text(
                            'Crime Awareness Module',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          width: MediaQuery.of(context).size.width,
                          bottom: MediaQuery.of(context).size.height / 10,
                        ),
                        Positioned(
                          child: Text(
                            'Click on any card for full story',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          width: MediaQuery.of(context).size.width,
                          bottom: MediaQuery.of(context).size.height / 15,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => OurRoot()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('Home',
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            Icon(
                              Icons.keyboard_arrow_right,
                              size: 30,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
          );
        },
      ),
    );
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
  }
}
