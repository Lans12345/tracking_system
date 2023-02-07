import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';

class AddSupplierTab extends StatefulWidget {
  @override
  State<AddSupplierTab> createState() => _AddSupplierTabState();
}

class _AddSupplierTabState extends State<AddSupplierTab> {
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
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: (() {}),
                            icon: const Icon(
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
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: (() {}),
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.grey,
                              size: 12,
                            ))
                      ],
                    ),
                  ],
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 400,
                        child: ListTile(
                          trailing: MaterialButton(
                              color: primary,
                              onPressed: (() {}),
                              child: TextRegular(
                                  text: 'Update',
                                  fontSize: 12,
                                  color: Colors.white)),
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
                              color: primary,
                              onPressed: (() {}),
                              child: TextRegular(
                                  text: 'Update',
                                  fontSize: 12,
                                  color: Colors.white)),
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
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBold(text: 'Items', fontSize: 24, color: Colors.black),
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
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 350,
            decoration: const BoxDecoration(
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
                        color: primary,
                        onPressed: (() {
                          setState(() {
                            count++;
                          });
                        }),
                        child: TextRegular(
                            text: 'Add Item',
                            fontSize: 12,
                            color: Colors.white)),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const VerticalDivider(),
                  const SizedBox(
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
                          const SizedBox(
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
                          const SizedBox(
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
                          const SizedBox(
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
                  const VerticalDivider(),
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
                                    color: const Color(0xff4EA430),
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
                                    }),
                                    child: TextRegular(
                                        text: 'Post Item',
                                        fontSize: 18,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
