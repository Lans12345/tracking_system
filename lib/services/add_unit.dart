import 'package:cloud_firestore/cloud_firestore.dart';

Future addUnit(supplierId, unit, unitName, ownName, plateNumber, total) async {
  final docUser = FirebaseFirestore.instance.collection('Unit').doc();

  final json = {
    'supplierId': supplierId,
    'id': docUser.id,
    'unit': unit,
    'unitName': unitName,
    'ownName': ownName,
    'plateNumber': plateNumber,
    'total': total
  };

  await docUser.set(json);
}
