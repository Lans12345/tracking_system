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
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: DropdownButton(
                      value: dropValue,
                      items: [
                        for (int i = 0; i < dropItem.length; i++)
                          DropdownMenuItem(
                            onTap: () {},
                            value: i,
                            child: TextRegular(
                                text: "Sort by: ${dropItem[i]}",
                                fontSize: 12,
                                color: Colors.black),
                          ),
                      ],
                      onChanged: ((value) {
                        setState(() {
                          dropValue = int.parse(value.toString());
                        });
                      })),
                ),
              )
            ],
          ),
        ),
        StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('Items')
                .where('status', isEqualTo: 'To Canvass')
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
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: DataTable(columns: [
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Item Name',
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
                                        text: 'Availability',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Price',
                                        fontSize: 14,
                                        color: Colors.black)),
                                DataColumn(
                                    label: TextRegular(
                                        text: 'Price (w/ %)',
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
                                            text: 'Item',
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: '5',
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: 'Original',
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: 'Yes',
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: '250',
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(TextRegular(
                                            text: '500',
                                            fontSize: 12,
                                            color: Colors.black)),
                                        DataCell(
                                          Row(
                                            children: [
                                              MaterialButton(
                                                  height: 35,
                                                  minWidth: 80,
                                                  color: blueAccent,
                                                  onPressed: (() {}),
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
                                                  onPressed: (() {}),
                                                  child: TextRegular(
                                                      text: 'Delete',
                                                      fontSize: 10,
                                                      color: Colors.white)),
                                            ],
                                          ),
                                        ),
                                      ])
                              ]),
                            )
                          ],
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
                      height: 10,
                    ),
                    TextBold(
                        text: 'Supplier X', fontSize: 24, color: Colors.black),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        width: 250,
                        height: 35,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: 'Customer/Unit name',
                              border: InputBorder.none),
                        )),
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
