import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xshop/controllers/product_controller.dart';
import 'package:xshop/views/product_tile.dart';

import '../services/remote_services.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());
  int num;

  HomeScreen(this.num);

  // HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blueGrey,
      //   title: const Text(
      //     'Shop App',
      //     style: TextStyle(
      //         fontFamily: 'avenir', fontSize: 32, fontWeight: FontWeight.w900),
      //   ),
      //   elevation: 0,
      //   actions: [
      //     IconButton(
      //       icon: const Icon(
      //         Icons.shopping_cart,
      //       ),
      //       onPressed: () {},
      //     )
      //   ],
      // ),
      body: SafeArea(
          child: check()),
    );
  }

  StatelessWidget check() {
    return (num == 200)
            ? ListProducts(productController: productController)
            : const Text("No data");
  }
}



class ListProducts extends StatelessWidget {
  const ListProducts({
    Key? key,
    required this.productController,
  }) : super(key: key);

  final ProductController productController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {},
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
                width: 245,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.lightBlue[100],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
                ),
                onPressed: () {},
              ),
              IconButton(
                  icon: (productController.isOneList.value = false)
                      ? const Icon(Icons.view_list_rounded)
                      : const Icon(Icons.grid_view),
                  onPressed: () {
                    productController.isOneList.value =
                        !productController.isOneList.value;
                  }),
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            if (productController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return StaggeredGridView.countBuilder(
                crossAxisCount:
                    (productController.isOneList.value == true ? 1 : 2),
                itemCount: productController.productList.length,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                },
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              );
            }
          }),
        )
      ],
    );
  }
}
