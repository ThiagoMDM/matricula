import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/custom_components/custom_components_util.dart';

class ClientesRecord extends FirestoreRecord {
  ClientesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nome" field.
  String? _nome;
  String get nome => _nome ?? '';
  bool hasNome() => _nome != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "pgto" field.
  bool? _pgto;
  bool get pgto => _pgto ?? false;
  bool hasPgto() => _pgto != null;

  // "cto_status" field.
  bool? _ctoStatus;
  bool get ctoStatus => _ctoStatus ?? false;
  bool hasCtoStatus() => _ctoStatus != null;

  // "idade" field.
  double? _idade;
  double get idade => _idade ?? 0.0;
  bool hasIdade() => _idade != null;

  // "telefone" field.
  String? _telefone;
  String get telefone => _telefone ?? '';
  bool hasTelefone() => _telefone != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "dataNasc" field.
  String? _dataNasc;
  String get dataNasc => _dataNasc ?? '';
  bool hasDataNasc() => _dataNasc != null;

  // "cidade" field.
  String? _cidade;
  String get cidade => _cidade ?? '';
  bool hasCidade() => _cidade != null;

  // "cpf" field.
  String? _cpf;
  String get cpf => _cpf ?? '';
  bool hasCpf() => _cpf != null;

  // "rg" field.
  String? _rg;
  String get rg => _rg ?? '';
  bool hasRg() => _rg != null;

  // "endereco" field.
  String? _endereco;
  String get endereco => _endereco ?? '';
  bool hasEndereco() => _endereco != null;

  // "cep" field.
  String? _cep;
  String get cep => _cep ?? '';
  bool hasCep() => _cep != null;

  // "uf" field.
  String? _uf;
  String get uf => _uf ?? '';
  bool hasUf() => _uf != null;

  // "nomeResp" field.
  String? _nomeResp;
  String get nomeResp => _nomeResp ?? '';
  bool hasNomeResp() => _nomeResp != null;

  // "numero" field.
  String? _numero;
  String get numero => _numero ?? '';
  bool hasNumero() => _numero != null;

  // "resultadoCEP" field.
  bool? _resultadoCEP;
  bool get resultadoCEP => _resultadoCEP ?? false;
  bool hasResultadoCEP() => _resultadoCEP != null;

  // "planoOption" field.
  String? _planoOption;
  String get planoOption => _planoOption ?? '';
  bool hasPlanoOption() => _planoOption != null;

  void _initializeFields() {
    _nome = snapshotData['nome'] as String?;
    _email = snapshotData['email'] as String?;
    _pgto = snapshotData['pgto'] as bool?;
    _ctoStatus = snapshotData['cto_status'] as bool?;
    _idade = castToType<double>(snapshotData['idade']);
    _telefone = snapshotData['telefone'] as String?;
    _genero = snapshotData['genero'] as String?;
    _dataNasc = snapshotData['dataNasc'] as String?;
    _cidade = snapshotData['cidade'] as String?;
    _cpf = snapshotData['cpf'] as String?;
    _rg = snapshotData['rg'] as String?;
    _endereco = snapshotData['endereco'] as String?;
    _cep = snapshotData['cep'] as String?;
    _uf = snapshotData['uf'] as String?;
    _nomeResp = snapshotData['nomeResp'] as String?;
    _numero = snapshotData['numero'] as String?;
    _resultadoCEP = snapshotData['resultadoCEP'] as bool?;
    _planoOption = snapshotData['planoOption'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Clientes');

  static Stream<ClientesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientesRecord.fromSnapshot(s));

  static Future<ClientesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientesRecord.fromSnapshot(s));

  static ClientesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientesRecordData({
  String? nome,
  String? email,
  bool? pgto,
  bool? ctoStatus,
  double? idade,
  String? telefone,
  String? genero,
  String? dataNasc,
  String? cidade,
  String? cpf,
  String? rg,
  String? endereco,
  String? cep,
  String? uf,
  String? nomeResp,
  String? numero,
  bool? resultadoCEP,
  String? planoOption,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nome': nome,
      'email': email,
      'pgto': pgto,
      'cto_status': ctoStatus,
      'idade': idade,
      'telefone': telefone,
      'genero': genero,
      'dataNasc': dataNasc,
      'cidade': cidade,
      'cpf': cpf,
      'rg': rg,
      'endereco': endereco,
      'cep': cep,
      'uf': uf,
      'nomeResp': nomeResp,
      'numero': numero,
      'resultadoCEP': resultadoCEP,
      'planoOption': planoOption,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientesRecordDocumentEquality implements Equality<ClientesRecord> {
  const ClientesRecordDocumentEquality();

  @override
  bool equals(ClientesRecord? e1, ClientesRecord? e2) {
    return e1?.nome == e2?.nome &&
        e1?.email == e2?.email &&
        e1?.pgto == e2?.pgto &&
        e1?.ctoStatus == e2?.ctoStatus &&
        e1?.idade == e2?.idade &&
        e1?.telefone == e2?.telefone &&
        e1?.genero == e2?.genero &&
        e1?.dataNasc == e2?.dataNasc &&
        e1?.cidade == e2?.cidade &&
        e1?.cpf == e2?.cpf &&
        e1?.rg == e2?.rg &&
        e1?.endereco == e2?.endereco &&
        e1?.cep == e2?.cep &&
        e1?.uf == e2?.uf &&
        e1?.nomeResp == e2?.nomeResp &&
        e1?.numero == e2?.numero &&
        e1?.resultadoCEP == e2?.resultadoCEP &&
        e1?.planoOption == e2?.planoOption;
  }

  @override
  int hash(ClientesRecord? e) => const ListEquality().hash([
        e?.nome,
        e?.email,
        e?.pgto,
        e?.ctoStatus,
        e?.idade,
        e?.telefone,
        e?.genero,
        e?.dataNasc,
        e?.cidade,
        e?.cpf,
        e?.rg,
        e?.endereco,
        e?.cep,
        e?.uf,
        e?.nomeResp,
        e?.numero,
        e?.resultadoCEP,
        e?.planoOption
      ]);

  @override
  bool isValidKey(Object? o) => o is ClientesRecord;
}
