import 'package:app_compras/constants/theme.dart';
import 'package:app_compras/widgets/home_bottom_bar.dart';
import 'package:app_compras/widgets/items_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 15),
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){},
                        child: Icon(
                          Icons.sort_rounded, 
                          color: AppTheme.colorWhite,
                          size: 35,
                        ),
                      ),
                      InkWell(
                        onTap: (){},
                        child: Icon(
                          Icons.shopping_cart, 
                          color: AppTheme.colorWhite,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text("It's a Great Day for Coffee", 
                      style: TextStyle(
                        color: AppTheme.colorWhite,
                        fontSize:30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color:Color.fromARGB(255, 50, 54, 60),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Find your coffee",
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.5)
                      ),
                      prefixIcon: Icon(
                        Icons.search, 
                        size:30, 
                        color:Colors.white.withOpacity(0.5)
                      ),
                    ),
                  ),
                ),
                TabBar(
                  labelStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
                  labelColor: AppTheme.colorOrange,
                  labelPadding: EdgeInsets.symmetric(horizontal: 20),
                  isScrollable: false,
                  unselectedLabelColor: Colors.white.withOpacity(0.5),
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(
                      width: 3,
                      color: AppTheme.colorOrange,
                    ),
                  ),
                  indicatorColor: Colors.transparent,
                  controller: _tabController,
                  tabs: [
                    Tab(text: "Cappuccino",),
                    Tab(text: "Hot Coffee",),
                  ],
                ),
                SizedBox(height: 10,),
                Center(
                  child: [
                    ItemsWidget(),
                    ItemsWidget(),                  
                  ][_tabController.index],
                )
              ],
            ),
          )
      ),
      bottomNavigationBar: HomeBottomBar(),
    );
  }
}