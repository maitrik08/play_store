import 'dart:async';
import 'package:flutter/material.dart';
import 'package:play_store/CategoriesList.dart';
import 'package:play_store/IOSScreen.dart';
import 'package:provider/provider.dart';

class AndroidScreen extends StatefulWidget {
  const AndroidScreen({super.key});

  @override
  State<AndroidScreen> createState() => _AndroidScreenState();
}

class _AndroidScreenState extends State<AndroidScreen> with SingleTickerProviderStateMixin{
  late TabController controller;
  int CurruntIndex =1;
  int currentPage = 0;
  void initState() {
    // TODO: implement initState
    controller = TabController(vsync: this, length: 4,initialIndex: 0);
    timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (currentPage < 2) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }
  Timer timer = Timer(Duration(seconds: 3), () {});
  PageController pageController = PageController(
    viewportFraction: 0.91,
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    final androidprovider = Provider.of<Androidprovider>(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 15,
            ),
          ),
          SliverAppBar(
            pinned: false,
            toolbarHeight: 50,
            elevation: 0,
            bottom: PreferredSize(child: SizedBox(), preferredSize: Size.fromHeight(0)),
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xffEEE5F7),
                    borderRadius: BorderRadius.circular(100)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Icon(Icons.search,color: Colors.black,),
                      SizedBox(width: 10,),
                      Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: 'Search apps..',
                                hintStyle: TextStyle(
                                    color: Colors.black
                                ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffEEE5F7)
                                )
                              ),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffEEE5F7)
                                  )
                              ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color(0xffEEE5F7)
                                  )
                              ),
                            ),
                          )
                      ),
                      Icon(Icons.mic_none_rounded,color: Colors.black,)
                    ],
                  ),
                ),
              ),
            ),
            leadingWidth: width/1.32,
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Icon(Icons.notifications_none,color: Colors.black,),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => IOSScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15,left: 5),
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.pinkAccent.shade100,
                    child: Text(
                      'M',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SliverAppBar(
            stretch: false,
            pinned: true,
            snap: false,
            toolbarHeight: 0,
            collapsedHeight: 0,
            elevation: 0,
            titleSpacing: 15,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Container(
                height: 30,
                child: DefaultTabController(
                  initialIndex: 1,
                  length: 4,
                  child: TabBar(
                      controller: controller,
                      indicatorSize: TabBarIndicatorSize.label,
                      automaticIndicatorColorAdjustment: true,
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.blue,
                      indicatorColor: Colors.blue,
                      labelPadding: EdgeInsets.only(bottom: 10,left: 0),
                      labelStyle: TextStyle(
                          color: Colors.black
                      ),
                      onTap: (value) {

                      },
                      tabs: [
                        Tab(
                          text: 'For you',
                        ),
                        Tab(
                          text: 'Top charts',
                        ),
                        Tab(
                          text: 'Kids',
                        ),
                        Tab(
                          text: 'Categories',
                        ),
                      ]
                  ),
                ),
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(
              child: TabBarView(
                controller: controller,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 330,
                            width: width,
                            child: PageView(
                              controller: pageController,
                              padEnds: true,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 0,top: 15,bottom: 20),
                                  child: Image.asset('Assets/Banner1.png',width: width-30,fit: BoxFit.fill),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 0,top: 15,bottom: 20),
                                  child: Image.asset('Assets/Banner2.png',width: width-30,fit: BoxFit.fill),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 0,top: 15,bottom: 20),
                                  child: Image.asset('Assets/Banner3.png',width: width-30,fit: BoxFit.fill),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Ads',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Container(
                                        height: 4,width: 4,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.black
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Suggested for you',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18.5
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(Icons.more_vert,color: Colors.black,)
                              ],
                            ),
                          ),
                          Container(
                            height: 280,
                            width: width-30,
                            child: PageView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 15,top: 15,bottom: 20),
                                  child: SizedBox(
                                    height: 220,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        App(Title: 'Instagram', Iconn: AssetImage('Assets/1.png'),Install: true),
                                        App(Title: 'Facebook', Iconn: AssetImage('Assets/2.png'),Install: false),
                                        App(Title: 'Snapchat', Iconn: AssetImage('Assets/3.png'),Install: true),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 15,top: 15,bottom: 20),
                                  child: SizedBox(
                                    height: 220,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        App(Title: 'Amazon', Iconn: AssetImage('Assets/4.png'),Install: true),
                                        App(Title: 'Flipkart', Iconn: AssetImage('Assets/5.png'),Install: false),
                                        App(Title: 'Zomato', Iconn: AssetImage('Assets/6.png'),Install: true),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10,right: 15,top: 15,bottom: 20),
                                  child: SizedBox(
                                    height: 220,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        App(Title: 'Picsart', Iconn: AssetImage('Assets/7.png'),Install: true),
                                        App(Title: 'Swiggy', Iconn: AssetImage('Assets/8.png'),Install: false),
                                        App(Title: 'Meesho', Iconn: AssetImage('Assets/9.png'),Install: true),
                                      ],
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Edit videos Like Pro',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                  ),
                                ),
                                Icon(Icons.arrow_forward,color: Colors.black,)
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  App1(Title: 'Zomato', Iconn: AssetImage('Assets/6.png')),
                                  App1(Title: 'Snapchat', Iconn: AssetImage('Assets/3.png')),
                                  App1(Title: 'Picsart', Iconn: AssetImage('Assets/7.png')),
                                  App1(Title: 'Amazon', Iconn: AssetImage('Assets/4.png')),
                                  App1(Title: 'Flipkart', Iconn: AssetImage('Assets/5.png')),
                                  App1(Title: 'Instagram', Iconn: AssetImage('Assets/1.png')),
                                  App1(Title: 'Swiggy', Iconn: AssetImage('Assets/8.png')),
                                  App1(Title: 'Facebook', Iconn: AssetImage('Assets/2.png')),
                                  App1(Title: 'Meesho', Iconn: AssetImage('Assets/9.png')),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Events happening now',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Image.asset('Assets/Event.png'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Edit Photos Like Pro',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                  ),
                                ),
                                Icon(Icons.arrow_forward,color: Colors.black,)
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  App1(Title: 'Picsart', Iconn: AssetImage('Assets/7.png')),
                                  App1(Title: 'Flipkart', Iconn: AssetImage('Assets/5.png')),
                                  App1(Title: 'Instagram', Iconn: AssetImage('Assets/1.png')),
                                  App1(Title: 'Swiggy', Iconn: AssetImage('Assets/8.png')),
                                  App1(Title: 'Facebook', Iconn: AssetImage('Assets/2.png')),
                                  App1(Title: 'Snapchat', Iconn: AssetImage('Assets/3.png')),
                                  App1(Title: 'Meesho', Iconn: AssetImage('Assets/9.png')),
                                  App1(Title: 'Zomato', Iconn: AssetImage('Assets/6.png')),
                                  App1(Title: 'Amazon', Iconn: AssetImage('Assets/4.png')),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: 15,top: 20,bottom: 30),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return Container(
                                            height: 300,
                                            child: Padding(
                                              padding: const EdgeInsets.all(25),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(height: 10),
                                                  Text(
                                                    'Top Charts',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 18
                                                    ),
                                                  ),
                                                  SizedBox(height: 30,),
                                                  Expanded(
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(10),
                                                        border: Border.all(
                                                          color: Colors.grey,
                                                          width: 0.5
                                                        )
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            InkWell(
                                                              onTap: (){
                                                                Navigator.pop(context);
                                                                androidprovider.ChangeTopchart('Top free');
                                                              },
                                                              child: Text(
                                                                'Top free',
                                                                style: TextStyle(
                                                                  color: Colors.black
                                                                ),
                                                              ),
                                                            ),
                                                            Divider(color: Colors.grey,thickness: 0.5,),
                                                            InkWell(
                                                              onTap: (){
                                                                Navigator.pop(context);
                                                                androidprovider.ChangeTopchart('Top grossing');
                                                              },
                                                              child: Text(
                                                                'Top grossing',
                                                                style: TextStyle(
                                                                    color: Colors.black
                                                                ),
                                                              ),
                                                            ),
                                                            Divider(color: Colors.grey,thickness: 0.5,),
                                                            InkWell(
                                                              onTap: (){
                                                                Navigator.pop(context);
                                                                androidprovider.ChangeTopchart('Top paid');
                                                              },
                                                              child: Text(
                                                                'Top paid',
                                                                style: TextStyle(
                                                                    color: Colors.black
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                    );
                                  },
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Color(0xffC2E6FE)
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Row(
                                        children: [
                                          Icon(Icons.done,color: Colors.black,size: 15),
                                          SizedBox(width: 5),
                                          Consumer<Androidprovider>(
                                            builder: (context, Androidprovider, child) {
                                              return Text(
                                                Androidprovider.Topchart,
                                                style: TextStyle(
                                                    color: Colors.black
                                                ),
                                              );
                                            },
                                          ),
                                          SizedBox(width: 5),
                                          Icon(Icons.arrow_drop_down_outlined,color: Colors.black,size: 15,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: height-54,
                                          child: Scaffold(
                                            appBar: AppBar(
                                              leading: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                  child: Icon(Icons.close,color: Colors.black)
                                              ),
                                              title: Text('Categories',style: TextStyle(fontWeight: FontWeight.bold),),
                                            ),
                                            body: SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 20),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                    borderRadius: BorderRadius.circular(5)
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: double.infinity,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                          color: Color(0xffC2E6FE),
                                                          //borderRadius: BorderRadius.vertical(top: Radius.circular(5)),
                                                          border: Border(
                                                            bottom:BorderSide(
                                                              color: Colors.grey,
                                                              width: 0.5
                                                            )
                                                          )
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(10),
                                                          child: Text(
                                                            'All Categories',
                                                            style: TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      for(int i=0; i<category.length;i++)...[
                                                        i!=0?Divider(color: Colors.grey,thickness: 0.5,):SizedBox(),
                                                        CategoryList(i: i),
                                                      ]
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1
                                      )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 5),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Catagories',
                                            style: TextStyle(
                                              color: Colors.black
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          Icon(Icons.arrow_drop_down_outlined,color: Colors.black,size: 15,)
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          TopFreeapp(index: '1', Title: 'Inastagram', Iconn: AssetImage('Assets/1.png')),
                          TopFreeapp(index: '2', Title: 'Facebook', Iconn: AssetImage('Assets/2.png'),Install: false),
                          TopFreeapp(index: '3', Title: 'Snapchat', Iconn: AssetImage('Assets/3.png')),
                          TopFreeapp(index: '4', Title: 'Amazon', Iconn: AssetImage('Assets/4.png')),
                          TopFreeapp(index: '5', Title: 'flipkart', Iconn: AssetImage('Assets/5.png'),Install: false),
                          TopFreeapp(index: '6', Title: 'Zomato', Iconn: AssetImage('Assets/6.png')),
                          TopFreeapp(index: '7', Title: 'Picsart', Iconn: AssetImage('Assets/7.png')),
                          TopFreeapp(index: '8', Title: 'Swiggy', Iconn: AssetImage('Assets/8.png'),Install: false),
                          TopFreeapp(index: '9', Title: 'Meesho', Iconn: AssetImage('Assets/9.png')),
                          TopFreeapp(index: '10', Title: 'Instagram', Iconn: AssetImage('Assets/1.png')),
                          TopFreeapp(index: '11', Title: 'Amazon', Iconn: AssetImage('Assets/4.png'),Install: false),
                          TopFreeapp(index: '12', Title: 'Zomato', Iconn: AssetImage('Assets/6.png')),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset('Assets/Kids.png'),
                          SizedBox(height: 15),
                          Center(
                            child: SizedBox(
                              width: 200,
                              child: Text(
                                'Everything here is Teacher Approved',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Center(
                            child: Container(
                              width: 140,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.indigo,
                                borderRadius: BorderRadius.circular(100)
                              ),
                              child: Center(
                                child: Text(
                                  'Learn more',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 25),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              'Browse by age',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
                              child: Row(
                                children: [
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.black,
                                            width: 1
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 11),
                                      child: Text(
                                        'Ages uo to 5',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.black,
                                            width: 1
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 11),
                                      child: Text(
                                        'Ages 6-8',
                                        style: TextStyle(
                                            color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.black,
                                            width: 1
                                        )
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 11),
                                      child: Text(
                                        'Ages 9-12',
                                        style: TextStyle(
                                            color: Colors.black,
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'New & Updted',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                  ),
                                ),
                                Icon(Icons.arrow_forward,color: Colors.black,)
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  App1(Title: 'Space', Iconn: AssetImage('Assets/Games/g1.png')),
                                  App1(Title: 'Ludo', Iconn: AssetImage('Assets/Games/g2.png')),
                                  App1(Title: 'Home', Iconn: AssetImage('Assets/Games/g3.png')),
                                  App1(Title: 'Trio', Iconn: AssetImage('Assets/Games/g4.png')),
                                  App1(Title: 'Cutrope', Iconn: AssetImage('Assets/Games/g5.png')),
                                  App1(Title: 'Brain', Iconn: AssetImage('Assets/Games/g6.png')),
                                  App1(Title: 'Space', Iconn: AssetImage('Assets/Games/g1.png')),
                                  App1(Title: 'ludoking', Iconn: AssetImage('Assets/Games/g2.png')),
                                  App1(Title: 'House', Iconn: AssetImage('Assets/Games/g3.png')),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 280,
                            width: width,
                            color: Color(0xffFDC301),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            'Spark imagination',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 17
                                            ),
                                          ),
                                          Text(
                                            'Creative apps for kids',
                                            style: TextStyle(
                                                color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Icon(Icons.arrow_forward,color: Colors.grey.shade700,)
                                    ],
                                  ),
                                ),
                                Container(
                                  width: width,
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      SizedBox(height: 200,width: 200,child: Image.asset('Assets/Games/kite.png',opacity: AlwaysStoppedAnimation(.5),)),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            SizedBox(height: 200,width: 200,child: Image.asset('Assets/Games/kite.png')),
                                            App1(Title: 'Space', Iconn: AssetImage('Assets/Games/g1.png')),
                                            App1(Title: 'Ludo', Iconn: AssetImage('Assets/Games/g2.png')),
                                            App1(Title: 'Home', Iconn: AssetImage('Assets/Games/g3.png')),
                                            App1(Title: 'Trio', Iconn: AssetImage('Assets/Games/g4.png')),
                                            App1(Title: 'Cutrope', Iconn: AssetImage('Assets/Games/g5.png')),
                                            App1(Title: 'Brain', Iconn: AssetImage('Assets/Games/g6.png')),
                                            App1(Title: 'Space', Iconn: AssetImage('Assets/Games/g1.png')),
                                            App1(Title: 'ludoking', Iconn: AssetImage('Assets/Games/g2.png')),
                                            App1(Title: 'House', Iconn: AssetImage('Assets/Games/g3.png')),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recommended for you',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18
                                  ),
                                ),
                                Icon(Icons.arrow_forward,color: Colors.black,)
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  App1(Title: 'Trio', Iconn: AssetImage('Assets/Games/g4.png')),
                                  App1(Title: 'Cutrope', Iconn: AssetImage('Assets/Games/g5.png')),
                                  App1(Title: 'ludoking', Iconn: AssetImage('Assets/Games/g2.png')),
                                  App1(Title: 'Space', Iconn: AssetImage('Assets/Games/g1.png')),
                                  App1(Title: 'Home', Iconn: AssetImage('Assets/Games/g3.png')),
                                  App1(Title: 'Brain', Iconn: AssetImage('Assets/Games/g6.png')),
                                  App1(Title: 'Space', Iconn: AssetImage('Assets/Games/g1.png')),
                                  App1(Title: 'Ludo', Iconn: AssetImage('Assets/Games/g2.png')),
                                  App1(Title: 'House', Iconn: AssetImage('Assets/Games/g3.png')),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          for(int i=0; i<category.length;i++)...[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: CategoryList(i: i),
                            )
                          ]
                        ],
                      ),
                    ),
                  ]
              ),
            ),
          ),

        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.shade100,
          currentIndex: CurruntIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black45,
          showUnselectedLabels: true,
          unselectedLabelStyle: TextStyle(
              color: Colors.black38
          ),
          selectedLabelStyle: TextStyle(
            color: Colors.black
          ),
          onTap: (value) {
            setState(() {});
            CurruntIndex = value;
          },
          items: [
            BottomNavigationBarItem(
                icon: SizedBox(height:25,width: 25,child: Image.network('https://cdn-icons-png.flaticon.com/128/3743/3743230.png',fit: BoxFit.fill)),
              activeIcon: SizedBox(height:25,width: 25,child: Image.network('https://cdn-icons-png.flaticon.com/128/3743/3743233.png',fit: BoxFit.fill)),
              label: 'Games',
            ),
            BottomNavigationBarItem(
                icon: SizedBox(height:20,width: 20,child: Image.network('https://cdn-icons-png.flaticon.com/128/747/747327.png',fit: BoxFit.fill)),
                activeIcon: SizedBox(height: 25,width: 25,child: Image.network('https://cdn-icons-png.flaticon.com/128/2740/2740727.png',fit: BoxFit.fill)),
                label: 'Apps'
            ),
            BottomNavigationBarItem(
                icon: SizedBox(height:25,width: 25,child: Image.network('https://cdn-icons-png.flaticon.com/128/7794/7794421.png',fit: BoxFit.fill)) ,
                activeIcon: SizedBox(height:25,width: 25,child: Image.network('https://cdn-icons-png.flaticon.com/128/721/721550.png',fit: BoxFit.fill)),
                label: 'Offers'
            ),
            BottomNavigationBarItem(
                icon: SizedBox(height:25,width: 25,child: Image.network('https://cdn-icons-png.flaticon.com/128/25/25775.png',fit: BoxFit.fill)) ,
                activeIcon: SizedBox(height:25,width: 25,child: Image.network('https://cdn-icons-png.flaticon.com/128/28/28602.png',fit: BoxFit.fill)),
                label: 'Books'
            ),
          ]
      ),
    );
  }
}
Widget App({required  String Title , required AssetImage Iconn, bool Install = true}){
  return SizedBox(
    height: 73,
    child: Row(
      children: [
        SizedBox(height: 65,width: 65,child: Image(image: Iconn)),
        SizedBox(width: 10,),
        SizedBox(
          height: 73,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  Title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16
                ),
              ),
              Row(
                children: [
                  Text(
                      'Social',
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Container(
                      height: 4,width: 4,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black
                      ),
                    ),
                  ),
                  Text(
                    'Networking',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
              Install?Row(
                children: [
                  Icon(Icons.file_download_done,color: Colors.grey,size: 15,),
                  SizedBox(width: 4,),
                  Text(
                    'Installed',
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ],
              ):
                  Row(
                    children: [
                      Text(
                        '4.0',
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                      Icon(Icons.star,color: Colors.grey,size: 10,),
                      SizedBox(width: 8),
                      Text(
                        '54 MB',
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                    ],
                  )
            ],
          ),
        ),
      ],
    ),
  );
}
Widget App1({required  String Title , required AssetImage Iconn}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
    child: SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100,width: 100,child: Image(image: Iconn)),
          Text(
              Title,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16
            ),
          ),
          Row(
            children: [
              Text(
                '4.0',
                style: TextStyle(
                    color: Colors.black
                ),
              ),
              Icon(Icons.star,color: Colors.black,size: 10,),
            ],
          ),
        ],
      ),
    ),
  );
}
Widget TopFreeapp({required String index,required  String Title , required AssetImage Iconn, bool Install = true}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    child: Row(
      children: [
        Text(index,style: TextStyle(fontSize: 17),),
        SizedBox(width: 10),
        App(Title: Title, Iconn: Iconn,Install: Install)
      ],
    ),
  );
}
class Androidprovider extends ChangeNotifier{
  String Topchart = 'Top free';
  void ChangeTopchart(String detail){
    Topchart = detail;
    print(Topchart);
    notifyListeners();
  }
}
List<CategoriesList> category = [
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Watch apps'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Watch faces'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Art & Design'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Auto & Vehicles'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Beauty'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Books & Reference'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Buisness'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Comics'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Communication'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Dating'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Education'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Entertainment'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Events'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Finance'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Food & Drink'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Games'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Google Cast'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Health & Fitness'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'House & Home'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Kids'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Libraries & Demo'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Lifestyle'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Maps & Navigation'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Medical'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Music & Audio'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'News & Magazine'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Parenting'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Personalization'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Photography'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Productivity'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Shopping'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Social'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Sports'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Tools'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Travel & Local'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Video Players & Editers'),
  CategoriesList(Image: AssetImage('Assets/Graph.png'), Name: 'Weather'),
];
Widget CategoryList({required int i}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    child: Row(
      children: [
        SizedBox(height: 25,width: 25,child: Image(image: category[i].Image)),
        SizedBox(width: 20,),
        Text(category[i].Name,style: TextStyle(color: Colors.black,fontSize: 17),),
      ],
    ),
  );
}