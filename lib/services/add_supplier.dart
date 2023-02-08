import 'package:cloud_firestore/cloud_firestore.dart';

Future addSupplier(
  name,
  details,
  bankType,
  bankAccount,
) async {
  final docUser = FirebaseFirestore.instance.collection('Supplier').doc();

  final json = {
    'name': name,
    'details': details,
    'bankType': bankType,
    'bankAccount': bankAccount,
    'id': docUser.id
  };

  await docUser.set(json);
}
