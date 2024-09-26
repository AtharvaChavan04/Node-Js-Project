import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:node_js_project/model/product_model.dart';

class ApiServices {
  static const baseUrl = "http://192.168.0.105:3000/api";

//post method
  static addproduct(Map pdata) async {
    print(pdata);
    var url = Uri.parse("$baseUrl/add_product");
    try {
      final res = await http.post(
        url,
        body: pdata,
      );
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Failed to get data");
      }
    } catch (e) {
      print(e.toString());
    }
  }

//get method
  static getProduct() async {
    List<ProductModel> product = [];

    var url = Uri.parse("$baseUrl/get_product");

    try {
      final res = await http.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        for (var value in data) {
          product.add(
            ProductModel(
              name: value['pname'],
              desc: value['pdesc'],
              price: value['pprice'],
              id: value['_id'].toString(),
            ),
          );
        }
        return product;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //update put method
  static updateProduct(id, body) async {
    var url = Uri.parse("$baseUrl/update/$id");

    final res = await http.patch(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      print('Update Response: $data');
    } else {
      print("Failed to update Data");
    }
  }

  //delete method
  static deleteProduct(String id) async {
    var url = Uri.parse("$baseUrl/delete/$id");

    try {
      final res = await http.delete(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);
        print('Delete Response: $data');
      } else if (res.statusCode == 404) {
        print("Product not found");
      } else {
        print("Failed to Delete");
      }
    } catch (e) {
      print('Error during deletion: ${e.toString()}');
    }
  }
}
