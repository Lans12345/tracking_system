import 'package:flutter/material.dart';
import 'package:tracking_system/utils/colors.dart';
import 'package:tracking_system/widgets/text_widget.dart';

class SupplierTab extends StatelessWidget {
  const SupplierTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
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
        ],
      ),
    );
  }
}
