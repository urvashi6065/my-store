import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/models/product/product_model.dart';
import 'package:mystore/presentation/product_detail/product_detail.dart';

class ProductCard extends StatefulWidget {
  final ProductModel products;

  const ProductCard({super.key, required this.products});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  // List<Color> colorList=[
  //     Colors.white54,
  //     Colors.red,
  //     Colors.yellow,
  //     Colors.white54,
  //     Colors.white54,
  // ]
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetail(
                  image: widget.products.image,
                  productName: widget.products.title,
                  productPrice: widget.products.price.toString(),
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              color: Colors.white54,
              // color: Colors.grey.shade300,
              // elevation: 10,
              height: _height * 0.20,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage(widget.products.image),
                  height: _height * 0.15,
                  width: _width * 0.50,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        Text(
          widget.products.title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "₹ " + widget.products.price.toString(),
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),
        ),
      ],
    );
  }
}
