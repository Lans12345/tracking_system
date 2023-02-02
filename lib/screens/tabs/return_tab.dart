import 'package:flutter/material.dart';
import 'package:tracking_system/widgets/list_widget.dart';

class ReturnTab extends StatelessWidget {
  const ReturnTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 25, 20),
              child: Card(
                elevation: 5,
                child: ClipRRect(
                  child: Container(
                    height: 30,
                    color: Colors.white,
                    child: const TabBar(
                      unselectedLabelColor: Colors.black,
                      indicator: BoxDecoration(color: Colors.black),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'QRegular',
                        fontSize: 14,
                      ),
                      tabs: [
                        // Tab(
                        //   text: 'Register',
                        // ),
                        Tab(
                          text: 'All Items',
                        ),
                        Tab(
                          text: 'Done',
                        ),
                        Tab(
                          text: 'Returned',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Expanded(
            child: TabBarView(children: [
              ListWidget(),
              ListWidget(),
              ListWidget(),
            ]),
          ),
        ],
      ),
    );
  }
}
