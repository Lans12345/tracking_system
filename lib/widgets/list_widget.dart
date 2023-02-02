import 'package:flutter/material.dart';
import 'package:tracking_system/widgets/text_widget.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4),
              itemBuilder: ((context, index) {
                return Card(
                  elevation: 3,
                  child: Container(
                    color: Colors.grey[300],
                    height: 300,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBold(
                              text: 'Supplier X',
                              fontSize: 18,
                              color: Colors.black),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Customer/Unit Name:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Item Description:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Quantity:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Kind:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Price:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Courier:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Total:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBold(
                                    text: 'Waybill No.:',
                                    fontSize: 12,
                                    color: Colors.black),
                                TextRegular(
                                    text: 'Sampel',
                                    fontSize: 12,
                                    color: Colors.black)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }));
        });
  }
}
