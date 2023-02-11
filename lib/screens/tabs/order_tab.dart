import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;

class OrderTab extends StatefulWidget {
  @override
  State<OrderTab> createState() => _OrderTabState();
}

class _OrderTabState extends State<OrderTab> {
  var dropItem = ['Date', 'Name', 'Price'];

  var dropValue = 0;
  var dropValue2 = 0;

  late List<bool> check = [];

  var paymentModes = ['COD', 'Bank Payment'];

  var search = '';
  var unitName = '';

  var totalPrice = [];
  var totalQty = [];

  var paymentMode = 'COD';

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
                .collection('Items')
                .where('description',
                    isGreaterThanOrEqualTo: toBeginningOfSentenceCase(search))
                .where('description',
                    isLessThan: '${toBeginningOfSentenceCase(search)}z')
                .where('status', isEqualTo: 'To Order')
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
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
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
                                          text: '',
                                          fontSize: 14,
                                          color: Colors.black)),
                                ], rows: [
                                  for (int i = 0; i < data.size; i++)
                                    DataRow(
                                        color: MaterialStateProperty
                                            .resolveWith<Color?>(
                                                (Set<MaterialState> states) {
                                          return Colors.white;
                                        }),
                                        cells: [
                                          DataCell(TextRegular(
                                              text: data.docs[i]['supplier'],
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
                                          DataCell(Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: DropdownButton(
                                                value: dropValue2,
                                                items: [
                                                  for (int i = 0;
                                                      i < paymentModes.length;
                                                      i++)
                                                    DropdownMenuItem(
                                                      onTap: () {
                                                        paymentMode =
                                                            paymentModes[i];
                                                      },
                                                      value: i,
                                                      child: TextRegular(
                                                          text: paymentModes[i],
                                                          fontSize: 12,
                                                          color: Colors.black),
                                                    ),
                                                ],
                                                onChanged: ((value) {
                                                  setState(() {
                                                    dropValue2 = int.parse(
                                                        value.toString());
                                                  });
                                                })),
                                          )),
                                          DataCell(TextRegular(
                                              text: data.docs[i]['price'],
                                              fontSize: 12,
                                              color: Colors.black)),
                                          DataCell(TextRegular(
                                              text: (int.parse(data.docs[i]
                                                          ['price']) +
                                                      (int.parse(data.docs[i]
                                                              ['price'])) *
                                                          0.45)
                                                  .toString(),
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
                                                      if (unitName == '') {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(SnackBar(
                                                                content: TextRegular(
                                                                    text:
                                                                        'Cannot Procceed! Please add Customer/Unit Name',
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .white)));
                                                      } else {
                                                        FirebaseFirestore
                                                            .instance
                                                            .collection('Items')
                                                            .doc(
                                                                data.docs[i].id)
                                                            .update({
                                                          'status': 'To Ship',
                                                          'paymentMode':
                                                              paymentMode,
                                                          'unitName': unitName
                                                        });
                                                      }
                                                    }),
                                                    child: TextRegular(
                                                        text: 'Add to Order',
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: 250,
                        height: 35,
                        child: TextFormField(
                          onChanged: ((value) {
                            unitName = value;
                          }),
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Customer/Unit name',
                              border: InputBorder.none),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: 180,
                            height: 30,
                            child: TextBold(
                                text: 'Total: ',
                                fontSize: 14,
                                color: Colors.black)),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: 180,
                            height: 30,
                            child: TextBold(
                                text: 'Total Quantity: ',
                                fontSize: 14,
                                color: Colors.black)),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
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
