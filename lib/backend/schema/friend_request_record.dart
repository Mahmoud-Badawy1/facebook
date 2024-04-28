import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FriendRequestRecord extends FirestoreRecord {
  FriendRequestRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "requester" field.
  DocumentReference? _requester;
  DocumentReference? get requester => _requester;
  bool hasRequester() => _requester != null;

  // "reqesterName" field.
  String? _reqesterName;
  String get reqesterName => _reqesterName ?? '';
  bool hasReqesterName() => _reqesterName != null;

  // "requesterpic" field.
  String? _requesterpic;
  String get requesterpic => _requesterpic ?? '';
  bool hasRequesterpic() => _requesterpic != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "requests" field.
  List<DocumentReference>? _requests;
  List<DocumentReference> get requests => _requests ?? const [];
  bool hasRequests() => _requests != null;

  void _initializeFields() {
    _requester = snapshotData['requester'] as DocumentReference?;
    _reqesterName = snapshotData['reqesterName'] as String?;
    _requesterpic = snapshotData['requesterpic'] as String?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _requests = getDataList(snapshotData['requests']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('friendRequest');

  static Stream<FriendRequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendRequestRecord.fromSnapshot(s));

  static Future<FriendRequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendRequestRecord.fromSnapshot(s));

  static FriendRequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendRequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendRequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendRequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendRequestRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendRequestRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendRequestRecordData({
  DocumentReference? requester,
  String? reqesterName,
  String? requesterpic,
  DocumentReference? receiver,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'requester': requester,
      'reqesterName': reqesterName,
      'requesterpic': requesterpic,
      'receiver': receiver,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendRequestRecordDocumentEquality
    implements Equality<FriendRequestRecord> {
  const FriendRequestRecordDocumentEquality();

  @override
  bool equals(FriendRequestRecord? e1, FriendRequestRecord? e2) {
    const listEquality = ListEquality();
    return e1?.requester == e2?.requester &&
        e1?.reqesterName == e2?.reqesterName &&
        e1?.requesterpic == e2?.requesterpic &&
        e1?.receiver == e2?.receiver &&
        listEquality.equals(e1?.requests, e2?.requests);
  }

  @override
  int hash(FriendRequestRecord? e) => const ListEquality().hash([
        e?.requester,
        e?.reqesterName,
        e?.requesterpic,
        e?.receiver,
        e?.requests
      ]);

  @override
  bool isValidKey(Object? o) => o is FriendRequestRecord;
}
