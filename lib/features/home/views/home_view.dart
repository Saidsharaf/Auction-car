import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mazad/features/home/widgets/card_item.dart';
import 'package:mazad/features/home/widgets/car_catrgory.dart';
import 'package:mazad/features/home/widgets/search_field.dart';
import 'package:mazad/features/home/widgets/user_header.dart';
import 'package:skeletonizer/skeletonizer.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List category = ['الكل', 'المباعة', 'ملغاة', 'جارية', 'مكتملة'];
  int selectedIndex = 0;

  //List<ProductModel>? products;

//  ProductRepo productRepo = ProductRepo();

  // Future<void> getProducts () async {
  //   final res = await productRepo.getProducts();
  //   setState(() {
  //     products = res;
  //   });
  // }

  // @override
  // void initState() {
  //   getProducts();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Skeletonizer(
        //enabled: products == null,
        enabled: false,
        child: Scaffold(
          body: CustomScrollView(
            clipBehavior: Clip.none,
            slivers: [
              /// header
              SliverAppBar(
                elevation: 0,
                pinned: true,
                floating: false,
                toolbarHeight: 140,
                scrolledUnderElevation: 0,
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                flexibleSpace: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 500),
                    child: Container(
                      // ignore: deprecated_member_use
                      color: Colors.white.withAlpha(450).withOpacity(0.1),
                      child:const Padding(
                        padding: EdgeInsets.only(top: 45,left: 15, right: 15, bottom: 10),
                        child: Column(
                          children: [UserHeader(), Gap(20), SearchField()],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              /// Category
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
                  child: CarCategory(
                    category: category,
                    selectedIndex: selectedIndex,
                  ),
                ),
              ),

              /// GridView
              SliverPadding(
                padding:const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                sliver: SliverGrid(
                  gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.73,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    // childCount:  products?.length ?? 6,
                    childCount: 6,
                    (context, index) {
                      // final product = products?[index];
                      // if(product == null) {
                      //   return CupertinoActivityIndicator();
                      // }
                      return GestureDetector(
                        // onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => ProductDetailsView(
                        //   productImage: product.image,
                        // ))),
                        child:const CardItem(
                          text:" toyota",
                          image: "assets/images/car.png",
                          desc: "prodesc",
                          rate: "5.6",
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
