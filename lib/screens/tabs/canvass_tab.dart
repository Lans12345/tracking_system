import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';

class CanvassTab extends StatefulWidget {
  @override
  State<CanvassTab> createState() => _CanvassTabState();
}

class _CanvassTabState extends State<CanvassTab> {
  var dropItem = ['Date', 'Name', 'Price'];

  var dropValue = 0;

  late List<bool> check = [];

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
              SizedBox(
                width: 30,
              ),
              Container(
                color: Colors.grey[300],
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: DropdownButton(
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
                TextBold(text: 'Supplier X', fontSize: 24, color: Colors.black),
                MaterialButton(
                    height: 40,
                    minWidth: 200,
                    child: TextRegular(
                        text: 'Add to canvass',
                        fontSize: 12,
                        color: Colors.white),
                    color: blueAccent,
                    onPressed: (() {})),
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
