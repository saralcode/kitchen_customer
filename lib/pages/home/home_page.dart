import 'dart:ui';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitchen_customer/pages/search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

List<String> images = [
  "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1493770348161-369560ae357d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=806&q=80",
  "https://images.unsplash.com/photo-1495214783159-3503fd1b572d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
];

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   titleTextStyle:
      //       const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      //   centerTitle: true,
      //   title: const Text("Kitchen App"),
      // ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            floating: true,
            expandedHeight: 120,
            title: Text(
              "My Kitchen",
              textScaleFactor: 1.2,
            ),
            flexibleSpace: FlexibleSpaceBar(
                titlePadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                centerTitle: true,
                title: InkWell(
                  onTap: () {
                    Get.to(const SearchPage());
                  },
                  child: Hero(
                    tag: "searchbar",
                    child: Container(
                      height: 35,
                      width: Get.height * 0.8,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Text(
                        "Search for something..",
                        style: TextStyle(
                          color: Colors.indigo,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ),
                )),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Today's Special",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                    color: Colors.pinkAccent),
                textScaleFactor: 1.2,
              ),
            ),
            SizedBox(
              height: 200,
              child: Swiper(
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 15),
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(5, 5),
                              spreadRadius: 0,
                              blurRadius: 10),
                        ],
                        gradient: LinearGradient(
                            colors: [Colors.grey.shade100, Colors.white]),
                        borderRadius: BorderRadius.circular(15)),
                    // alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        images.elementAt(index),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                autoplay: true,
                itemCount: 5,
                // scrollDirection: Axis.vertical,
                pagination:
                    const SwiperPagination(alignment: Alignment.bottomCenter),
                control: const SwiperControl(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Buy Nearby",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                    color: Colors.pinkAccent),
                textScaleFactor: 1.2,
              ),
            ),
            Expanded(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: images.length,
                  itemBuilder: (context, index) => Container(
                      height: 140,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(3, 0),
                                spreadRadius: 0,
                                blurRadius: 10),
                          ],
                          gradient: LinearGradient(
                              colors: [Colors.grey.shade100, Colors.white]),
                          borderRadius: BorderRadius.circular(10)),
                      // alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 120,
                            width: 120,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                images.elementAt(index),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text(
                                  "Rasmalai",
                                  textScaleFactor: 1.5,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Sint elit dolor ex commodo labore aliqua minim proident deserunt.",
                                  textScaleFactor: 1.1,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "50 Rs.",
                                  textScaleFactor: 1.5,
                                  style: TextStyle(
                                      color: Colors.pink,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ))),
            )
            //
          ]))
        ],
      ),
    );
  }
}
