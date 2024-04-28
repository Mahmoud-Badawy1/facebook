import '../database.dart';

class FriendshipTable extends SupabaseTable<FriendshipRow> {
  @override
  String get tableName => 'friendship';

  @override
  FriendshipRow createRow(Map<String, dynamic> data) => FriendshipRow(data);
}

class FriendshipRow extends SupabaseDataRow {
  FriendshipRow(super.data);

  @override
  SupabaseTable get table => FriendshipTable();

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  bool? get profileRequest => getField<bool>('profile_request');
  set profileRequest(bool? value) => setField<bool>('profile_request', value);

  bool get profileAccept => getField<bool>('Profile Accept')!;
  set profileAccept(bool value) => setField<bool>('Profile Accept', value);
}
