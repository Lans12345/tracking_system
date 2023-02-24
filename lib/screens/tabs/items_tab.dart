import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

import '../../services/add_item.dart';

class ItemsTab extends StatefulWidget {
  @override
  State<ItemsTab> createState() => _ItemsTabState();
}

class _ItemsTabState extends State<ItemsTab> {
  var search = '';

  int highestValue = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                  width: 220,
                  height: 40,
                  child: TextFormField(
                    onChanged: ((value) {
                      setState(() {
                        search = value;
                      });
                    }),
                    decoration: InputDecoration(
                        hintText: 'Search Unit Name',
                        prefixIcon: const Icon(Icons.search),
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: InputBorder.none),
                  )),
              const SizedBox(
                width: 20,
              ),
              MaterialButton(
                  color: primary,
                  onPressed: (() {}),
                  child: TextRegular(
                      text: 'Search', fontSize: 12, color: Colors.white)),
              const Expanded(
                child: SizedBox(
                  width: 30,
                ),
              ),
            ],
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBold(
                    text: 'Products Available',
                    fontSize: 24,
                    color: Colors.black),
                // MaterialButton(
                //     child: TextRegular(
                //         text: 'Add Product', fontSize: 12, color: Colors.white),
                //     height: 40,
                //     minWidth: 150,
                //     color: Colors.blue[800],
                //     onPressed: (() {
                //       showModalBottomSheet(
                //           context: context,
                //           builder: ((context) {
                //             return StatefulBuilder(
                //                 builder: ((context, setState) {
                //               return SizedBox(
                //                 height: 500,
                //                 child: Column(
                //                   children: [
                //                     Padding(
                //                       padding: const EdgeInsets.only(right: 30),
                //                       child: Align(
                //                         alignment: Alignment.topRight,
                //                         child: IconButton(
                //                           onPressed: (() {
                //                             Navigator.pop(context);
                //                           }),
                //                           icon: Icon(
                //                             Icons.close,
                //                             color: Colors.red,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               );
                //             }));
                //           }));
                //     })),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Unit')
                  .where('unitName',
                      isGreaterThanOrEqualTo: toBeginningOfSentenceCase(search))
                  .where('unitName',
                      isLessThan: '${toBeginningOfSentenceCase(search)}z')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(child: Text('Something went wrong'));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final data = snapshot.requireData;

                return Expanded(
                  child: SizedBox(
                    child: GridView.builder(
                        itemCount: data.docs.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: ((context, index) {
                          dynamic units = data.docs[index]['unit'];
                          int highestPrice = 99999999999;
                          for (var i = 0; i < data.docs.length; i++) {
                            int currentPrice = data.docs[i]['total'];
                            if (currentPrice < highestPrice) {
                              highestPrice = currentPrice;
                            }
                          }

                          int currentPrice = data.docs[index]['total'];
                          bool isHighest = currentPrice == highestPrice;

                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              elevation: 3,
                              child: Container(
                                height: 400,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    border: Border.all(
                                        width: isHighest ? 3 : 0,
                                        color: isHighest
                                            ? Colors.green
                                            : Colors.transparent)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextBold(
                                          text: data.docs[index]
                                              ['supplierName'],
                                          fontSize: 18,
                                          color: Colors.black),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextBold(
                                              text: 'Unit Name',
                                              fontSize: 14,
                                              color: Colors.black),
                                          TextRegular(
                                              text: data.docs[index]
                                                  ['unitName'],
                                              fontSize: 12,
                                              color: Colors.black)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextBold(
                                              text: 'Owner Name',
                                              fontSize: 14,
                                              color: Colors.black),
                                          TextRegular(
                                              text: data.docs[index]['ownName'],
                                              fontSize: 12,
                                              color: Colors.black)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Divider(),
                                      SingleChildScrollView(
                                        child: SizedBox(
                                          height: 130,
                                          child: DataTable(columns: [
                                            DataColumn(
                                                label: TextBold(
                                                    text: 'Item',
                                                    fontSize: 14,
                                                    color: Colors.black)),
                                            DataColumn(
                                                label: TextBold(
                                                    text: 'Qty',
                                                    fontSize: 14,
                                                    color: Colors.black)),
                                            DataColumn(
                                                label: TextBold(
                                                    text: 'Kind',
                                                    fontSize: 14,
                                                    color: Colors.black)),
                                            DataColumn(
                                                label: TextBold(
                                                    text: 'Price',
                                                    fontSize: 14,
                                                    color: Colors.black)),
                                          ], rows: [
                                            for (int i = 0;
                                                i < units.length;
                                                i++)
                                              DataRow(cells: [
                                                DataCell(
                                                  TextRegular(
                                                      text: units[i]['desc'],
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                DataCell(
                                                  TextRegular(
                                                      text: units[i]['qty'],
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                DataCell(
                                                  TextRegular(
                                                      text: units[i]['kind'],
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                                DataCell(
                                                  TextRegular(
                                                      text: units[i]['price'],
                                                      fontSize: 12,
                                                      color: Colors.black),
                                                ),
                                              ])
                                          ]),
                                        ),
                                      ),
                                      const Divider(),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      StreamBuilder<DocumentSnapshot>(
                                          stream: FirebaseFirestore.instance
                                              .collection('Tool')
                                              .doc('percent')
                                              .snapshots(),
                                          builder: (context,
                                              AsyncSnapshot<DocumentSnapshot>
                                                  snapshot) {
                                            if (!snapshot.hasData) {
                                              return const Center(
                                                  child: Text('Loading'));
                                            } else if (snapshot.hasError) {
                                              return const Center(
                                                  child: Text(
                                                      'Something went wrong'));
                                            } else if (snapshot
                                                    .connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }

                                            dynamic data12 = snapshot.data;
                                            return Center(
                                              child: MaterialButton(
                                                  minWidth: 200,
                                                  color: isHighest
                                                      ? Colors.green[800]
                                                      : Colors.blue[800],
                                                  onPressed: (() {
                                                    for (int i = 0;
                                                        i < units.length;
                                                        i++) {
                                                      double newPri = units[i]
                                                              ['total'] *
                                                          data12['num'];
                                                      addItem(
                                                          'To Canvass',
                                                          units[i]['desc'],
                                                          units[i]['price'],
                                                          units[i]['qty'],
                                                          units[i]['kind'],
                                                          data.docs[index]
                                                              ['supplierName'],
                                                          data.docs[index]
                                                              ['supplierId'],
                                                          data.docs[index]
                                                              ['unitName'],
                                                          '',
                                                          '',
                                                          '',
                                                          '',
                                                          units[i]['desc'],
                                                          newPri
                                                              .toStringAsFixed(
                                                                  2));
                                                    }

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: TextRegular(
                                                                text:
                                                                    'Added to Canvass',
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white)));
                                                  }),
                                                  child: TextRegular(
                                                      text: 'Add to canvass',
                                                      fontSize: 12,
                                                      color: Colors.white)),
                                            );
                                          }),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: MaterialButton(
                                            minWidth: 200,
                                            color: Colors.red,
                                            onPressed: (() {
                                              FirebaseFirestore.instance
                                                  .collection('Items')
                                                  .doc(data.docs[index].id)
                                                  .delete();
                                            }),
                                            child: TextRegular(
                                                text: 'Delete',
                                                fontSize: 12,
                                                color: Colors.white)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })),
                  ),
                );
              }),
        ],
      ),
    );
  }
}
