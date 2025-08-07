import 'package:flutter/material.dart';
import 'package:healthcare_assignment/core/constants/app_sizes.dart';
import 'package:healthcare_assignment/presentation/screens/pages/categories.dart';
import 'package:healthcare_assignment/presentation/screens/pages/top_pet_service.dart';

class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyAssessmentsState();
}

class _MyAssessmentsState extends State<MyDashboard>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final double cardRadius = ResponsiveSize.width(12);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff6f7fb),
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ResponsiveSize.width(18)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ResponsiveSize.height(12)),

              /// TabBar container
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xfff1f1f6),
                  borderRadius: BorderRadius.circular(ResponsiveSize.width(40)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(ResponsiveSize.width(4)),
                  child: TabBar(
                    controller: _tabController,
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.transparent,
                    indicatorWeight: 0,
                    indicator: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(ResponsiveSize.width(40)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffdadada),
                          blurRadius: ResponsiveSize.width(8),
                          offset: Offset(0, ResponsiveSize.height(3)),
                        )
                      ],
                    ),
                    labelColor: const Color(0xff2a70f4),
                    unselectedLabelColor: const Color(0xffa8a8b3),
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveSize.width(14),
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: ResponsiveSize.width(14),
                    ),
                    tabs: const [
                      Tab(text: 'All Pet Centers'),
                      Tab(text: 'Featured Pet Centers'),
                    ],
                  ),
                ),
              ),

              SizedBox(height: ResponsiveSize.height(12)),

              /// TabBar views
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    Categories(),
                    TopPetService(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
