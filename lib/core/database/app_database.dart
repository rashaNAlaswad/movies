import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'app_database.g.dart';

class Movies extends Table {
  IntColumn get id => integer()();
  TextColumn get title => text()();
  TextColumn get posterPath => text().nullable()();
  RealColumn get voteAverage => real()();
  TextColumn get releaseDate => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [Movies])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'movies.db'));
    return NativeDatabase(file);
  });
}
