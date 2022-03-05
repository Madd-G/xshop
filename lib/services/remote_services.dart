import 'package:http/http.dart' as http;
import 'package:xshop/models/product.dart';
import 'package:xshop/views/home_screen.dart';

class RemoteServices {
  // var client = http.Client();
  final String url = 'https://fakestoreapi.com/product';


  Future<List<Product>> fetchProducts() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      HomeScreen homeScreen = HomeScreen(response.statusCode);
      return productFromJson(jsonString);
    }
    else {
      throw response.statusCode;
    }
  }
  // Future<List<Product>> fetchProducts() async {
  //   var response = await client.get(Uri.parse(url));
  //   if (response.statusCode == 200) {
  //     var jsonString = response.body;
  //     return productFromJson(jsonString);
  //   } else {
  //     //show error message
  //     throw response.statusCode;
  //   }
  // }
}
