import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/custom_components/custom_components_util.dart';

class PlanosRecord extends FirestoreRecord {
  PlanosRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  List<String>? _nome;
  List<String> get nome => _nome ?? const [];
  bool hasNome() => _nome != null;

  void _initializeFields() {
    _nome = getDataList(snapshotData['nome']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Planos');

  static Stream<PlanosRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PlanosRecord.fromSnapshot(s));

  static Future<PlanosRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PlanosRecord.fromSnapshot(s));

  static PlanosRecord fromSnapshot(DocumentSnapshot snapshot) => PlanosRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PlanosRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PlanosRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PlanosRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PlanosRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPlanosRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class PlanosRecordDocumentEquality implements Equality<PlanosRecord> {
  const PlanosRecordDocumentEquality();

  @override
  bool equals(PlanosRecord? e1, PlanosRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.nome, e2?.nome);
  }

  @override
  int hash(PlanosRecord? e) => const ListEquality().hash([e?.nome]);

  @override
  bool isValidKey(Object? o) => o is PlanosRecord;
}
