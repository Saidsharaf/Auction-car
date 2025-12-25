import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mazad/features/addNewPost/views/add_view.dart';
import 'package:mazad/features/auth/views/profile_view.dart';
import 'package:mazad/features/home/views/home_view.dart';
import 'package:mazad/features/myAuctions/auctions_views.dart';
import 'package:mazad/features/onBoarding/widgets/custom_text.dart';
import 'package:mazad/features/reels/views/reels_view.dart';
import 'package:mazad/shared/custom_nav.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> with TickerProviderStateMixin {
  late PageController controller;
  late List<Widget> screens;
  int currentScreen = 4;

  late List<AnimationController> iconControllers;

  @override
  void initState() {
    super.initState();

    screens = const[
      ProfileView(),
      ReelsView(),
      AddView(),
      MyAuctions(),
      HomeView(),
    ];

    controller = PageController(initialPage: 4);
    iconControllers = List.generate(
      5,
          (index) => AnimationController(
        vsync: this,
        duration:const Duration(milliseconds: 300),
      ),
    );
    iconControllers[currentScreen].forward();
  }

  @override
  void dispose() {
    controller.dispose();
    for (var c in iconControllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onTabTapped(int index) {
    setState(() => currentScreen = index);
    controller.animateToPage(
      index,
      duration:const Duration(milliseconds: 300),
      curve: Curves.easeOutExpo,
    );

    // Animate selected icon
    iconControllers[index].forward();

    // Reverse others
    for (var i = 0; i < iconControllers.length; i++) {
      if (i != index) iconControllers[i].reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        extendBody: true,
        body: PageView(
          controller: controller,
          physics:const NeverScrollableScrollPhysics(),
          children: screens,
        ),
        bottomNavigationBar: GlassBottomNavBar(
          currentIndex: currentScreen,
          onTap: _onTabTapped,
          items: [
              BottomNavItemData(
              label: 'الملف',
              icon:const Icon(CupertinoIcons.person_alt_circle),
              filledIcon: AnimatedIcon(
                size: 20,
                icon: AnimatedIcons.arrow_menu,
                progress: iconControllers[1],
              ),
            ),
            BottomNavItemData(
              label: 'ريلز',
              icon:const Icon(CupertinoIcons.play_circle),
              filledIcon: Badge(
                label:const CustomText(text: '1',size: 10),
                child: AnimatedIcon(
                  icon: AnimatedIcons.view_list,
                  progress: iconControllers[0],
                ),
              ),
            ),BottomNavItemData(
              label: 'اضف',
              icon:const Icon(Icons.add_circle_outline_rounded),
              filledIcon:const Icon(Icons.add_circle_rounded),
            ),
            BottomNavItemData(
              label: 'مزايداتي',
              icon:const Icon(Icons.campaign_rounded),
              filledIcon:const Icon(Icons.local_car_wash),
            ),
            BottomNavItemData(
              label: 'الرئيسية',
              icon:const Icon(CupertinoIcons.home),
              filledIcon: AnimatedIcon(
                icon: AnimatedIcons.menu_home,
                progress: iconControllers[0],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
