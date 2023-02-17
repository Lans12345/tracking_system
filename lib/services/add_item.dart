import 'package:cloud_firestore/cloud_firestore.dart';

Future addItem(status, description, price, qty, kind, supplier, supplierId,
    unitName, paymentMode, courier, wayBillNo, balance, name, newPrice) async {
  final docUser = FirebaseFirestore.instance.collection('Items').doc();

  final json = {
    'status': status,
    'description': description,
    'price': price,
    'qty': qty,
    'kind': kind,
    'supplier': supplier,
    'supplierId': supplierId,
    'unitName': unitName,
    'paymentMode': paymentMode,
    'courier': courier,
    'wayBillNo': wayBillNo,
    'id': docUser.id,
    'dateTime': DateTime.now(),
    'balance': balance,
    'name': name,
    'newPrice': newPrice
  };

  await docUser.set(json);
}
