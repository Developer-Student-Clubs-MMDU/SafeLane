import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:safelane/cards/myContribution.dart';
import 'package:safelane/tabs/componentshome/draggableItems.dart';
import 'package:safelane/tabs/contribute.dart';
import 'package:safelane/tabs/profile.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final screens = [
      home(size: size),
      contribute(),
      profile(),
    ];

    return Scaffold(
      extendBody: true,
      body: screens[currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(80.0, 0.0, 80.0, 25.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200.0),
          child: Container(
            height: 70,
            child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: 30.0,
                selectedFontSize: 0.0,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.white,
                backgroundColor: Colors.black,
                currentIndex: currentIndex,
                onTap: (index) => setState(() {
                      currentIndex = index;
                    }),
                items: const [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home_rounded), label: ""),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.add_circle_outlined), label: ""),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
                ]),
          ),
        ),
      ),
    );
  }
}

class home extends StatelessWidget {
  const home({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            mystack(size: size),
            Container(
              width: size.width * 0.9,
              margin: EdgeInsets.only(bottom: 20.0),
              child: Text(
                "Activities",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            activities(size: size)
          ],
        ),
      ),
    );
  }
}

class activities extends StatelessWidget {
  const activities({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * 0.9,
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MyContributionPage()),
              );
            },
            child: Container(
              width: size.width*0.275,
              padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(84, 84, 84, 0.25),
                    offset: Offset(0.0, 4.0), //(x,y)
                    blurRadius: 16.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/icons/mycontribution.svg"),
                  Text("Contributions")
                ],
              ),
            ),
          ),
          Container(
            width: size.width*0.275,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(84, 84, 84, 0.25),
                  offset: Offset(0.0, 4.0), //(x,y)
                  blurRadius: 16.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/learning.svg"),
                Text("Learn")
              ],
            ),
          ),
          Container(
            width: size.width*0.275,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(84, 84, 84, 0.25),
                  offset: Offset(0.0, 4.0), //(x,y)
                  blurRadius: 16.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/icons/help.svg"),
                Text("Guide")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class mystack extends StatelessWidget {
  const mystack({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.pink,
      height: size.height * 0.6,
      child: Stack(
        alignment: AlignmentDirectional.center,
        // clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: size.width,
              height: size.height * 0.380,
              color: Color(0xffECEBEB),
              // color: Colors.pink,
            ),
          ),
          Positioned(
            top: size.height * 0.02,
            child: Container(
              // color: Colors.black,
              alignment: Alignment.center,
              width: size.width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/images/AppBarLeadingLogo.svg"),
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.notifications,
                            size: 30,
                          )),
                      IconButton(
                          onPressed: ()=>_showModalBottomSheet(context),
                          icon: Icon(
                            Icons.settings,
                            size: 30,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
              top: 80,
              child: Container(
                  alignment: Alignment.centerLeft,
                  width: size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hey there!",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "Aaditya Mishra",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ))),
          Positioned(
            top: 160,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(84, 84, 84, 0.25),
                    offset: Offset(0.0, 4.0), //(x,y)
                    blurRadius: 16.0,
                  ),
                ],
              ),
              height: size.height * 0.38,
              width: size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Which route do you want to check?"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset("assets/images/routeAsset.svg"),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8.0),
                              height: size.height * 0.08,
                              width: size.width * 0.62,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'From',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              // color: Colors.orange,
                              height: size.height * 0.08,
                              width: size.width * 0.62,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'To',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset("assets/images/directionalAsset.svg"),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.8,
                      height: 60,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Check"),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


 void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.6,
          maxChildSize: 0.6,
          minChildSize: 0.4,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: const draggableItems(),
            );
          }),
    );
  }