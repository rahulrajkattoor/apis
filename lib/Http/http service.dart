import 'package:apis/Http/Product%20model.dart';
import 'package:http/http.dart'as http;

class HttpService{
  static Future<List<JewlleryModel>>fetchproducts()async{
    var response=await http.get(Uri.parse("https://fakestoreapi.com/products/category/jewelery"));
    if(response.statusCode==200){
      var data=response.body;
      return jewlleryModelFromJson(data);
    }else{
      throw Exception();
    }
  }
}