import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';

class ShipTab extends StatefulWidget {
  @override
  State<ShipTab> createState() => _ShipTabState();
}

class _ShipTabState extends State<ShipTab> {
  var dropItem = ['Date', 'Name', 'Price'];

  var dropValue = 0;
  var dropValue2 = 0;
  var dropValue3 = 0;

  late List<bool> check = [];

  var paymentModes = ['COD', 'Bank Payment'];

  var couriers = ['Oro Frontier', 'AP Cargo', 'Jades Cargo', 'LBC', 'Others'];

  var courier = 'Oro Frontier';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
                        prefixIcon: Icon(Icons.search),
                        fillColor: Colors.grey[300],
                        filled: true,
                        border: InputBorder.none),
                  )),
              SizedBox(
                width: 20,
              ),
              MaterialButton(
                  child: TextRegular(
                      text: 'Search', fontSize: 12, color: Colors.white),
                  color: primary,
                  onPressed: (() {})),
              Expanded(
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
                                text: "Sort by: " + dropItem[i],
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
                                  DataCell(Builder(builder: (context) {
                                    return Checkbox(
                                        value: true,
                                        onChanged: ((value) {
                                          setState(() {});
                                        }));
                                  })),
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
                    SizedBox(
                      height: 10,
                    ),
                    TextBold(
                        text: 'Supplier X', fontSize: 24, color: Colors.black),
                    SizedBox(
                      height: 10,
                    ),
                    TextRegular(
                        text: 'Customer/Unit name: ',
                        fontSize: 14,
                        color: Colors.black),
                  ],
                ),
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
                        SizedBox(
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
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: 180,
                            height: 30,
                            child: TextBold(
                                text: 'Total: ',
                                fontSize: 14,
                                color: Colors.black)),
                        SizedBox(
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
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            height: 30,
                            width: 200,
                            child: TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Waybill No.'),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                            height: 40,
                            minWidth: 200,
                            child: TextRegular(
                                text: 'Confirm',
                                fontSize: 12,
                                color: Colors.white),
                            color: blueAccent,
                            onPressed: (() {})),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          height: 100,
          margin: EdgeInsets.only(left: 30, right: 30, bottom: 20),
          width: double.infinity,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}
