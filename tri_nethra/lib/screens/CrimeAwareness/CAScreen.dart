import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class news {
  String url;
  String imgurl;
  String text;
  news({this.url, this.imgurl, this.text});
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
  List<news> nlist = [
    news(
        text: 'All Police Stations In Hyderabad To Get Cyber Crime Wing',
        url:
            'https://www.ndtv.com/hyderabad-news/police-stations-in-hyderabad-to-get-cyber-crime-wing-2155065',
        imgurl:
            'https://img.freepik.com/free-vector/colored-hacker-code-realistic-composition-with-person-creates-codes-hacking-stealing-information-vector-illustration_1284-18005.jpg?size=626&ext=jpg'),
    news(
        text: 'Take inspiration from Hyd Police: Mayawati to UP Police',
        url:
            'https://www.deccanherald.com/national/national-politics/take-inspiration-from-hyd-police-mayawati-to-up-police-783145.html',
        imgurl:
            'https://www.deccanherald.com/sites/dh/files/article_images/2019/12/06/file76uvaov25ck1aik7wh00-1575613361.jpg'),
    news(
      text:
          'Telangana Police bust international kidney racket, MBA graduate booked',
      url:
          'https://images.unsplash.com/photo-1560575193-c2c9e886aefe?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
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
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
              colors: [
            Colors.orange[900],
            Colors.orange[300],
            Colors.orange[200]
          ])),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            carouselSlider = CarouselSlider(
              height: MediaQuery.of(context).size.height / 1.2,
              initialPage: 0,
              enlargeCenterPage: true,
              autoPlay: true,
              reverse: false,
              enableInfiniteScroll: true,
              autoPlayInterval: Duration(seconds: 4),
              autoPlayAnimationDuration: Duration(milliseconds: 2000),
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
                    return Column(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Column(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                                child: Image(
                                  height: 300,
                                  width: 300,
                                  image: NetworkImage(i.imgurl),
                                  fit: BoxFit.fill,
                                  // fit: BoxFit.scaleDown,
                                ),
                              ),
                              // fit: BoxFit.fitHeight,

                              Positioned(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    i.url,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ),
                                bottom: 5,
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(nlist, (index, url) {
                return Container(
                  width: 10.0,
                  height: 10.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index ? Colors.redAccent : Colors.green,
                  ),
                );
              }),
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    ));
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
