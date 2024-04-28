import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostCommentsRecord extends FirestoreRecord {
  PostCommentsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "post" field.
  DocumentReference? _post;
  DocumentReference? get post => _post;
  bool hasPost() => _post != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "createdTime" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "comment_username" field.
  String? _commentUsername;
  String get commentUsername => _commentUsername ?? '';
  bool hasCommentUsername() => _commentUsername != null;

  // "commentUserImage" field.
  String? _commentUserImage;
  String get commentUserImage => _commentUserImage ?? '';
  bool hasCommentUserImage() => _commentUserImage != null;

  // "commentLikes" field.
  List<DocumentReference>? _commentLikes;
  List<DocumentReference> get commentLikes => _commentLikes ?? const [];
  bool hasCommentLikes() => _commentLikes != null;

  // "likes_num" field.
  int? _likesNum;
  int get likesNum => _likesNum ?? 0;
  bool hasLikesNum() => _likesNum != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _post = snapshotData['post'] as DocumentReference?;
    _user = snapshotData['user'] as DocumentReference?;
    _createdTime = snapshotData['createdTime'] as DateTime?;
    _commentUsername = snapshotData['comment_username'] as String?;
    _commentUserImage = snapshotData['commentUserImage'] as String?;
    _commentLikes = getDataList(snapshotData['commentLikes']);
    _likesNum = castToType<int>(snapshotData['likes_num']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('post_comments')
          : FirebaseFirestore.instance.collectionGroup('post_comments');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('post_comments').doc(id);

  static Stream<PostCommentsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostCommentsRecord.fromSnapshot(s));

  static Future<PostCommentsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostCommentsRecord.fromSnapshot(s));

  static PostCommentsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PostCommentsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostCommentsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostCommentsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostCommentsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostCommentsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostCommentsRecordData({
  String? text,
  DocumentReference? post,
  DocumentReference? user,
  DateTime? createdTime,
  String? commentUsername,
  String? commentUserImage,
  int? likesNum,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'post': post,
      'user': user,
      'createdTime': createdTime,
      'comment_username': commentUsername,
      'commentUserImage': commentUserImage,
      'likes_num': likesNum,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostCommentsRecordDocumentEquality
    implements Equality<PostCommentsRecord> {
  const PostCommentsRecordDocumentEquality();

  @override
  bool equals(PostCommentsRecord? e1, PostCommentsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.text == e2?.text &&
        e1?.post == e2?.post &&
        e1?.user == e2?.user &&
        e1?.createdTime == e2?.createdTime &&
        e1?.commentUsername == e2?.commentUsername &&
        e1?.commentUserImage == e2?.commentUserImage &&
        listEquality.equals(e1?.commentLikes, e2?.commentLikes) &&
        e1?.likesNum == e2?.likesNum;
  }

  @override
  int hash(PostCommentsRecord? e) => const ListEquality().hash([
        e?.text,
        e?.post,
        e?.user,
        e?.createdTime,
        e?.commentUsername,
        e?.commentUserImage,
        e?.commentLikes,
        e?.likesNum
      ]);

  @override
  bool isValidKey(Object? o) => o is PostCommentsRecord;
}
