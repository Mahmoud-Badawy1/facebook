import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class FriendsRecord extends FirestoreRecord {
  FriendsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "friendName" field.
  String? _friendName;
  String get friendName => _friendName ?? '';
  bool hasFriendName() => _friendName != null;

  // "FriendProfilePic" field.
  String? _friendProfilePic;
  String get friendProfilePic => _friendProfilePic ?? '';
  bool hasFriendProfilePic() => _friendProfilePic != null;

  // "friend" field.
  DocumentReference? _friend;
  DocumentReference? get friend => _friend;
  bool hasFriend() => _friend != null;

  void _initializeFields() {
    _friendName = snapshotData['friendName'] as String?;
    _friendProfilePic = snapshotData['FriendProfilePic'] as String?;
    _friend = snapshotData['friend'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Friends');

  static Stream<FriendsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FriendsRecord.fromSnapshot(s));

  static Future<FriendsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FriendsRecord.fromSnapshot(s));

  static FriendsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FriendsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FriendsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FriendsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FriendsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FriendsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFriendsRecordData({
  String? friendName,
  String? friendProfilePic,
  DocumentReference? friend,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'friendName': friendName,
      'FriendProfilePic': friendProfilePic,
      'friend': friend,
    }.withoutNulls,
  );

  return firestoreData;
}

class FriendsRecordDocumentEquality implements Equality<FriendsRecord> {
  const FriendsRecordDocumentEquality();

  @override
  bool equals(FriendsRecord? e1, FriendsRecord? e2) {
    return e1?.friendName == e2?.friendName &&
        e1?.friendProfilePic == e2?.friendProfilePic &&
        e1?.friend == e2?.friend;
  }

  @override
  int hash(FriendsRecord? e) => const ListEquality()
      .hash([e?.friendName, e?.friendProfilePic, e?.friend]);

  @override
  bool isValidKey(Object? o) => o is FriendsRecord;
}
