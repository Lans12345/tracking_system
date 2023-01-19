import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';

class SupplierTab extends StatelessWidget {
  const SupplierTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 100),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextBold(
                            text: 'Supplier X',
                            fontSize: 48,
                            color: Colors.black),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: (() {}),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.grey,
                              size: 18,
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextRegular(
                            text: 'Details', fontSize: 18, color: Colors.black),
                        SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: (() {}),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.grey,
                              size: 12,
                            ))
                      ],
                    ),
                  ],
                ),
                Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 400,
                        child: ListTile(
                          trailing: MaterialButton(
                              child: TextRegular(
                                  text: 'Update',
                                  fontSize: 12,
                                  color: Colors.white),
                              color: primary,
                              onPressed: (() {})),
                          leading: TextRegular(
                              text: 'Bank Type:     ',
                              fontSize: 12,
                              color: Colors.black),
                          title: SizedBox(
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.grey[300],
                                    filled: true,
                                    border: InputBorder.none),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        child: ListTile(
                          trailing: MaterialButton(
                              child: TextRegular(
                                  text: 'Update',
                                  fontSize: 12,
                                  color: Colors.white),
                              color: primary,
                              onPressed: (() {})),
                          leading: TextRegular(
                              text: 'Bank Account:',
                              fontSize: 12,
                              color: Colors.black),
                          title: SizedBox(
                              height: 40,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    fillColor: Colors.grey[300],
                                    filled: true,
                                    border: InputBorder.none),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: TextBold(
                text: 'Products Available', fontSize: 24, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Card(
                        elevation: 3,
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBold(
                                    text: 'Supplier X',
                                    fontSize: 18,
                                    color: Colors.black),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextBold(
                                        text: 'Quantity',
                                        fontSize: 14,
                                        color: Colors.black),
                                    TextRegular(
                                        text: '21',
                                        fontSize: 12,
                                        color: Colors.black)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextBold(
                                        text: 'Kind',
                                        fontSize: 14,
                                        color: Colors.black),
                                    TextRegular(
                                        text: 'Original',
                                        fontSize: 12,
                                        color: Colors.black)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextBold(
                                        text: 'Price',
                                        fontSize: 14,
                                        color: Colors.black),
                                    TextRegular(
                                        text: '25.00',
                                        fontSize: 12,
                                        color: Colors.black)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextBold(
                                        text: 'Price (w/ %)',
                                        fontSize: 14,
                                        color: Colors.black),
                                    TextRegular(
                                        text: '50.00',
                                        fontSize: 12,
                                        color: Colors.black)
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextBold(
                                    text: 'Customer/Unit name:',
                                    fontSize: 14,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'John Doe',
                                    fontSize: 12,
                                    color: Colors.black),
                                SizedBox(
                                  height: 5,
                                ),
                                TextBold(
                                    text: 'Item Description:',
                                    fontSize: 14,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Lorem Ipsum',
                                    fontSize: 12,
                                    color: Colors.black),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: MaterialButton(
                                      child: TextRegular(
                                          text: 'Add to canvass',
                                          fontSize: 12,
                                          color: Colors.white),
                                      minWidth: 200,
                                      color: Colors.blue[800],
                                      onPressed: (() {})),
                                )
                              ],
                            ),
                          ),
                          height: 400,
                          width: 100,
                          decoration: BoxDecoration(color: Colors.black12),
                        ),
                      ),
                    );
                  })),
            ),
          )
        ],
      ),
    );
  }
}
