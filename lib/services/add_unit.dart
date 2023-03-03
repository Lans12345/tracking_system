import 'package:cloud_firestore/cloud_firestore.dart';

Future addUnit(supplierId, unit, unitName, ownName, plateNumber, total,
    supplierName) async {
  final docUser = FirebaseFirestore.instance.collection('Unit').doc();

  final json = {
    'supplierId': supplierId,
    'id': docUser.id,
    'unit': unit,
    'unitName': unitName,
    'ownName': ownName,
    'plateNumber': plateNumber,
    'total': total,
    'supplierName': supplierName,
    'status': 'Stored',
    'dateTime': DateTime.now(),
    'wayBillNo': '',
    'balance': '',
    'courier': '',
    'paymentMode': '',
  };

  await docUser.set(json);
}
