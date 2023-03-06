import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class ShipTab extends StatefulWidget {
  @override
  State<ShipTab> createState() => _ShipTabState();
}

class _ShipTabState extends State<ShipTab> {
  var dropItem = ['Date', 'Name', 'Price'];

  var dropValue = 0;
  var dropValue2 = 0;
  var dropValue3 = 0;
  var search = '';

  late List<bool> check = [];

  var paymentModes = ['COD', 'Bank Payment'];

  var couriers = ['Oro Frontier', 'AP Cargo', 'Jades Cargo', 'LBC', 'Others'];

  var courier = 'Oro Frontier';

  var waybillNo = '';

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
                .where('status', isEqualTo: 'Ship')
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
                                        fontSize: 14,
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
                                            fontSize: 12,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]['unitName'],
                                            fontSize: 10,
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
                                            text: 'Plate Number',
                                            fontSize: 12,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]
                                                ['plateNumber'],
                                            fontSize: 10,
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
                                            fontSize: 12,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]['ownName'],
                                            fontSize: 10,
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
                                            text: 'Total',
                                            fontSize: 12,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]['total']
                                                .toString(),
                                            fontSize: 10,
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
                                            text: 'Partial Payment',
                                            fontSize: 12,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]['balance']
                                                .toString(),
                                            fontSize: 10,
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
                                            text: 'Payment Mode',
                                            fontSize: 12,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]
                                                    ['paymentMode']
                                                .toString(),
                                            fontSize: 10,
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
                                            text: 'Total w/ %',
                                            fontSize: 12,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]['newPrice']
                                                .toString(),
                                            fontSize: 10,
                                            color: Colors.black)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: 80,
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
                                      height: 10,
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
                                                  if (waybillNo == '') {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: TextRegular(
                                                                text:
                                                                    'Please add way bill number',
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white)));
                                                  } else {
                                                    await FirebaseFirestore
                                                        .instance
                                                        .collection('Unit')
                                                        .doc(
                                                            data.docs[index].id)
                                                        .update({
                                                      'status': 'Recieve',
                                                      'courier': courier,
                                                      'wayBillNo': waybillNo
                                                    });

                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: TextRegular(
                                                                text:
                                                                    'Added to Recieve',
                                                                fontSize: 18,
                                                                color: Colors
                                                                    .white)));
                                                  }
                                                }),
                                                child: TextRegular(
                                                    text: 'Add to Recieve',
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
        Container(
          height: 100,
          margin: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
          width: double.infinity,
          color: Colors.grey[300],
          child: Padding(
            padding: const EdgeInsets.only(
              left: 50,
              right: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextBold(
                            text: 'Select Courier',
                            fontSize: 14,
                            color: Colors.black),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 50, right: 50),
                            child: DropdownButton(
                                value: dropValue3,
                                items: [
                                  for (int i = 0; i < couriers.length; i++)
                                    DropdownMenuItem(
                                      onTap: () {
                                        courier = couriers[i];
                                      },
                                      value: i,
                                      child: TextRegular(
                                          text: couriers[i],
                                          fontSize: 12,
                                          color: Colors.black),
                                    ),
                                ],
                                onChanged: ((value) {
                                  setState(() {
                                    dropValue3 = int.parse(value.toString());
                                  });
                                })),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 80,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 30,
                            width: 200,
                            child: TextFormField(
                              onChanged: ((value) {
                                waybillNo = value;
                              }),
                              decoration: const InputDecoration(
                                  hintText: 'Waybill No.'),
                            )),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
