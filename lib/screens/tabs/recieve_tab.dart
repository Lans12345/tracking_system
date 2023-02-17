import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class ReceiveTab extends StatefulWidget {
  @override
  State<ReceiveTab> createState() => _ReceiveTabState();
}

class _ReceiveTabState extends State<ReceiveTab> {
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
                  width: 240,
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
                .collection('Items')
                .where('status', isEqualTo: 'To Receive')
                .where('description',
                    isGreaterThanOrEqualTo: toBeginningOfSentenceCase(search))
                .where('description',
                    isLessThan: '${toBeginningOfSentenceCase(search)}z')
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
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: InteractiveViewer(
                        scaleEnabled: false,
                        child: Scrollbar(
                          controller: scrollController,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: DataTable(columns: [
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Supplier',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Unit\nName',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Courier',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Item\nName',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Quantity',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Kind',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Payment\nMode',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Price',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Price\n(w/ %)',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'BALANCE',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'TOTAL',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Waybill\nNo.',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: '',
                                        fontSize: 14,
                                        color: Colors.black)),
                              ], rows: [
                                for (int i = 0; i < data.size; i++)
                                  DataRow(
                                      color: MaterialStateProperty.resolveWith<
                                          Color?>((Set<MaterialState> states) {
                                        return Colors.white;
                                      }),
                                      cells: [
                                        DataCell(TextRegular(
                                            text: data.docs[i]['supplier'],
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: data.docs[i]['unitName'],
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: data.docs[i]['courier'],
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: data.docs[i]['description'],
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: data.docs[i]['qty'],
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: data.docs[i]['kind'],
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: data.docs[i]['paymentMode'],
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: data.docs[i]['price'],
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: data.docs[i]['newPrice']
                                                .toString(),
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: data.docs[i]['balance'],
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: (int.parse(
                                                        data.docs[i]['qty']) *
                                                    (int.parse(
                                                        data.docs[i]['price'])))
                                                .toString(),
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: data.docs[i]['wayBillNo'],
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(
                                          Row(
                                            children: [
                                              MaterialButton(
                                                  height: 35,
                                                  minWidth: 80,
                                                  color: blueAccent,
                                                  onPressed: (() {
                                                    FirebaseFirestore.instance
                                                        .collection('Items')
                                                        .doc(data.docs[i].id)
                                                        .update({
                                                      'status': 'To Deliver'
                                                    });
                                                  }),
                                                  child: TextRegular(
                                                      text: 'Add to Deliver',
                                                      fontSize: 10,
                                                      color: Colors.white)),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              MaterialButton(
                                                  height: 35,
                                                  minWidth: 80,
                                                  color: redAccent,
                                                  onPressed: (() {
                                                    FirebaseFirestore.instance
                                                        .collection('Items')
                                                        .doc(data.docs[i].id)
                                                        .delete();
                                                  }),
                                                  child: TextRegular(
                                                      text: 'Delete',
                                                      fontSize: 10,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ])
                              ]),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
