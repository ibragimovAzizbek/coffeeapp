import 'package:coffeeapp/core/constants/color_const.dart';
import 'package:coffeeapp/core/widgets/my_appbar.dart';
import 'package:coffeeapp/providers/regsterAndLogin/login_provider.dart';
import 'package:coffeeapp/screens/log/admin/admin_home_page.dart';
import 'package:coffeeapp/screens/log/admin/order_admin_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: 'Coffee Shop Admin Panel',
        funtion: () {
          context.read<LoginProvider>().logOut(context);
        },
      ),
      body: TabBarView(controller: tabController, children: [
        AdminHomePage(),
        OrderAdminPage(),
      ]),
      bottomNavigationBar: TabBar(
        indicatorColor: ColorConst.kPrimaryColor,
        labelColor: ColorConst.kBlack,
        unselectedLabelColor: ColorConst.kGreyText,
        controller: tabController,
        tabs: const [
          Tab(
            icon: Icon(Icons.home),
            text: "Home",
          ),
          Tab(
            icon: Icon(Icons.shopping_bag),
            text: "Orders",
          ),
        ],
      ),
    );
  }
}
