import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class MediaRecord extends FirestoreRecord {
  MediaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "videoUrl" field.
  String? _videoUrl;
  String get videoUrl => _videoUrl ?? '';
  bool hasVideoUrl() => _videoUrl != null;

  // "imageUrl" field.
  List<String>? _imageUrl;
  List<String> get imageUrl => _imageUrl ?? const [];
  bool hasImageUrl() => _imageUrl != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _videoUrl = snapshotData['videoUrl'] as String?;
    _imageUrl = getDataList(snapshotData['imageUrl']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('media')
          : FirebaseFirestore.instance.collectionGroup('media');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('media').doc(id);

  static Stream<MediaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MediaRecord.fromSnapshot(s));

  static Future<MediaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MediaRecord.fromSnapshot(s));

  static MediaRecord fromSnapshot(DocumentSnapshot snapshot) => MediaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MediaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MediaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MediaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MediaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMediaRecordData({
  String? videoUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'videoUrl': videoUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class MediaRecordDocumentEquality implements Equality<MediaRecord> {
  const MediaRecordDocumentEquality();

  @override
  bool equals(MediaRecord? e1, MediaRecord? e2) {
    const listEquality = ListEquality();
    return e1?.videoUrl == e2?.videoUrl &&
        listEquality.equals(e1?.imageUrl, e2?.imageUrl);
  }

  @override
  int hash(MediaRecord? e) =>
      const ListEquality().hash([e?.videoUrl, e?.imageUrl]);

  @override
  bool isValidKey(Object? o) => o is MediaRecord;
}
