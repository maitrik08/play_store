import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AndroidScreen.dart';

class IOSScreen extends StatefulWidget {
  const IOSScreen({super.key});

  @override
  State<IOSScreen> createState() => _IOSScreenState();
}
Color color = Color(0xff0982fe);
class _IOSScreenState extends State<IOSScreen> {
  PageController pageController = PageController(
    viewportFraction: 0.91,
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final isoProvider = Provider.of<ISOProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
       body: CustomScrollView(
         slivers: [
           CupertinoSliverNavigationBar(
             backgroundColor: Color(0xff131313),
             largeTitle: Text(
               'Apps',
               style: TextStyle(
                 color: Colors.white,
               ),
             ),

             trailing: Icon(CupertinoIcons.profile_circled,color: color,),
           ),
           SliverToBoxAdapter(
             child: Column(
               children: [
                 Container(
                   height: 330,
                   child: PageView(
                     controller: pageController,
                     scrollDirection: Axis.horizontal,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'GET FIT',
                             style: TextStyle(
                               color: color,
                               fontSize: 13
                             ),
                           ),
                           Text(
                             'adidas Running-Run Trcker',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 17
                             ),
                           ),
                           Text(
                             'Choose your training plan',
                             style: TextStyle(
                                 color: Colors.grey,
                                 fontSize: 16
                             ),
                           ),
                           Image.asset('Assets/Banner1.png')
                         ],
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'GET FIT',
                             style: TextStyle(
                               color: color,
                               fontSize: 13
                             ),
                           ),
                           Text(
                             'adidas Running-Run Trcker',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 17
                             ),
                           ),
                           Text(
                             'Choose your training plan',
                             style: TextStyle(
                                 color: Colors.grey,
                                 fontSize: 16
                             ),
                           ),
                           Image.asset('Assets/Banner2.png',fit: BoxFit.cover,)
                         ],
                       ),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'GET FIT',
                             style: TextStyle(
                               color: color,
                               fontSize: 13
                             ),
                           ),
                           Text(
                             'adidas Running-Run Trcker',
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 17
                             ),
                           ),
                           Text(
                             'Choose your training plan',
                             style: TextStyle(
                                 color: Colors.grey,
                                 fontSize: 16
                             ),
                           ),
                           Image.asset('Assets/Banner3.png')
                         ],
                       )
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Divider(color: Colors.grey.shade800,thickness: 0.5,),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Trending Now',
                         style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                           fontSize: 18
                         ),
                       ),
                       Text(
                         'See All',
                         style: TextStyle(
                             color: color,
                             fontWeight: FontWeight.bold,
                           fontSize: 15
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   height: 250,
                   width: width-30,
                   child: PageView(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 15,bottom: 20),
                         child: SizedBox(
                           height: 220,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Apps(Title: 'Instagram', Iconn: AssetImage('Assets/1.png'),Install: true,SubTitle: 'Social pp'),
                               Apps(Title: 'Facebook', Iconn: AssetImage('Assets/2.png'),Install: false,SubTitle: 'Social media'),
                               Apps(Title: 'Snapchat', Iconn: AssetImage('Assets/3.png'),Install: true,SubTitle: 'Shareing'),
                             ],
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 15,bottom: 20),
                         child: SizedBox(
                           height: 220,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Apps(Title: 'Amazon', Iconn: AssetImage('Assets/4.png'),Install: true,SubTitle: 'Shopping app'),
                               Apps(Title: 'Flipkart', Iconn: AssetImage('Assets/5.png'),Install: false,SubTitle: 'Online Shopping'),
                               Apps(Title: 'Zomato', Iconn: AssetImage('Assets/6.png'),Install: true,SubTitle: 'Food Online'),
                             ],
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 15,bottom: 20),
                         child: SizedBox(
                           height: 180,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Apps(Title: 'Picsart', Iconn: AssetImage('Assets/7.png'),Install: true,SubTitle: 'Image Generator'),
                               Apps(Title: 'Swiggy', Iconn: AssetImage('Assets/8.png'),Install: false,SubTitle: 'Food app'),
                               Apps(Title: 'Meesho', Iconn: AssetImage('Assets/9.png'),Install: true,SubTitle: 'Shoppind'),
                             ],
                           ),
                         ),
                       ),
                    ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Divider(color: Colors.grey.shade800,thickness: 0.5,),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Find Date',
                         style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 18
                         ),
                       ),
                       Text(
                         'See All',
                         style: TextStyle(
                             color: color,
                             fontWeight: FontWeight.bold,
                             fontSize: 15
                         ),
                       ),
                     ],
                   ),
                 ),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Row(
                       children: [
                         App2(Title: 'Space', Iconn: AssetImage('Assets/Games/g1.png')),
                         App2(Title: 'Ludo', Iconn: AssetImage('Assets/Games/g2.png')),
                         App2(Title: 'Home', Iconn: AssetImage('Assets/Games/g3.png')),
                         App2(Title: 'Trio', Iconn: AssetImage('Assets/Games/g4.png')),
                         App2(Title: 'Cutrope', Iconn: AssetImage('Assets/Games/g5.png')),
                         App2(Title: 'Brain', Iconn: AssetImage('Assets/Games/g6.png')),
                         App2(Title: 'Space', Iconn: AssetImage('Assets/Games/g1.png')),
                         App2(Title: 'ludoking', Iconn: AssetImage('Assets/Games/g2.png')),
                         App2(Title: 'House', Iconn: AssetImage('Assets/Games/g3.png')),
                       ],
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Divider(color: Colors.grey.shade800,thickness: 0.5,),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Trending Now',
                         style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 18
                         ),
                       ),
                       Text(
                         'See All',
                         style: TextStyle(
                             color: color,
                             fontWeight: FontWeight.bold,
                             fontSize: 15
                         ),
                       ),
                     ],
                   ),
                 ),
                 Container(
                   height: 250,
                   width: width-30,
                   child: PageView(
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(top: 15,bottom: 20),
                         child: SizedBox(
                           height: 180,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Apps(Title: 'Picsart', Iconn: AssetImage('Assets/7.png'),Install: true,SubTitle: 'Image Generator'),
                               Apps(Title: 'Swiggy', Iconn: AssetImage('Assets/8.png'),Install: false,SubTitle: 'Food app'),
                               Apps(Title: 'Meesho', Iconn: AssetImage('Assets/9.png'),Install: true,SubTitle: 'Shoppind'),
                             ],
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 15,bottom: 20),
                         child: SizedBox(
                           height: 220,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Apps(Title: 'Instagram', Iconn: AssetImage('Assets/1.png'),Install: true,SubTitle: 'Social pp'),
                               Apps(Title: 'Facebook', Iconn: AssetImage('Assets/2.png'),Install: false,SubTitle: 'Social media'),
                               Apps(Title: 'Snapchat', Iconn: AssetImage('Assets/3.png'),Install: true,SubTitle: 'Shareing'),
                             ],
                           ),
                         ),
                       ),
                       Padding(
                         padding: const EdgeInsets.only(top: 15,bottom: 20),
                         child: SizedBox(
                           height: 220,
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Apps(Title: 'Amazon', Iconn: AssetImage('Assets/4.png'),Install: true,SubTitle: 'Shopping app'),
                               Apps(Title: 'Flipkart', Iconn: AssetImage('Assets/5.png'),Install: false,SubTitle: 'Online Shopping'),
                               Apps(Title: 'Zomato', Iconn: AssetImage('Assets/6.png'),Install: true,SubTitle: 'Food Online'),
                             ],
                           ),
                         ),
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Divider(color: Colors.grey.shade800,thickness: 0.5,),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         'Reccomended for you',
                         style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.bold,
                             fontSize: 18
                         ),
                       ),
                       Text(
                         'See All',
                         style: TextStyle(
                             color: color,
                             fontWeight: FontWeight.bold,
                             fontSize: 15
                         ),
                       ),
                     ],
                   ),
                 ),
                 SingleChildScrollView(
                   scrollDirection: Axis.horizontal,
                   child: Padding(
                     padding: const EdgeInsets.only(left: 10),
                     child: Row(
                       children: [
                         App2(Title: 'Cutrope', Iconn: AssetImage('Assets/Games/g5.png')),
                         App2(Title: 'Brain', Iconn: AssetImage('Assets/Games/g6.png')),
                         App2(Title: 'Space', Iconn: AssetImage('Assets/Games/g1.png')),
                         App2(Title: 'ludoking', Iconn: AssetImage('Assets/Games/g2.png')),
                         App2(Title: 'Trio', Iconn: AssetImage('Assets/Games/g4.png')),
                         App2(Title: 'House', Iconn: AssetImage('Assets/Games/g3.png')),
                         App2(Title: 'Space', Iconn: AssetImage('Assets/Games/g1.png')),
                         App2(Title: 'Ludo', Iconn: AssetImage('Assets/Games/g2.png')),
                         App2(Title: 'Home', Iconn: AssetImage('Assets/Games/g3.png')),

                       ],
                     ),
                   ),
                 ),
               ],
             ),
           )
         ],
       ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: isoProvider.currentIndex,
        backgroundColor: CupertinoColors.black,
        inactiveColor: CupertinoColors.systemGrey,
        onTap: (value) {
          isoProvider.changeIndex(value);
        },
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon:  Icon(CupertinoIcons.today),
            label: 'Today',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rocket_fill),
            label: 'Games',
          ),
          BottomNavigationBarItem(
            icon:Icon(CupertinoIcons.layers_alt_fill),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.archivebox),
            label: 'Arcade',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: 'Search',
          ),
        ],
      ),
    );
  }
}
Widget App2({required  String Title , required AssetImage Iconn}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
    child: SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 150,width: 150,child: Image(image: Iconn,fit: BoxFit.cover,),),
          Text(
            Title,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            children: [
              Text(
                '4.0',
                style: TextStyle(
                    color: Colors.grey
                ),
              ),
              Icon(Icons.star,color: Colors.grey,size: 10,),
            ],
          ),
        ],
      ),
    ),
  );
}
class ISOProvider extends ChangeNotifier {
  int currentIndex = 0;
  bool all = true;
  bool Missed = true;
  void changeIndex(int value) {
    currentIndex = value;
    notifyListeners();
  }
  void ALL(){
    all = true;
    Missed = true;
    notifyListeners();
  }
  void missed(){
    all = false;
    Missed = false;
    notifyListeners();
  }
}
Widget Apps({required  String Title ,required  String SubTitle, required AssetImage Iconn, bool Install = true}){
  return SizedBox(
    height: 70,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SizedBox(height: 65,width: 65,child: Stack(
              children: [
                Center(child: Container(color: Colors.white,height: 50,width: 50,)),
                Image(image: Iconn),
              ],
            )),
            SizedBox(width: 10,),
            SizedBox(
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 17
                    ),
                  ),
                  Text(
                    SubTitle,
                    style: TextStyle(
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Install?Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color(0xff2B2B2B)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 3),
            child: Text(
              'Get',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),
            ),
          ),
        ):SizedBox(width: 70,child: Center(child: Icon(CupertinoIcons.cloud_download,color: color,)))
      ],
    ),
  );
}
