import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:kitchen_customer/pages/food/food_page.dart';
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

List<String> slideData = [
  "Recommended",
  "Veg",
  "Bread",
  "Non Veg",
  "Fast Food"
];

class _HomePageState extends State<HomePage> {
  int dataIndex = 0;
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
            title: const Text(
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
                          color: Colors.blueAccent,
                          fontSize: 11,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: slideData.length,
                    itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 4),
                          child: selectionButton(
                              onTap: () {
                                setState(() {
                                  dataIndex = index;
                                });
                              },
                              isSelected: index == dataIndex,
                              index: index,
                              text: slideData.elementAt(index)),
                        )),
              ),
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: images.length,
                itemBuilder: (context, index) => Hero(
                      tag: "img$index",
                      child: Material(
                        // type: MaterialType.card,s
                        child: Container(
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
                          child: InkWell(
                            splashColor: Colors.blue,
                            onTap: () {
                              Get.to(() => const FoodPage());
                            },
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Rasmalai",
                                        textScaleFactor: 1.5,
                                      ),
                                      const Text(
                                        "Sint elit dolor ",
                                        textScaleFactor: 1.1,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "₹ 50 ",
                                            textScaleFactor: 1.5,
                                            style: TextStyle(
                                                color: Colors.pink,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          IconButton(
                                              color: Colors.green,
                                              iconSize: 30,
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.add_shopping_cart))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Nearby You",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.4,
                    color: Colors.pinkAccent),
                textScaleFactor: 1.2,
              ),
            ),
            GridView.builder(
              itemCount: images.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 3 / 4),
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  // elevation: 5,

                  decoration: BoxDecoration(

                      // color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(
                              2,
                              2,
                            ),
                            color: Colors.grey.shade400,
                            spreadRadius: 0,
                            blurRadius: 5),
                      ], borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Positioned.fill(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    spreadRadius: 2,
                                    color: Colors.black.withOpacity(0.5),
                                    blurRadius: 5),
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Rasmalai",
                                      textScaleFactor: 1.5,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        "Sint elit dolor Est non commodo ad cillum sint pariatur sit ea magna.",
                                        textScaleFactor: 1.1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                  ],
                                ),
                                IconButton(
                                    color: Colors.white,
                                    iconSize: 30,
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_outline,
                                    ))
                              ],
                            )),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ]))
        ],
      ),
    );
  }

  Widget selectionButton(
      {required bool isSelected,
      required Callback onTap,
      required int index,
      required String text}) {
    return ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                isSelected ? Colors.pink : Colors.white),
            overlayColor: const MaterialStatePropertyAll(Colors.pinkAccent),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18)))),
        child: Text(
          text,
          textScaleFactor: 1.2,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade800,
            letterSpacing: 1.4,
          ),
        ));
  }
}
