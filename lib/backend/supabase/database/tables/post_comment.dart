import '../database.dart';

class PostCommentTable extends SupabaseTable<PostCommentRow> {
  @override
  String get tableName => 'post_comment';

  @override
  PostCommentRow createRow(Map<String, dynamic> data) => PostCommentRow(data);
}

class PostCommentRow extends SupabaseDataRow {
  PostCommentRow(super.data);

  @override
  SupabaseTable get table => PostCommentTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get postId => getField<int>('post_id');
  set postId(int? value) => setField<int>('post_id', value);

  int? get profileId => getField<int>('profile_id');
  set profileId(int? value) => setField<int>('profile_id', value);

  String? get commentText => getField<String>('comment_text');
  set commentText(String? value) => setField<String>('comment_text', value);
}
