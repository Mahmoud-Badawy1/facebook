import '../database.dart';

class StoriesTable extends SupabaseTable<StoriesRow> {
  @override
  String get tableName => 'stories';

  @override
  StoriesRow createRow(Map<String, dynamic> data) => StoriesRow(data);
}

class StoriesRow extends SupabaseDataRow {
  StoriesRow(super.data);

  @override
  SupabaseTable get table => StoriesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);
}
