import 'package:flutter/material.dart';
import 'package:mazad/features/myAuctions/views/all_orders_tab.dart';
import 'package:mazad/features/myAuctions/views/cancelled_oreders_tab.dart';
import 'package:mazad/features/myAuctions/views/completed_orders_tab.dart';
import 'package:mazad/features/myAuctions/views/running_orders_tab.dart';

class MyAuctions extends StatelessWidget {
  const MyAuctions({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: TabBar(
                isScrollable: true,
                dividerColor: Colors.transparent,
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                splashFactory: NoSplash.splashFactory,
                indicator: BoxDecoration(
                  color: const Color(0xffB7521F), 
                  borderRadius: BorderRadius.circular(10),
                ),

                labelColor: Colors.white,
                unselectedLabelColor: Colors.black54,
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
                tabAlignment: TabAlignment.center,
                tabs: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "الكل"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "مكتملة"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "جارية"),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Tab(text: "ملغاة"),
                  ),
                ],
              ),
            ),

            const Expanded(
              child: TabBarView(
                children: [
                  AllOrdersTab(),
                  CompletedOrdersTab(),
                  RunningOrdersTab(),
                  CancelledOredersTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
