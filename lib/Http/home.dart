import 'package:apis/Http/Customise%20product.dart';
import 'package:apis/Http/product%20controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  runApp(GetMaterialApp(home: Home(),debugShowCheckedModeBanner: false,));
}

class Home extends StatelessWidget {
  final ProductController Controller=Get.put(ProductController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Jewellery"),actions: [
        Icon(Icons.shopping_cart)
      ],),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Expanded(child: Text("Shpo now",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),))
            ],
          ),),
          Expanded(child: Obx((){
            if(Controller.isLoading.value){
              return Center(child: CircularProgressIndicator(),);
            }else{
              return GridView.builder(
                itemCount: Controller.productList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10,mainAxisSpacing: 10),
                itemBuilder: (BuildContext context, int index) {
                return ProductCustom( Controller.productList[index]);
                },);
            }
          }))

        ],
      ),
    );
  }
}
