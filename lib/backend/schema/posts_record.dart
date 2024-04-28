import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PostsRecord extends FirestoreRecord {
  PostsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "media" field.
  DocumentReference? _media;
  DocumentReference? get media => _media;
  bool hasMedia() => _media != null;

  // "time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "post_user" field.
  DocumentReference? _postUser;
  DocumentReference? get postUser => _postUser;
  bool hasPostUser() => _postUser != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "num_comments" field.
  int? _numComments;
  int get numComments => _numComments ?? 0;
  bool hasNumComments() => _numComments != null;

  // "num_likes" field.
  int? _numLikes;
  int get numLikes => _numLikes ?? 0;
  bool hasNumLikes() => _numLikes != null;

  // "post_user_image" field.
  String? _postUserImage;
  String get postUserImage => _postUserImage ?? '';
  bool hasPostUserImage() => _postUserImage != null;

  // "post_user_name" field.
  String? _postUserName;
  String get postUserName => _postUserName ?? '';
  bool hasPostUserName() => _postUserName != null;

  // "MediaUrls" field.
  List<String>? _mediaUrls;
  List<String> get mediaUrls => _mediaUrls ?? const [];
  bool hasMediaUrls() => _mediaUrls != null;

  // "postBookmarks" field.
  List<DocumentReference>? _postBookmarks;
  List<DocumentReference> get postBookmarks => _postBookmarks ?? const [];
  bool hasPostBookmarks() => _postBookmarks != null;

  void _initializeFields() {
    _body = snapshotData['body'] as String?;
    _media = snapshotData['media'] as DocumentReference?;
    _time = snapshotData['time'] as DateTime?;
    _postUser = snapshotData['post_user'] as DocumentReference?;
    _likes = getDataList(snapshotData['likes']);
    _numComments = castToType<int>(snapshotData['num_comments']);
    _numLikes = castToType<int>(snapshotData['num_likes']);
    _postUserImage = snapshotData['post_user_image'] as String?;
    _postUserName = snapshotData['post_user_name'] as String?;
    _mediaUrls = getDataList(snapshotData['MediaUrls']);
    _postBookmarks = getDataList(snapshotData['postBookmarks']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PostsRecord.fromSnapshot(s));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PostsRecord.fromSnapshot(s));

  static PostsRecord fromSnapshot(DocumentSnapshot snapshot) => PostsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PostsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PostsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PostsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PostsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPostsRecordData({
  String? body,
  DocumentReference? media,
  DateTime? time,
  DocumentReference? postUser,
  int? numComments,
  int? numLikes,
  String? postUserImage,
  String? postUserName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'body': body,
      'media': media,
      'time': time,
      'post_user': postUser,
      'num_comments': numComments,
      'num_likes': numLikes,
      'post_user_image': postUserImage,
      'post_user_name': postUserName,
    }.withoutNulls,
  );

  return firestoreData;
}

class PostsRecordDocumentEquality implements Equality<PostsRecord> {
  const PostsRecordDocumentEquality();

  @override
  bool equals(PostsRecord? e1, PostsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.body == e2?.body &&
        e1?.media == e2?.media &&
        e1?.time == e2?.time &&
        e1?.postUser == e2?.postUser &&
        listEquality.equals(e1?.likes, e2?.likes) &&
        e1?.numComments == e2?.numComments &&
        e1?.numLikes == e2?.numLikes &&
        e1?.postUserImage == e2?.postUserImage &&
        e1?.postUserName == e2?.postUserName &&
        listEquality.equals(e1?.mediaUrls, e2?.mediaUrls) &&
        listEquality.equals(e1?.postBookmarks, e2?.postBookmarks);
  }

  @override
  int hash(PostsRecord? e) => const ListEquality().hash([
        e?.body,
        e?.media,
        e?.time,
        e?.postUser,
        e?.likes,
        e?.numComments,
        e?.numLikes,
        e?.postUserImage,
        e?.postUserName,
        e?.mediaUrls,
        e?.postBookmarks
      ]);

  @override
  bool isValidKey(Object? o) => o is PostsRecord;
}
