import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:xshop/controllers/product_controller.dart';
import 'package:xshop/views/product_tile.dart';

import '../services/remote_services.dart';

class HomeScreen extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  // HomeScreen({Key? key}) : super(key: key);
  var isMobile = defaultTargetPlatform == TargetPlatform.iOS ||
      defaultTargetPlatform == TargetPlatform.android;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
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
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                      ),
                      onPressed: () {},
                    ),
                    (isMobile)
                        ? IconButton(
                            icon: (productController.isOneList.value = false)
                                ? const Icon(Icons.view_list_rounded)
                                : const Icon(Icons.grid_view),
                            onPressed: () {
                              productController.isOneList.value =
                                  !productController.isOneList.value;
                            })
                        : const SizedBox.shrink()
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (productController.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return CustomScrollView(
                  slivers: [
                    // const SliverAppBar(expandedHeight: 100, backgroundColor: Colors.grey,),
                    SliverGrid(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: (isMobile)
                              ? (productController.isOneList.value == true
                                  ? 1
                                  : 2)
                              : ((screenWidth < 600)
                                  ? 4
                                  : (screenWidth < 1200)
                                      ? 5
                                      : 6),
                        ),
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return ProductTile(
                              productController.productList[index]);
                        }, childCount: productController.productList.length))
                  ],
                );
                // crossAxisCount: (isMobile)
                //       ? (productController.isOneList.value == true ? 1 : 2)
                //       : ((screenWidth < 600)
                //           ? 2
                //           : (screenWidth < 1200)
                //               ? 3
                //               : 4),

                //   StaggeredGridView.countBuilder(
                //   crossAxisCount: (isMobile)
                //       ? (productController.isOneList.value == true ? 1 : 2)
                //       : ((screenWidth < 600)
                //           ? 2
                //           : (screenWidth < 1200)
                //               ? 3
                //               : 4),
                //   itemCount: productController.productList.length,
                //   crossAxisSpacing: 16,
                //   mainAxisSpacing: 16,
                //   itemBuilder: (context, index) {
                //     return ProductTile(productController.productList[index]);
                //   },
                //   staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                // );
              }
            }),
          )
        ],
      )),
    );
  }
}
