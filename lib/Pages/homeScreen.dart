import 'dart:async';
import 'dart:typed_data';

import 'package:assignment_yum_yum_app/const_Colors/const.dart';
import 'package:flutter/material.dart';

import '../Components/filter.dart';
import 'detailHomeScreen.dart';
class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final PageController _pageController = PageController();
  final lstDetail = [
    "assets/Slide.png",
    "assets/Slide2.png"
  ];
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 4),(Timer timer){
      if (_pageController.hasClients){
        int nextPage = (_pageController.page!.toInt()+1) % lstDetail.length;
        _pageController.animateToPage(nextPage, duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:  CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: size.height*0.25,
                width: size.width,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: lstDetail.length,
                  itemBuilder: (context,index){
                    final pageDetail = lstDetail[index];
                    return Image.asset(pageDetail,fit: BoxFit.cover,);
                  },
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _StickySearchDelegate(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return ListTile(
                    title: Text("Item $index"),
                  );
                },
                childCount: 30,
              ),
            ),
          ],
        ),
    );
  }
}
class _StickySearchDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 64;

  @override
  double get maxExtent => 64;

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(0, 4),
            ),
          ]
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(padding: EdgeInsets.zero,onPressed: (){
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => const FilterPage(),
            );
          },
              icon: Container(decoration: BoxDecoration(
              color: kbackgroundColor,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                child: Icon(Icons.filter_list,color: Colors.white,),
                height: 50,
                width: 50,)),
          filled: true,
          fillColor: Colors.grey.shade100,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
