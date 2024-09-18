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
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetail(
                      image: widget.products.image,
                      productName: widget.products.title,
                      productPrice: widget.products.price.toString(),
                    )));
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: _height * 0.20,
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: NetworkImage(widget.products.image),
                  height: _height * 0.10,
                  width: _width * 0.50,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Text('data')
      ],
    );
  }
}
