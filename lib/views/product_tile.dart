import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xshop/controllers/product_controller.dart';
import 'package:xshop/models/product.dart';
import 'package:xshop/views/detail_screen.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile(this.product);

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return Card(
      clipBehavior: Clip.antiAlias,
      semanticContainer: true,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 2),
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: SizedBox(
                height: 170,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
                flex: 4,
                child: Column(
                  children: [
                    Text(
                      product.title,
                      maxLines: 2,
                      style: const TextStyle(
                          fontSize: 14,
                          fontFamily: 'avenir',
                          fontWeight: FontWeight.w800),
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
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "(${product.count.toString()})",
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            const SizedBox(height: 6.0),
                            Text('\$${product.price}',
                                style: const TextStyle(
                                    fontSize: 13, fontFamily: 'avenir')),
                          ],
                        ),
                        Obx(() => Row(
                              children: [
                                CircleAvatar(
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
                                ),
                                IconButton(
                                    onPressed: () {
                                      productController.addCart();
                                    },
                                    icon: const Icon(Icons.add))
                              ],
                            )),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
