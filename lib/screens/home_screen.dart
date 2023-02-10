import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:tracking_system/screens/tabs/canvass_tab.dart';
import 'package:tracking_system/screens/tabs/deliver_tab.dart';
import 'package:tracking_system/screens/tabs/items_tab.dart';
import 'package:tracking_system/screens/tabs/order_tab.dart';
import 'package:tracking_system/screens/tabs/recieve_tab.dart';
import 'package:tracking_system/screens/tabs/return_tab.dart';
import 'package:tracking_system/screens/tabs/ship_tab.dart';
import 'package:tracking_system/screens/tabs/supplier_tab.dart';
import 'package:tracking_system/services/add_supplier.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';

class HomeScreen extends StatelessWidget {
  PageController page = PageController();
  SideMenuController page1 = SideMenuController();

  String name = '';
  String details = '';
  String bankType = '';
  String bankAccount = '';

  @override
  Widget build(BuildContext context) {
    List<SideMenuItem> items = [
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 0,
          title: 'Supplier',
          onTap: ((p0, p1) {
            page.jumpToPage(0);
            page1.changePage(0);
          })),
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 1,
          icon: const Icon(Icons.add),
          title: 'Add Supplier',
          onTap: ((p0, p1) {
            showDialog(
                context: context,
                builder: ((context) {
                  return Dialog(
                      child: SizedBox(
                    height: 400,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 40,
                              width: 300,
                              child: TextFormField(
                                onChanged: ((value) {
                                  name = value;
                                }),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey[300],
                                    filled: true,
                                    hintText: 'Supplier Name',
                                    border: InputBorder.none),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              height: 40,
                              width: 300,
                              child: TextFormField(
                                onChanged: ((value) {
                                  details = value;
                                }),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey[300],
                                    filled: true,
                                    hintText: 'Supplier Details',
                                    border: InputBorder.none),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              height: 40,
                              width: 300,
                              child: TextFormField(
                                onChanged: ((value) {
                                  bankType = value;
                                }),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey[300],
                                    filled: true,
                                    hintText: 'Bank Type',
                                    border: InputBorder.none),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              height: 40,
                              width: 300,
                              child: TextFormField(
                                onChanged: ((value) {
                                  bankAccount = value;
                                }),
                                decoration: InputDecoration(
                                    fillColor: Colors.grey[300],
                                    filled: true,
                                    hintText: 'Bank Account',
                                    border: InputBorder.none),
                              )),
                          const SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                              minWidth: 250,
                              height: 50,
                              color: primary,
                              onPressed: (() {
                                addSupplier(
                                    name, details, bankType, bankAccount);
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: TextRegular(
                                            text: 'Supplier Added!',
                                            fontSize: 18,
                                            color: Colors.white)));
                              }),
                              child: TextRegular(
                                  text: 'Continue',
                                  fontSize: 18,
                                  color: Colors.white)),
                        ],
                      ),
                    ),
                  ));
                }));
          })),
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 1,
          title: 'All Items',
          onTap: ((p0, p1) {
            page.jumpToPage(1);
            page1.changePage(1);
          })),
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 2,
          title: 'For Canvass',
          onTap: ((p0, p1) {
            page.jumpToPage(2);
            page1.changePage(2);
          })),
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 3,
          title: 'To Order',
          onTap: ((p0, p1) {
            page.jumpToPage(3);
            page1.changePage(3);
          })),
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 4,
          title: 'To Ship (To CDO)',
          onTap: ((p0, p1) {
            page.jumpToPage(4);
            page1.changePage(4);
          })),
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 5,
          title: 'To Receive (Courier to Agora)',
          onTap: ((p0, p1) {
            page.jumpToPage(5);
            page1.changePage(5);
          })),
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 6,
          title: 'To Deliver (Agora to Shop)',
          onTap: ((p0, p1) {
            page.jumpToPage(6);
            page1.changePage(6);
          })),
      SideMenuItem(
          // Priority of item to show on SideMenu, lower value is displayed at the top
          priority: 7,
          title: 'To Return',
          onTap: ((p0, p1) {
            page.jumpToPage(7);
            page1.changePage(7);
          })),
    ];
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(color: primary),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 100,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextBold(
                          text: 'Autoworx', fontSize: 32, color: Colors.white),
                      TextRegular(
                          text: 'Parts and accessories',
                          fontSize: 15,
                          color: Colors.white),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 500,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 300,
                    color: brownAccent,
                    child: SideMenu(
                      style: SideMenuStyle(
                          openSideMenuWidth: 200,
                          compactSideMenuWidth: 40,
                          hoverColor: Colors.brown[100],
                          selectedIconColor: Colors.white,
                          unselectedIconColor: Colors.white,
                          selectedTitleTextStyle: const TextStyle(
                              color: Colors.white, fontFamily: 'QBold'),
                          unselectedTitleTextStyle: const TextStyle(
                              color: Colors.white, fontFamily: 'QRegular'),
                          selectedColor: Colors.black26,
                          iconSize: 20,
                          showTooltip: true,
                          itemHeight: 50.0,
                          itemInnerSpacing: 8.0,
                          itemOuterPadding:
                              const EdgeInsets.symmetric(horizontal: 10.0),
                          toggleColor: Colors.black54),
                      // Page controller to manage a PageView
                      controller: page1,
                      // Will shows on top of all items, it can be a logo or a Title text

                      // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open

                      // Notify when display mode changed

                      // List of SideMenuItem to show them on SideMenu
                      items: items,
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: page,
                      children: [
                        SupplierTab(),
                        ItemsTab(),
                        CanvassTab(),
                        OrderTab(),
                        ShipTab(),
                        ReceiveTab(),
                        DeliverTab(),
                        const ReturnTab(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
