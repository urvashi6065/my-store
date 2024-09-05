import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class WomenCategories extends StatefulWidget {
  const WomenCategories({super.key});

  @override
  State<WomenCategories> createState() => _WomenCategoriesState();
}


class _WomenCategoriesState extends State<WomenCategories> {

  @override
  Widget build(BuildContext context) {
    final _height=MediaQuery.of(context).size.height;
    final _width=MediaQuery.of(context).size.width;
    return Container();
    // return Scaffold(
    //   backgroundColor: AppColors.grey,
    //   body: ListView.builder(
    //     itemCount: categorieList.length,
    //       itemBuilder: (BuildContext context, int index) {
    //       return Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           height: _height*0.10,
    //         color: Colors.red,
    //         child: Center(
    //           child: ListTile(
    //           leading: Image(image: AssetImage(categorieList[index].categoriImage.toString())),
    //             trailing: Text(categorieList[index].categorieName.toString()),
    //           ),
    //         ),
    //         ),
    //       );
    //   },),
    // );
  }
}
