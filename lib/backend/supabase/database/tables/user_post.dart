import '../database.dart';

class UserPostTable extends SupabaseTable<UserPostRow> {
  @override
  String get tableName => 'user_post';

  @override
  UserPostRow createRow(Map<String, dynamic> data) => UserPostRow(data);
}

class UserPostRow extends SupabaseDataRow {
  UserPostRow(super.data);

  @override
  SupabaseTable get table => UserPostTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int? get profileId => getField<int>('profile_id');
  set profileId(int? value) => setField<int>('profile_id', value);

  String? get writtenText => getField<String>('written_text');
  set writtenText(String? value) => setField<String>('written_text', value);

  String? get mediaLocation => getField<String>('media_location');
  set mediaLocation(String? value) => setField<String>('media_location', value);
}
