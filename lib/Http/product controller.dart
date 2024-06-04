import 'package:apis/Http/http%20service.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProductController extends GetxController{
  RxBool isLoading=true.obs;
  var productList=[].obs;
  @override
  void onInit() {
   loadProducts();
    super.onInit();
  }
  void loadProducts()async{
    try{
      isLoading(true);
      var product=await HttpService.fetchproducts();
      if(product!=null){
        productList.value=product;
      }

    }finally{
      isLoading(false);
    }
  }
}