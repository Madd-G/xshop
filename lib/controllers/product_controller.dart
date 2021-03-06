import 'package:get/state_manager.dart';
import 'package:xshop/models/product.dart';
import 'package:xshop/services/remote_services.dart';

class ProductController extends GetxController {
  var isLoading = true.obs;
  var productList = <Product>[].obs;
  var isOneList = false.obs;
  var productOnCart = 0.obs;

  var remoteServices = RemoteServices();

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await remoteServices.fetchProducts();
      // var products = await RemoteServices.fetchProducts();
      productList.value = products;
    } finally {
      isLoading(false);
    }
  }

  addCart() {
    return productOnCart.value ++;
  }
}
