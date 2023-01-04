import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption_app/const.dart';
import 'package:pet_adoption_app/pages/details.dart';

import '../models/cats_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> categories = ['Cats', 'Dogs', 'Birds', 'Fishs'];
  String category = 'Cats';
  int selectedPage = 0;
  List<IconData> icons = [
    Icons.home_outlined,
    Icons.favorite_outline_rounded,
    Icons.chat_outlined,
    Icons.person_outline_rounded
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Location',
                            style: poppins.copyWith(
                              fontSize: 14,
                              color: black.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: Colors.blue,
                            size: 18,
                          )
                        ],
                      ),
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'Pekanbaru, ',
                              style:
                                  poppins.copyWith(fontSize: 24, color: black)),
                          TextSpan(
                            text: 'Riau',
                            style: poppins.copyWith(fontSize: 24, color: black),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.search),
                SizedBox(
                  width: 10,
                ),
                Stack(
                  children: [
                    Icon(Icons.notifications_outlined),
                    Positioned(
                      right: 5,
                      top: 5,
                      child: Container(
                        height: 7,
                        width: 7,
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, color: red),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: blue.withOpacity(0.6),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: -35,
                      right: -30,
                      width: 150,
                      height: 150,
                      child: Transform.rotate(
                        angle: 12,
                        child: SvgPicture.asset(
                          'assets/Paw_Print.svg',
                          color: blue,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -35,
                      left: -30,
                      width: 150,
                      height: 150,
                      child: Transform.rotate(
                        angle: -12,
                        child: SvgPicture.asset(
                          'assets/Paw_Print.svg',
                          color: blue,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -40,
                      right: 120,
                      width: 150,
                      height: 150,
                      child: Transform.rotate(
                        angle: -16,
                        child: SvgPicture.asset(
                          'assets/Paw_Print.svg',
                          color: blue,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 20,
                      height: 153,
                      child: Image.asset('assets/cats/cat1.png'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Join Our Animal\nLovers Community',
                            style: poppins.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: orange),
                            child: Text(
                              'Join Us',
                              style:
                                  poppins.copyWith(color: white, fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Categories',
                  style: poppins.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: black,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'View All',
                      style: poppins.copyWith(fontSize: 12, color: orange),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: orange),
                      child: Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 14,
                        color: white,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 10),
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              const SizedBox(width: 20),
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                  decoration: const BoxDecoration(color: white),
                  child: const Icon(
                    Icons.tune_rounded,
                  )),
              ...List.generate(
                categories.length,
                (index) => Padding(
                  padding: index == 0
                      ? const EdgeInsets.only(left: 20, right: 20)
                      : const EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        category = categories[index];
                      });
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: categories[index] == category ? blue : white,
                            boxShadow: [
                              categories[index] == category
                                  ? const BoxShadow(
                                      offset: Offset(0, 5),
                                      color: blue,
                                      spreadRadius: 0,
                                      blurRadius: 5)
                                  : const BoxShadow(color: white),
                            ]),
                        child: Text(
                          categories[index],
                          style: poppins.copyWith(
                              color:
                                  categories[index] == category ? white : black,
                              fontSize: 14),
                        )),
                  ),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Adopt Pet',
                  style: poppins.copyWith(
                      fontSize: 16, fontWeight: FontWeight.bold, color: black),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      'View All',
                      style: poppins.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: orange),
                    ),
                    SizedBox(width: 10,),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: orange),
                      child: Icon(Icons.keyboard_arrow_right_rounded,
                      size: 14,
                          color: white,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(cats.length, (index) => Padding(padding: index == 0?EdgeInsets.only(left: 20,right: 20):
              EdgeInsets.only(right: 20),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    DetailPage(cat:cats[index])
                    ))
                  },
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
