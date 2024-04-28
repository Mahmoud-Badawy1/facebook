import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class StoryRecord extends FirestoreRecord {
  StoryRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "storyImage" field.
  String? _storyImage;
  String get storyImage => _storyImage ?? '';
  bool hasStoryImage() => _storyImage != null;

  void _initializeFields() {
    _description = snapshotData['description'] as String?;
    _author = snapshotData['author'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _likes = getDataList(snapshotData['likes']);
    _storyImage = snapshotData['storyImage'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('story');

  static Stream<StoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StoryRecord.fromSnapshot(s));

  static Future<StoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StoryRecord.fromSnapshot(s));

  static StoryRecord fromSnapshot(DocumentSnapshot snapshot) => StoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StoryRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StoryRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StoryRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStoryRecordData({
  String? description,
  DocumentReference? author,
  DateTime? createdTime,
  String? storyImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'description': description,
      'author': author,
      'created_time': createdTime,
      'storyImage': storyImage,
    }.withoutNulls,
  );

  return firestoreData;
}

class StoryRecordDocumentEquality implements Equality<StoryRecord> {
  const StoryRecordDocumentEquality();

  @override
  bool equals(StoryRecord? e1, StoryRecord? e2) {
    const listEquality = ListEquality();
    return e1?.description == e2?.description &&
        e1?.author == e2?.author &&
        e1?.createdTime == e2?.createdTime &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.storyImage == e2?.storyImage;
  }

  @override
  int hash(StoryRecord? e) => const ListEquality().hash(
      [e?.description, e?.author, e?.createdTime, e?.likes, e?.storyImage]);

  @override
  bool isValidKey(Object? o) => o is StoryRecord;
}
