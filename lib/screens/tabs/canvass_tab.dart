import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class CanvassTab extends StatefulWidget {
  @override
  State<CanvassTab> createState() => _CanvassTabState();
}

class _CanvassTabState extends State<CanvassTab> {
  var dropItem = ['Date', 'Name', 'Price'];

  var dropValue = 0;

  late List<bool> check = [];

  var search = '';

  String unitName = '';

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                        hintText: 'Search here',
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
        ),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Unit')
                .where('unitName',
                    isGreaterThanOrEqualTo: toBeginningOfSentenceCase(search))
                .where('unitName',
                    isLessThan: '${toBeginningOfSentenceCase(search)}z')
                .where('status', isEqualTo: 'Canvass')
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return const Center(child: Text('Something went wrong'));
              } else if (snapshot.connectionState == ConnectionState.waiting) {
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
                              decoration: const BoxDecoration(
                                color: Colors.black12,
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextBold(
                                        text: data.docs[index]['supplierName'],
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
                                            text: data.docs[index]['unitName'],
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
                                    SizedBox(
                                      height: 130,
                                      child: SingleChildScrollView(
                                        child: SizedBox(
                                          height: 150,
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
                                          } else if (snapshot.connectionState ==
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
                                                onPressed: (() async {
                                                  await FirebaseFirestore
                                                      .instance
                                                      .collection('Unit')
                                                      .doc(data.docs[index].id)
                                                      .update({
                                                    'status': 'Order',
                                                    'newPrice': (data12['num'] *
                                                            data.docs[index]
                                                                ['total']) +
                                                        data.docs[index]
                                                            ['total']
                                                  });

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(SnackBar(
                                                          content: TextRegular(
                                                              text:
                                                                  'Added to Order',
                                                              fontSize: 18,
                                                              color: Colors
                                                                  .white)));
                                                }),
                                                child: TextRegular(
                                                    text: 'Add to Order',
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
    );
  }
}
