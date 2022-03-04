import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xshop/models/product.dart';
import 'package:xshop/views/detail_screen.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => Get.to(() => DetailScreen()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 180,
                    width: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Positioned(
                  //   right: 0,
                  //   child: Obx(() => CircleAvatar(
                  //         backgroundColor: Colors.white,
                  //         child: IconButton(
                  //           icon: product.isFavorite.value
                  //               ? const Icon(
                  //                   Icons.favorite_rounded,
                  //                   color: Colors.red,
                  //                 )
                  //               : const Icon(
                  //                   Icons.favorite_border,
                  //                   color: Colors.black54,
                  //                 ),
                  //           onPressed: () {
                  //             product.isFavorite.toggle();
                  //           },
                  //         ),
                  //       )),
                  // )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                product.title,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 16,
                    fontFamily: 'avenir', fontWeight: FontWeight.w800),
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (product.rating != null)
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Colors.yellow,
                              ),
                              Text(
                                product.rating.toString(),
                                style: const TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              Text(
                                "(${product.count.toString()})",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      const SizedBox(height: 8),
                      const SizedBox(height: 4.0),
                      Text('\$${product.price}',
                          style: const TextStyle(
                              fontSize: 16, fontFamily: 'avenir')),
                    ],
                  ),
                  Obx(() => CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: product.isFavorite.value
                          ? const Icon(
                        Icons.favorite_rounded,
                        color: Colors.red,
                      )
                          : const Icon(
                        Icons.favorite_border,
                        color: Colors.black54,
                      ),
                      onPressed: () {
                        product.isFavorite.toggle();
                      },
                    ),
                  )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
