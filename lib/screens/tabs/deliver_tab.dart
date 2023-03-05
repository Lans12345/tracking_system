import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_system/services/add_item.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class DeliverTab extends StatefulWidget {
  @override
  State<DeliverTab> createState() => _DeliverTabState();
}

class _DeliverTabState extends State<DeliverTab> {
  var dropItem = ['Date', 'Name', 'Price'];

  var dropValue = 0;
  var dropValue2 = 0;
  var dropValue3 = 0;

  var search = '';

  late List<bool> check = [];

  var paymentModes = ['COD', 'Bank Payment'];

  var couriers = ['Oro Frontier', 'AP Cargo', 'Jades Cargo', 'LBC', 'Others'];

  var courier = 'Oro Frontier';

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
                .where('status', isEqualTo: 'Deliver')
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
                                            text: 'Plate Number',
                                            fontSize: 14,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]
                                                ['plateNumber'],
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
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TextBold(
                                            text: 'Total',
                                            fontSize: 14,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]['total']
                                                .toString(),
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
                                            text: 'Partial Payment',
                                            fontSize: 14,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]['balance']
                                                .toString(),
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
                                            text: 'Total w/ %',
                                            fontSize: 14,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]['newPrice']
                                                .toString(),
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
                                            text: 'Waybill Number',
                                            fontSize: 14,
                                            color: Colors.black),
                                        TextRegular(
                                            text: data.docs[index]['wayBillNo']
                                                .toString(),
                                            fontSize: 12,
                                            color: Colors.black)
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(),
                                    SizedBox(
                                      height: 120,
                                      child: Scrollbar(
                                        controller: scrollController,
                                        child: SingleChildScrollView(
                                          controller: scrollController,
                                          scrollDirection: Axis.horizontal,
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
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
                                                DataColumn(
                                                    label: TextBold(
                                                        text: '',
                                                        fontSize: 14,
                                                        color: Colors.black)),
                                                DataColumn(
                                                    label: TextBold(
                                                        text: '',
                                                        fontSize: 14,
                                                        color: Colors.black)),
                                              ], rows: [
                                                for (int i = 0;
                                                    i < units.length;
                                                    i++)
                                                  DataRow(cells: [
                                                    DataCell(
                                                      TextRegular(
                                                          text: units[i]
                                                              ['desc'],
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
                                                          text: units[i]
                                                              ['kind'],
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    DataCell(
                                                      TextRegular(
                                                          text: units[i]
                                                              ['price'],
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                    DataCell(MaterialButton(
                                                        color: Colors.blue,
                                                        onPressed: (() async {
                                                          addItem(
                                                              'Done',
                                                              units[i]['desc'],
                                                              units[i]['price'],
                                                              units[i]['qty'],
                                                              units[i]['kind'],
                                                              data.docs[index][
                                                                  'supplierName'],
                                                              data.docs[index][
                                                                  'supplierId'],
                                                              data.docs[index]
                                                                  ['unitName'],
                                                              '',
                                                              courier,
                                                              data.docs[index]
                                                                  ['wayBillNo'],
                                                              data.docs[index]
                                                                  ['balance'],
                                                              data.docs[index]
                                                                  ['ownName'],
                                                              units[i]
                                                                  ['newPrice']);

                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Unit')
                                                              .doc(data
                                                                  .docs[index]
                                                                  .id)
                                                              .update({
                                                            'unit': FieldValue
                                                                .arrayRemove([
                                                              data.docs[index]
                                                                  ['unit'][i]
                                                            ])
                                                          });
                                                        }),
                                                        child: TextRegular(
                                                            text: 'Done',
                                                            fontSize: 12,
                                                            color:
                                                                Colors.white))),
                                                    DataCell(MaterialButton(
                                                        color: Colors.red,
                                                        onPressed: (() async {
                                                          addItem(
                                                              'Return',
                                                              units[i]['desc'],
                                                              units[i]['price'],
                                                              units[i]['qty'],
                                                              units[i]['kind'],
                                                              data.docs[index][
                                                                  'supplierName'],
                                                              data.docs[index][
                                                                  'supplierId'],
                                                              data.docs[index]
                                                                  ['unitName'],
                                                              '',
                                                              courier,
                                                              data.docs[index]
                                                                  ['wayBillNo'],
                                                              data.docs[index]
                                                                  ['balance'],
                                                              data.docs[index]
                                                                  ['ownName'],
                                                              units[i]
                                                                  ['newPrice']);

                                                          await FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'Unit')
                                                              .doc(data
                                                                  .docs[index]
                                                                  .id)
                                                              .update({
                                                            'unit': FieldValue
                                                                .arrayRemove([
                                                              data.docs[index]
                                                                  ['unit'][i]
                                                            ])
                                                          });
                                                        }),
                                                        child: TextRegular(
                                                            text: 'Return',
                                                            fontSize: 12,
                                                            color:
                                                                Colors.white))),
                                                  ])
                                              ]),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Divider(),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Center(
                                      child: MaterialButton(
                                          minWidth: 200,
                                          color: Colors.red,
                                          onPressed: (() {
                                            FirebaseFirestore.instance
                                                .collection('Unit')
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
