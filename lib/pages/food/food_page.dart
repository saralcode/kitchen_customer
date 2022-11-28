import 'package:flutter/material.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        extendedPadding: const EdgeInsets.symmetric(horizontal: 100),
        onPressed: () {},
        label: const Text(
          "Buy Now",
          textScaleFactor: 1.4,
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,
            expandedHeight: 350,
            backgroundColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Hero(
                tag: "img1",
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.network(
                    "https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(5),
            sliver: SliverList(
                delegate: SliverChildListDelegate([
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Rasmalai",
                        textScaleFactor: 1.5,
                      ),
                      Text(
                        "Sint elit dolor",
                        textScaleFactor: 1.1,
                      ),
                    ],
                  ),
                  IconButton(
                      color: Colors.green,
                      iconSize: 30,
                      onPressed: () {},
                      icon: const Icon(Icons.add_shopping_cart))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "₹ 50 ",
                textScaleFactor: 1.5,
                style:
                    TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              const Text(
                "Sunt ea consectetur in nostrud ullamco enim. Esse laborum elit voluptate excepteur aute ea Lorem fugiat pariatur est adipisicing. Aliquip aliquip enim magna officia magna ex. Lorem pariatur nisi occaecat consequat aliquip officia exercitation et ullamco duis. Reprehenderit adipisicing do labore tempor excepteur elit adipisicing nisi.",
                textScaleFactor: 1.3,
              ),
            ])),
          ),
        ],
      ),
    );
  }
}
