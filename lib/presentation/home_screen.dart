import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystore/common_widgets/product_card/product_card.dart';
import 'package:mystore/core/Provider/product/product_provider.dart';
import 'package:mystore/core/constants/app_colors.dart';
import 'package:mystore/core/constants/app_strings.dart';
import 'package:mystore/core/services/api_service.dart';
import 'package:mystore/models/product/product_model.dart';

import 'package:provider/provider.dart';

import '../core/Provider/category/category_provider.dart';

class HomeScreen extends StatefulWidget {
  final String? userName;

  const HomeScreen({super.key, this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CategoryProvider>(context, listen: false).getAllCategory();
    Provider.of<ProductProvider>(context, listen: false)
        .getAllProduct(id: 'electronics');
    // ApiService.fetchProductData(id: 'electronics');
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: AppColors.grey,
      appBar: AppBar(
        leadingWidth: _width * 0.22,
        centerTitle: true,
        leading: Container(
          color: AppColors.red,
          child: Row(
            children: [
              Icon(
                CupertinoIcons.person_alt_circle_fill,
                size: _height * 0.03,
              ),
              SizedBox(
                width: _width * .01,
              ),
              Text(widget.userName!)
            ],
          ),
        ),
        title: Text(
          HomeString.mystore,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.search,
              color: AppColors.black,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: _height * 0.15,
                  decoration: BoxDecoration(
                      color: AppColors.red,
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              Container(
                height: _height * 0.06,
                // color: AppColors.red,
                child: Consumer<CategoryProvider>(
                    builder: (context, value, child) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: value.categoryList.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Provider.of<ProductProvider>(context, listen: false)
                              .getAllProduct(id: value.categoryList[index].id);
                        },
                        child: Container(
                          // borderOnForeground: true,
                          decoration: BoxDecoration(
                              color: AppColors.red,
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Text(
                              value.categoryList[index].name,
                              style: TextStyle(color: AppColors.white),
                            )),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              Consumer<ProductProvider>(builder: (context, value, child) {
                return GridView.builder(

                    itemCount: value.productList.length,

                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(products: value.productList[index],);
                    });
              })
              // Consumer<ProductProvider>(
              //   builder: (context,value,child) {
              //     return ListView.builder(
              //       physics: const NeverScrollableScrollPhysics(),
              //       shrinkWrap: true,
              //         itemCount: value.productList.length,
              //         itemBuilder: (context,index){
              //         return ProductCard();
              //           // return Image(image: NetworkImage(value.productList[index].image),height: _height*0.1,);
              //       // return Container(child: Image(image: NetworkImage(value.productList[index].image,),width: _width*0.3,));
              //     });
              //   }
              // )
            ],
          ),
        ),
      ),

      // body: Consumer<CategoryProvider>(
      //   builder: (context, value, child){
      //     return ListView.builder(padding: EdgeInsets.all(16),
      //         itemCount: value.categoryList.length,
      //         itemBuilder: (context,index){
      //           return Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               // Text('dhjdhsd'),
      //               Text(value.categoryList[index].name, style: TextStyle(fontSize: 24),),
      //               // Text(cate[index].name)
      //             ],
      //           );
      //         },);
      //   },
      //
      // ),
      // body: Consumer<CategoryProvider>(
      //   builder: (context,consumerVar,child) {
      //
      //     return DefaultTabController(
      //       length: consumerVar.categoryList.length,
      //       child: Column(
      //         children: [
      //           TabBar(
      //
      //             dividerColor: AppColors.white,
      //               // enableFeedback: true,
      //               indicatorSize: TabBarIndicatorSize.tab,
      //               indicatorColor: AppColors.red,
      //               labelColor: AppColors.black,
      //               labelStyle: TextStyle(fontWeight: FontWeight.bold),
      //               tabs: [
      //                 // Tab(text: HomeString.all,),
      //                 Tab(text: HomeString.jewelery,),
      //             Tab(text: HomeString.men,),
      //
      //             Tab(text: HomeString.electronics,),
      //             Tab(text: HomeString.women,),
      //                 Tab(text: '',)
      //           ]),
      //           Expanded(
      //             child: TabBarView(children: [
      //               WomenCategories(),
      //               Center(child: Text('222'),),
      //               Center(child: Text('333'),),
      //               Center(child: Text('333'),),
      //               // Center(child: Text('333'),),
      //             ]),
      //           ),
      //           Column(
      //             children: [
      //
      //             ],
      //           )
      //         ],
      //       ),
      //     );
      //   }
      // ),
    );
  }
}
