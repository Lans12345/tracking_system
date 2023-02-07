import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';

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
        Expanded(
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
                                  text: 'Payment Mode',
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
                                  text: '', fontSize: 14, color: Colors.black)),
                        ], rows: [
                          for (int i = 0; i < 10; i++)
                            DataRow(
                                color:
                                    MaterialStateProperty.resolveWith<Color?>(
                                        (Set<MaterialState> states) {
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
                                              onTap: () {},
                                              value: i,
                                              child: TextRegular(
                                                  text: paymentModes[i],
                                                  fontSize: 12,
                                                  color: Colors.black),
                                            ),
                                        ],
                                        onChanged: ((value) {
                                          setState(() {
                                            dropValue2 =
                                                int.parse(value.toString());
                                          });
                                        })),
                                  )),
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
                                                text: 'Add to Ship',
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
        ),
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
