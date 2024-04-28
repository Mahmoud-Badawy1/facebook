import '../database.dart';

class UserProfileTable extends SupabaseTable<UserProfileRow> {
  @override
  String get tableName => 'user_profile';

  @override
  UserProfileRow createRow(Map<String, dynamic> data) => UserProfileRow(data);
}

class UserProfileRow extends SupabaseDataRow {
  UserProfileRow(super.data);

  @override
  SupabaseTable get table => UserProfileTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String? get emailAddress => getField<String>('email_address');
  set emailAddress(String? value) => setField<String>('email_address', value);

  String? get password => getField<String>('password');
  set password(String? value) => setField<String>('password', value);

  String? get username => getField<String>('username');
  set username(String? value) => setField<String>('username', value);

  String? get profilePic => getField<String>('profile_pic');
  set profilePic(String? value) => setField<String>('profile_pic', value);

  String? get profileCover => getField<String>('profile_cover');
  set profileCover(String? value) => setField<String>('profile_cover', value);

  String? get firstName => getField<String>('first_name');
  set firstName(String? value) => setField<String>('first_name', value);

  String? get secondName => getField<String>('second_name');
  set secondName(String? value) => setField<String>('second_name', value);

  double? get phone => getField<double>('phone');
  set phone(double? value) => setField<double>('phone', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);
}
