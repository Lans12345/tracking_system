import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';

class SupplierTab extends StatefulWidget {
  @override
  State<SupplierTab> createState() => _SupplierTabState();
}

class _SupplierTabState extends State<SupplierTab> {
  var count = 1;

  var kinds = ['Original', 'Surplus', 'Replacement'];

  var kind = '';

  int dropDownValue = 0;

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
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBold(
                    text: 'Products Available',
                    fontSize: 24,
                    color: Colors.black),
                // MaterialButton(
                //     child: TextRegular(
                //         text: 'Add Product', fontSize: 12, color: Colors.white),
                //     height: 40,
                //     minWidth: 150,
                //     color: Colors.blue[800],
                //     onPressed: (() {
                //       showModalBottomSheet(
                //           context: context,
                //           builder: ((context) {
                //             return StatefulBuilder(
                //                 builder: ((context, setState) {
                //               return SizedBox(
                //                 height: 500,
                //                 child: Column(
                //                   children: [
                //                     Padding(
                //                       padding: const EdgeInsets.only(right: 30),
                //                       child: Align(
                //                         alignment: Alignment.topRight,
                //                         child: IconButton(
                //                           onPressed: (() {
                //                             Navigator.pop(context);
                //                           }),
                //                           icon: Icon(
                //                             Icons.close,
                //                             color: Colors.red,
                //                           ),
                //                         ),
                //                       ),
                //                     ),
                //                   ],
                //                 ),
                //               );
                //             }));
                //           }));
                //     })),
              ],
            ),
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
          ),
          Divider(),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Tooltip(
                    message: 'Click this button to add item',
                    child: MaterialButton(
                        child: TextRegular(
                            text: 'Add Item',
                            fontSize: 12,
                            color: Colors.white),
                        color: primary,
                        onPressed: (() {
                          setState(() {
                            count++;
                          });
                        })),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  VerticalDivider(),
                  SizedBox(
                    width: 10,
                  ),
                  SingleChildScrollView(
                    child: SizedBox(
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextRegular(
                                  text: 'Item Description: ',
                                  fontSize: 12,
                                  color: Colors.black),
                              for (int i = 1; i < count; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: SizedBox(
                                    width: 220,
                                    height: 40,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.grey[300],
                                          filled: true,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextRegular(
                                  text: 'Item Price: ',
                                  fontSize: 12,
                                  color: Colors.black),
                              for (int i = 1; i < count; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: SizedBox(
                                    width: 100,
                                    height: 40,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.grey[300],
                                          filled: true,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextRegular(
                                  text: 'Quantity: ',
                                  fontSize: 12,
                                  color: Colors.black),
                              for (int i = 1; i < count; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: SizedBox(
                                    width: 100,
                                    height: 40,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.grey[300],
                                          filled: true,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextRegular(
                                  text: 'Kind:',
                                  fontSize: 12,
                                  color: Colors.black),
                              for (int i = 1; i < count; i++)
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: SizedBox(
                                    width: 100,
                                    height: 40,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          fillColor: Colors.grey[300],
                                          filled: true,
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  VerticalDivider(),
                  count != 1
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 50),
                          child: Center(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Tooltip(
                                message: 'Click this button to post all items',
                                child: MaterialButton(
                                    minWidth: 180,
                                    height: 50,
                                    child: TextRegular(
                                        text: 'Post Item',
                                        fontSize: 18,
                                        color: Colors.white),
                                    color: Color(0xff4EA430),
                                    onPressed: (() {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.white,
                                          content: TextRegular(
                                              text: 'Items posted succesfully!',
                                              fontSize: 18,
                                              color: Colors.black),
                                        ),
                                      );
                                    })),
                              ),
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
