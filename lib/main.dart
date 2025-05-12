import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Items UI',
      theme: ThemeData.dark(),
      home: const ItemsPage(),
    );
  }
}

class ItemsPage extends StatefulWidget {
  const ItemsPage({super.key});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const TopNavBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,vertical: MediaQuery.of(context).size.height * 0.025),
              child: Row(
                children: [
                  const Text('Items', style: TextStyle(fontSize: 30)),
                  Spacer(),
                  VerticalDivider(
                    color: Color(0xFF484848),
                    thickness: 1,
                  ),
                  SizedBox(width:  MediaQuery.of(context).size.height * 0.02),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.055,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF171717),
                    ),
                    child: Image(
                      height: MediaQuery.of(context).size.height * 0.045,
                      image: NetworkImage(
                        'https://firebasestorage.googleapis.com/v0/b/gas-app-e12b7.appspot.com/o/sliders.png?alt=media&token=93033c85-6c68-4fe3-91d0-e1685e7ade2d',
                      ),
                    ),
                  ),
                  SizedBox(width:  MediaQuery.of(context).size.height * 0.02),

                  AddNewItemButton(),
                ],
              ),
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount = 1;
                  if (constraints.maxWidth >= 1200) {
                    crossAxisCount = 4;
                  } else if (constraints.maxWidth >= 800) {
                    crossAxisCount = 3;
                  } else if (constraints.maxWidth >= 600) {
                    crossAxisCount = 2;
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: 8,
                    itemBuilder: (context, index) {
                      return const ItemCard();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopNavBar extends StatefulWidget {
  const TopNavBar({super.key});

  @override
  State<TopNavBar> createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  List<bool> index=[true,false,false,false,false,];
  List<String> items=['Items', 'Pricing', 'Info', 'Tasks', 'Analytics'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05,vertical: MediaQuery.of(context).size.height * 0.025),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white10),
        ),
      ),
      child: Row(
        children: [
           Image(
            height: MediaQuery.of(context).size.height * 0.05,
            image: NetworkImage(
              'https://firebasestorage.googleapis.com/v0/b/gas-app-e12b7.appspot.com/o/logo.png?alt=media&token=6bb39240-c032-4b36-bd05-b69da5b91ea6',
            ),
          ),
          Spacer(),
          Row(
            children: [
              for (int i = 0; i < items.length; i++)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.015),
                  child: Column(
                    children: [
                      GestureDetector(
                          onTap: (){
                            setState(() {
                               if(items[i]=='Items'){
                                 index=[true,false,false,false,false,];
                               }else if(items[i]=='Pricing'){
                                 index=[false,true,false,false,false,];
                               }else if(items[i]=='Info'){
                                 index=[false,false,true,false,false,];
                               }else if(items[i]=='Tasks'){
                                 index=[false,false,false,true,false,];
                               }else if(items[i]=='Analytics'){
                                 index=[false,false,false,false,true,];
                               }
                            });
                          },
                          child: Text(
                              items[i], style:  TextStyle(
                              fontSize: 14,
                              color: index[i]==true? Colors.white:Color(0xFF999999),
                          ))

                      ),
                      Spacer(),
                      index[i]==true?
                      Container(
                        width: MediaQuery.of(context).size.height * 0.05,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: Color(0xFFFFC268),
                      ):Container(),
                    ],
                  ),
                ),
              VerticalDivider(
                color: Color(0xFF484848),
                thickness: 1,
              ),
              SizedBox(width:  MediaQuery.of(context).size.height * 0.02),
              Image(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.035,
                image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/gas-app-e12b7.appspot.com/o/Icons.png?alt=media&token=59e510cb-5f21-4534-8ec2-8ea51e51af48',
                ),
              ),
              SizedBox(width:  MediaQuery.of(context).size.height * 0.04),
              Image(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.035,
                image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/gas-app-e12b7.appspot.com/o/Icons%20(1).png?alt=media&token=346439ab-1ff4-43e8-a4ab-5f9c473eaad5',
                ),
              ),
              SizedBox(width:  MediaQuery.of(context).size.height * 0.02),
              VerticalDivider(
                color: Color(0xFF484848),
                thickness: 1,
              ),
              SizedBox(width:  MediaQuery.of(context).size.height * 0.02),

              Image(
                height: MediaQuery.of(context).size.height * 0.045,
                image: NetworkImage(
                  'https://firebasestorage.googleapis.com/v0/b/gas-app-e12b7.appspot.com/o/Frame%2077134.png?alt=media&token=8c21e50d-10b2-434b-8e18-61d64f177976',
                ),
              ),
              SizedBox(width:  MediaQuery.of(context).size.height * 0.02),
              const Text('John Doe', style:  TextStyle(
                fontSize: 14,
                color: Colors.white,
              )
              ),
              SizedBox(width:  MediaQuery.of(context).size.height * 0.02),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                size: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class AddNewItemButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.015,
          vertical: MediaQuery.of(context).size.height * 0.02
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFFC268),
          borderRadius: BorderRadius.circular(100),
        ),
        height: MediaQuery.of(context).size.height * 0.07,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const Icon(Icons.add,color: Colors.black,),
             SizedBox(width:  MediaQuery.of(context).size.height * 0.01),
             const Text('Add a New Item',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black
            ),),
          ],
        ),
      )
    );
  }
}
class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent,Color(0xFF262626),],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // صورة + تدرج تحتها
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 180,
                  child: Image.network(
                    'https://images.unsplash.com/photo-1507525428034-b723cf961d3e',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent,Color(0xFF262626),],
                    ),
                  ),
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.transparent],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFF262626).withOpacity(0.4),
                        blurRadius: 30,
                        spreadRadius: 20,
                        offset: Offset(0, 40),
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  top: 8,
                  right: 8,
                  child: Icon(Icons.more_horiz, color: Colors.white),
                ),
              ],
            ),
          ),


          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.orangeAccent),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Pending Approval', style: TextStyle(fontSize: 12)),
                    Icon(Icons.keyboard_arrow_down, size: 16),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              const Text('Item title', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 6),
              const Row(
                children: [
                  Icon(Icons.calendar_today, size: 14),
                  SizedBox(width: 6),
                  Text('Jan 16 - Jan 20, 2024', style: TextStyle(fontSize: 13)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: const [
                  CircleAvatar(radius: 12, backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/1.jpg')),
                  SizedBox(width: 4),
                  CircleAvatar(radius: 12, backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/2.jpg')),
                  SizedBox(width: 4),
                  CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.grey,
                    child: Text('+6', style: TextStyle(fontSize: 10)),
                  ),
                  Spacer(),
                  Text('4 unfinished tasks', style: TextStyle(fontSize: 12))
                ],
              )
            ],
          )
          ],
        ),
    );
  }
}
