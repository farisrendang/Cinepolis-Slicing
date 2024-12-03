import 'dart:async';
import 'dart:ui';
import 'package:cinepolis_ukl/widgets/bottom_nav.dart';
import 'package:cinepolis_ukl/widgets/carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<Dashboard> {
  final List<String> bannerImages = [
    'assets/GUNA-GUNA.jpg',
    'assets/NEGERI.jpg',
    'assets/MOANA2.jpg',
  ];

  final List<String> posters = [
    'assets/ENDGAME.jpg',
    'assets/MOANA-2.jpg',
    'assets/MENCURI-RADEN.jpg',
    'assets/UPIN-IPIN.jpg',
    'assets/MINECRAFT.jpg',
  ];

  final List<String> upcomingImages = [
    'assets/WEREWOLVES.jpg',
    'assets/KRAVEN.jpg',
    'assets/EDAN.jpg',
    'assets/DOOMSDAY.jpg',
    'assets/BOLA.jpg',
  ];

  final List<String> promotionImages = [
    'assets/PROMO3.jpg',
    'assets/PROMO2.jpg',
    'assets/PROMO1.jpg',
  ];

  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);

    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_currentPage < bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String selectedCity = 'Malang';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.location_on, color: Color.fromRGBO(24, 30, 115, 1.0)),
            SizedBox(width: 5),
            DropdownButton<String>(
              value: selectedCity,
              items: const [
                DropdownMenuItem(
                  value: 'Malang',
                  child: Text('Malang'),
                ),
                DropdownMenuItem(
                  value: 'Surabaya',
                  child: Text('Surabaya'),
                ),
                DropdownMenuItem(
                  value: 'Jakarta',
                  child: Text('Jakarta'),
                ),
              ],
              onChanged: (value) {
                // Logika untuk mengubah kota dapat ditambahkan di sini
              },
              underline: Container(),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add favorite action here
            },
            icon: Icon(
              CupertinoIcons.heart,
              color: Color.fromRGBO(24, 30, 115, 1.0),
            ),
          ),
          IconButton(
            onPressed: () {
              // Add notification action here
            },
            icon: Icon(
              CupertinoIcons.bell,
              color: Color.fromRGBO(24, 30, 115, 1.0),
            ),
          ),
          IconButton(
            onPressed: () {
              // Add profile action here
            },
            icon: Icon(
              CupertinoIcons.person_circle_fill,
              color: Color.fromRGBO(24, 30, 115, 1.0),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' Guest',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Mau nonton apa hari ini?',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Banner Section
            SizedBox(
              height: 250,
              child: PageView.builder(
                controller: _pageController,
                itemCount: bannerImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        bannerImages[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Now Showing Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Now Showing",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 27, 28, 115)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 27, 28, 115)),
                    ),
                  )
                ],
              ),
            ),
            //carousel
            CarouselDemo(imageList: posters),
            // Upcoming Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Upcoming',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 0, 122),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 27, 28, 115)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcomingImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        upcomingImages[index],
                        width: 216,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            // Promotion Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Promotion',
                    style: TextStyle(
                      color: Color.fromARGB(255, 2, 0, 122),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "See All",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 27, 28, 115)),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: promotionImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        promotionImages[index],
                        width: 450,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(0),
    );
  }
}
