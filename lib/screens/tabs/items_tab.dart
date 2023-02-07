import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';

class ItemsTab extends StatelessWidget {
  const ItemsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              SizedBox(
                  width: 220,
                  height: 40,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Search item',
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
          const Divider(),
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
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
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
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBold(
                                    text: 'Supplier X',
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
                                        text: '21',
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
                                        text: 'Original',
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
                                        text: '25.00',
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
                                        text: '50.00',
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
                                    text: 'John Doe',
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
                                    text: 'Lorem Ipsum',
                                    fontSize: 12,
                                    color: Colors.black),
                                const SizedBox(
                                  height: 20,
                                ),
                                Center(
                                  child: MaterialButton(
                                      minWidth: 200,
                                      color: Colors.blue[800],
                                      onPressed: (() {}),
                                      child: TextRegular(
                                          text: 'Add to canvass',
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
          ),
        ],
      ),
    );
  }
}
