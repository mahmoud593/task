import 'package:flutter/material.dart';


void main() async{
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
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05,
                  vertical: MediaQuery.of(context).size.height * 0.025),
              child: Row(
                children: [
                  const Text('Items', style: TextStyle(fontSize: 30)),
                  Spacer(),
                  VerticalDivider(
                    color: Color(0xFF484848),
                    thickness: 1,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.055,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF171717),
                    ),
                    child: Image.asset('assets/images/sliders.png',color: Colors.white,),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.height * 0.02),
                  MediaQuery.sizeOf(context).width <= 500?Container():  AddNewItemButton(),
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
  List<bool> index = [
    true,
    false,
    false,
    false,
    false,
  ];
  List<String> items = ['Items', 'Pricing', 'Info', 'Tasks', 'Analytics'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: MediaQuery.of(context).size.height * 0.025),
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.white10),
        ),
      ),
      child: Row(
        children: [
          // Menu Icon (Visible only on small screens)
          MediaQuery.sizeOf(context).width <= 500 ?Icon(Icons.menu):Container(),
          SizedBox(width: MediaQuery.of(context).size.height * 0.01),

          // Logo
          Image.asset(
            height: MediaQuery.of(context).size.height * 0.05,
            'assets/images/logo.png',
          ),

          Spacer(),

          // Menu Items (Visible only on large screens)

          MediaQuery.sizeOf(context).width <= 500?
          const SizedBox.shrink():Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(items.length, (i) {
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.015,
                ),
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          index = List.generate(items.length, (j) => j == i);
                        });
                      },
                      child: Text(
                        items[i],
                        style: TextStyle(
                          fontSize: 14,
                          color: index[i] ? Colors.white : Color(0xFF999999),
                        ),
                      ),
                    ),
                    const Spacer(),
                    if (index[i])
                      Container(
                        width: MediaQuery.of(context).size.height * 0.05,
                        height: MediaQuery.of(context).size.height * 0.005,
                        color: const Color(0xFFFFC268),
                      ),
                    // Right-side icons
                    VerticalDivider(
                      color: Color(0xFF484848),
                      thickness: 1,
                    ),
                  ],
                ),
              );
            }),
          ),


          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
          Icon(Icons.settings,
            color: Colors.white,
            size: MediaQuery.of(context).size.height * 0.035,
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.04),
          Icon(Icons.notifications_none_rounded,
            color: Colors.white,
            size: MediaQuery.of(context).size.height * 0.035,
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
          VerticalDivider(
            color: Color(0xFF484848),
            thickness: 1,
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
          Image.asset(
            height: MediaQuery.of(context).size.height * 0.045,
            'assets/images/user.png',
          ),
          SizedBox(width: MediaQuery.of(context).size.height * 0.02),
          MediaQuery.sizeOf(context).width <= 500?SizedBox() : Row(
            children: [
              const Text('John Doe',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  )),
              SizedBox(width: MediaQuery.of(context).size.height * 0.02),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                size: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
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
              vertical: MediaQuery.of(context).size.height * 0.02),
          decoration: BoxDecoration(
            color: const Color(0xFFFFC268),
            borderRadius: BorderRadius.circular(100),
          ),
          height: MediaQuery.of(context).size.height * 0.07,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                color: Colors.black,
              ),
              SizedBox(width: MediaQuery.of(context).size.height * 0.01),
              const Text(
                'Add a New Item',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ],
          ),
        ));
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF171717),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize:  MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [0.14, .5],
                    colors: [Color(0xFF171717), Color(0x33171717)],
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  child: Image.asset(
                    width: double.infinity,
                    'assets/images/image.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 1,
                right: 8,
                child: Container(
                    height: 50,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black54,
                    ),
                    child: Icon(Icons.more_horiz_sharp,
                        color: Colors.white.withOpacity(.5))),
              ),
              Positioned(
                bottom: 8,
                left: 15,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orangeAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Pending Approval',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                const Text('Long item title highlighti...',
                    style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                const Row(
                  children: [
                    Icon(
                      Icons.calendar_month_rounded,
                      size: 14,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 6),
                    Text('Jan 16 - Jan 20, 2024',
                        style: TextStyle(fontSize: 13, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 12),
                Divider(),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 80,
                      height: 24,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            child: CircleAvatar(
                                radius: 12,
                                child:  Image.asset(
                                    'assets/images/woman.png')),
                          ),
                          const SizedBox(width: 4),
                          Positioned(
                            left: 16,
                            child: CircleAvatar(
                                radius: 12,
                                child:  Image.asset(
                                    'assets/images/man.png')),
                          ),
                          const SizedBox(width: 4),
                          const Positioned(
                            left: 32,
                            child: CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.grey,
                              child: Text('+6', style: TextStyle(fontSize: 10)),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Text('4 unfinished tasks',
                        style: TextStyle(fontSize: 12))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
