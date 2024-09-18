import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/core/constants/app_colors.dart';
import 'package:mystore/models/product/product_model.dart';

class ProductDetail extends StatefulWidget {
  final String image;
  final String productName;
  final String productPrice;

  const ProductDetail(
      {super.key, required this.image, required this.productName, required this.productPrice});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: AppColors.white),
        backgroundColor: AppColors.red,
        title: Text(
          'Product Detail',
          style: TextStyle(color: AppColors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: _height * 0.40,
            color: AppColors.blue,
            child: Center(
                child: Image(
              image: NetworkImage(
                widget.image,
              ),
              fit: BoxFit.fill,
            )),
          ),
          Container(
            width: double.infinity,
            // color: AppColors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.productName,style: TextStyle(fontSize: 15)),
                  SizedBox(height: 16,),
                  Text("MRP ₹"+widget.productPrice,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  SizedBox(height: 4,),
                  Text('Inclusive of all taxes',style: TextStyle(color: AppColors.grey1),),
                  SizedBox(height: 50,),
                 Center(
                   child: Container(
                     height: _height*0.06,
                     // width: _width*0.30,
                     decoration: BoxDecoration(
                       color: AppColors.red,
                       borderRadius: BorderRadius.circular(20)
                     ),
                     child: Center(child: Text('Add to Cart',style: TextStyle(color:
                     AppColors.white),)),
                   ),
                 )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
