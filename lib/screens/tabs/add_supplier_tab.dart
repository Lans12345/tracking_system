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
    return Scaffold(
      body: Container(
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
                                  text: 'Supplier Name:',
                                  fontSize: 12,
                                  color: Colors.black),
                              title: SizedBox(
                                  height: 40,
                                  width: 300,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                        fillColor: Colors.grey[300],
                                        filled: true,
                                        border: InputBorder.none),
                                  )),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
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
                              text: 'Details:                   ',
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
          ],
        ),
      ),
    );
  }
}
