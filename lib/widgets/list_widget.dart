import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_system/widgets/text_widget.dart';

class ListWidget extends StatelessWidget {
  String query = '';

  ListWidget({required this.query});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Items')
            .where('status', isEqualTo: query)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return const Center(child: Text('Something went wrong'));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.requireData;
          return GridView.builder(
              itemCount: data.docs.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: ((context, index) {
                return Card(
                  elevation: 3,
                  child: Container(
                    color: Colors.grey[300],
                    height: 300,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBold(
                              text: 'Supplier X',
                              fontSize: 18,
                              color: Colors.black),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Customer/Unit Name:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Item Description:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Quantity:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Kind:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Price:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Courier:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Total:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Waybill No.:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }));
        });
  }
}
