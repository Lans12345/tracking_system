import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tracking_system/services/add_item.dart';
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

  String id = '';

  late String newBankType;
  late String newBankAcc;

  var descs = [];
  var prices = [];
  var qtys = [];
  var newKinds = [];

  List<TextEditingController> descController = [];
  List<TextEditingController> priceController = [];
  List<TextEditingController> qtyController = [];
  List<TextEditingController> kindController = [];

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < count; i++) {
      descController.add(TextEditingController());
      priceController.add(TextEditingController());
      qtyController.add(TextEditingController());
      kindController.add(TextEditingController());
    }
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
                    StreamBuilder<DocumentSnapshot>(
                        stream: id != ''
                            ? FirebaseFirestore.instance
                                .collection('Supplier')
                                .doc(id)
                                .snapshots()
                            : null,
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: Text('Loading'));
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Something went wrong'));
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          dynamic data = snapshot.data;
                          return TextBold(
                              text: data['name'],
                              fontSize: 48,
                              color: Colors.black);
                        }),
                    StreamBuilder<DocumentSnapshot>(
                        stream: id != ''
                            ? FirebaseFirestore.instance
                                .collection('Supplier')
                                .doc(id)
                                .snapshots()
                            : null,
                        builder: (context,
                            AsyncSnapshot<DocumentSnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return const Center(child: Text('Loading'));
                          } else if (snapshot.hasError) {
                            return const Center(
                                child: Text('Something went wrong'));
                          } else if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }

                          dynamic data = snapshot.data;
                          return TextRegular(
                              text: data['details'],
                              fontSize: 18,
                              color: Colors.black);
                        }),
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
                              onPressed: (() async {
                                await FirebaseFirestore.instance
                                    .collection('Supplier')
                                    .doc(id)
                                    .update({'bankType': newBankType});
                              }),
                              child: TextRegular(
                                  text: 'Update',
                                  fontSize: 12,
                                  color: Colors.white)),
                          leading: TextRegular(
                              text: 'Bank Type:     ',
                              fontSize: 12,
                              color: Colors.black),
                          title: StreamBuilder<DocumentSnapshot>(
                              stream: id != ''
                                  ? FirebaseFirestore.instance
                                      .collection('Supplier')
                                      .doc(id)
                                      .snapshots()
                                  : null,
                              builder: (context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(child: Text('Loading'));
                                } else if (snapshot.hasError) {
                                  return const Center(
                                      child: Text('Something went wrong'));
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                dynamic data = snapshot.data;
                                return SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        newBankType = value;
                                      },
                                      decoration: InputDecoration(
                                          fillColor: Colors.grey[300],
                                          filled: true,
                                          hintText: data['bankType'],
                                          border: InputBorder.none),
                                    ));
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 400,
                        child: ListTile(
                          trailing: MaterialButton(
                              color: primary,
                              onPressed: (() async {
                                await FirebaseFirestore.instance
                                    .collection('Supplier')
                                    .doc(id)
                                    .update({'bankAccount': newBankAcc});
                              }),
                              child: TextRegular(
                                  text: 'Update',
                                  fontSize: 12,
                                  color: Colors.white)),
                          leading: TextRegular(
                              text: 'Bank Account:',
                              fontSize: 12,
                              color: Colors.black),
                          title: StreamBuilder<DocumentSnapshot>(
                              stream: id != ''
                                  ? FirebaseFirestore.instance
                                      .collection('Supplier')
                                      .doc(id)
                                      .snapshots()
                                  : null,
                              builder: (context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (!snapshot.hasData) {
                                  return const Center(child: Text('Loading'));
                                } else if (snapshot.hasError) {
                                  return const Center(
                                      child: Text('Something went wrong'));
                                } else if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }

                                dynamic data = snapshot.data;
                                return SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      onChanged: (value) {
                                        newBankAcc = value;
                                      },
                                      decoration: InputDecoration(
                                          fillColor: Colors.grey[300],
                                          filled: true,
                                          hintText: data['bankAccount'],
                                          border: InputBorder.none),
                                    ));
                              }),
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
                TextBold(
                    text: 'Items Available', fontSize: 24, color: Colors.black),
                const Expanded(child: SizedBox()),
                TextBold(
                    text: 'Suppliers: ', fontSize: 24, color: Colors.black),
                const SizedBox(
                  width: 10,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('Supplier')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return const Center(child: Text('Error'));
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        print('waiting');
                        return const Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: Center(
                              child: CircularProgressIndicator(
                            color: Colors.black,
                          )),
                        );
                      }

                      final data = snapshot.requireData;

                      return Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 50, right: 50),
                          child: DropdownButton(
                              value: dropDownValue,
                              items: [
                                for (int i = 0; i < data.size; i++)
                                  DropdownMenuItem(
                                    onTap: () {
                                      id = data.docs[i].id;
                                    },
                                    value: i,
                                    child: TextRegular(
                                        text: data.docs[i]['name'],
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                              ],
                              onChanged: ((value) {
                                setState(() {
                                  dropDownValue = int.parse(value.toString());
                                });
                              })),
                        ),
                      );
                    }),
                const SizedBox(
                  width: 20,
                ),
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
          StreamBuilder<QuerySnapshot>(
              stream: id != ''
                  ? FirebaseFirestore.instance
                      .collection('Items')
                      .where('supplierId', isEqualTo: id)
                      .where('status', isEqualTo: 'None')
                      .snapshots()
                  : null,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: Text('Loading'));
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Something went wrong'));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
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
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Card(
                              elevation: 3,
                              child: Container(
                                height: 400,
                                width: 100,
                                decoration:
                                    const BoxDecoration(color: Colors.black12),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextBold(
                                          text: data.docs[index]['supplier'],
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
                                              text: 'Quantity',
                                              fontSize: 14,
                                              color: Colors.black),
                                          TextRegular(
                                              text: data.docs[index]['qty'],
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
                                              text: 'Kind',
                                              fontSize: 14,
                                              color: Colors.black),
                                          TextRegular(
                                              text: data.docs[index]['kind'],
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
                                              text: 'Price',
                                              fontSize: 14,
                                              color: Colors.black),
                                          TextRegular(
                                              text: data.docs[index]['price'],
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
                                              text: 'Price (w/ %)',
                                              fontSize: 14,
                                              color: Colors.black),
                                          TextRegular(
                                              text: (int.parse(data.docs[index]
                                                          ['price']) +
                                                      (int.parse(
                                                              data.docs[index]
                                                                  ['price'])) *
                                                          0.45)
                                                  .toString(),
                                              fontSize: 12,
                                              color: Colors.black)
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextBold(
                                          text: 'Customer/Unit name:',
                                          fontSize: 14,
                                          color: Colors.black),
                                      TextRegular(
                                          text: 'None',
                                          fontSize: 12,
                                          color: Colors.black),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      TextBold(
                                          text: 'Item Description:',
                                          fontSize: 14,
                                          color: Colors.black),
                                      TextRegular(
                                          text: data.docs[index]['description'],
                                          fontSize: 12,
                                          color: Colors.black),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Center(
                                        child: MaterialButton(
                                            minWidth: 200,
                                            color: Colors.blue[800],
                                            onPressed: (() {
                                              FirebaseFirestore.instance
                                                  .collection('Items')
                                                  .doc(data.docs[index].id)
                                                  .update(
                                                      {'status': 'To Canvass'});

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(SnackBar(
                                                      content: TextRegular(
                                                          text:
                                                              'Added to Canvass',
                                                          fontSize: 18,
                                                          color:
                                                              Colors.white)));
                                            }),
                                            child: TextRegular(
                                                text: 'Add to canvass',
                                                fontSize: 12,
                                                color: Colors.white)),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Center(
                                        child: MaterialButton(
                                            minWidth: 200,
                                            color: Colors.red,
                                            onPressed: (() {
                                              FirebaseFirestore.instance
                                                  .collection('Items')
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
          const Divider(),
          id != ''
              ? Container(
                  width: double.infinity,
                  height: 120,
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
                                    for (int i = 0; i < count; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: SizedBox(
                                          width: 220,
                                          height: 40,
                                          child: TextField(
                                            controller: descController[i],
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
                                    for (int i = 0; i < count; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: SizedBox(
                                          width: 100,
                                          height: 40,
                                          child: TextFormField(
                                            controller: priceController[i],
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
                                    for (int i = 0; i < count; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: SizedBox(
                                          width: 100,
                                          height: 40,
                                          child: TextFormField(
                                            controller: qtyController[i],
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
                                    for (int i = 0; i < count; i++)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, bottom: 5),
                                        child: SizedBox(
                                          width: 100,
                                          height: 40,
                                          child: TextFormField(
                                            controller: kindController[i],
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
                        StreamBuilder<DocumentSnapshot>(
                            stream: id != ''
                                ? FirebaseFirestore.instance
                                    .collection('Supplier')
                                    .doc(id)
                                    .snapshots()
                                : null,
                            builder: (context,
                                AsyncSnapshot<DocumentSnapshot> snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(child: Text('Loading'));
                              } else if (snapshot.hasError) {
                                return const Center(
                                    child: Text('Something went wrong'));
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              dynamic data = snapshot.data;
                              return Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 0, 30, 50),
                                child: Center(
                                  child: Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Tooltip(
                                      message:
                                          'Click this button to post all items',
                                      child: MaterialButton(
                                          minWidth: 180,
                                          height: 50,
                                          color: const Color(0xff4EA430),
                                          onPressed: (() {
                                            for (int i = 0; i < count; i++) {
                                              addItem(
                                                  'None',
                                                  descController[i].text,
                                                  priceController[i].text,
                                                  qtyController[i].text,
                                                  kindController[i].text,
                                                  data['name'],
                                                  data['id'],
                                                  '',
                                                  '',
                                                  '',
                                                  '');

                                              descController[i].clear();
                                              priceController[i].clear();
                                              qtyController[i].clear();
                                              kindController[i].clear();
                                            }
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                backgroundColor: Colors.white,
                                                content: TextRegular(
                                                    text:
                                                        'Items posted succesfully!',
                                                    fontSize: 18,
                                                    color: Colors.black),
                                              ),
                                            );
                                            setState(() {
                                              count = 1;
                                            });
                                          }),
                                          child: TextRegular(
                                              text: 'Post Item',
                                              fontSize: 18,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                              );
                            })
                      ],
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
