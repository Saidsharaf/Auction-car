import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mazad/core/constants/app_colors.dart';
import 'package:mazad/features/home/widgets/car_category.dart';
import 'package:mazad/features/home/widgets/card_carAuction.dart';
import 'package:mazad/features/home/widgets/custom_post.dart';
import 'package:mazad/features/home/widgets/search_field.dart';
import 'package:mazad/features/home/widgets/user_header.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/shared/custom_text_btn.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> photoes = [
    Image.asset('assets/images/car.png', fit: BoxFit.cover),
    Image.asset('assets/images/onboarding1.png', fit: BoxFit.cover),
    Image.asset('assets/images/onboarding2.png', fit: BoxFit.cover),
  ];

  List<String> categories = [
    "سيارة دفع رباعي",
    "سيدان",
    "شاحنة",
    "كوبيه",
    "مكشوفة",
    "هاتشباك",
  ];
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Skeletonizer(
        enabled: false,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 80,
            actions: const [Text("Logo")],
            leadingWidth: 100,
            leading: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(Icons.notifications_none, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon:
                      const Icon(CupertinoIcons.bookmark, color: Colors.black),
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomScrollView(
              slivers: [
                /// HEADER + BUTTON
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          CustomTextBtn(
                            text: "+ انشاء منشور",
                            size: 12,
                            onPressed: () {},
                          ),
                          const Spacer(),
                          const UserHeader(),
                        ],
                      ),
                      const Gap(20),

                      /// SEARCH
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 45,
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.slider_horizontal_3,
                                size: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const Gap(10),
                          const Expanded(child: SearchField()),
                        ],
                      ),
                      const Gap(15),

                      /// CAROUSEL
                      CarouselSlider(
                        carouselController: _carouselController,
                        items: photoes,
                        options: CarouselOptions(
                          height: 130,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          //  autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                        ),
                      ),
                      const Gap(10),
                      Center(
                        child: AnimatedSmoothIndicator(
                          activeIndex: _currentIndex,
                          count: photoes.length,
                          effect: ExpandingDotsEffect(
                            activeDotColor: AppColors.primary,
                            dotColor: Colors.grey.shade300,
                            dotHeight: 8,
                            dotWidth: 12,
                          ),
                        ),
                      ),

                      const Gap(15),

                      const CustomText(
                        text: "الفئات",
                        size: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      const Gap(10),
                    ],
                  ),
                ),

                /// GRID (SliverGrid)
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return CarCategory(
                        image: 'assets/images/car2.jpg',
                        text: categories[index],
                      );
                    },
                    childCount: 6,
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: .97,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                ),

                SliverToBoxAdapter(
                  child: Row(
                    textDirection: TextDirection.rtl,
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "المزايدات المميزة",
                        size: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      const Spacer(),
                      CustomTextBtn(
                        text: "عرض المزيد",
                        size: 10,
                        textDecoration: TextDecoration.underline,
                        // ignore: deprecated_member_use
                        decorationColor: AppColors.primary.withOpacity(.5),
                        onPressed: null,
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 350, // حسب ارتفاع CardCarauction
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      itemCount: 3,
                      itemBuilder: (context, index) => const CardCarauction(),
                      separatorBuilder: (context, index) => const Gap(10),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Row(
                    textDirection: TextDirection.rtl,
                    //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CustomText(
                        text: "المنشورات",
                        size: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      const Spacer(),
                      CustomTextBtn(
                        text: "انشاء منشور",
                        size: 10,
                        textDecoration: TextDecoration.underline,
                        // ignore: deprecated_member_use
                        decorationColor: AppColors.primary.withOpacity(.5),
                        onPressed: null,
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) =>const Column(
                      children: [
                        Gap(10),
                         CustomPost(),
                      ],
                    ),
                    childCount: 3,
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Gap(100),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
