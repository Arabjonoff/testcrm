import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
class DataBaseCard{



  final String _columnTable = 'cart_table';
  final String _columnId = 'id';
  String columnName = 'name';
  String columnPrice = 'price';
  String columnPriceS = 'priceS';
  String columnCardCount = 'count';
  String columnYear = 'year';
  String columnMonth = 'month';
  String columnIdTip = 'idTip';
  String columnIdSkl2 = 'idSkl2';

  static final DataBaseCard _baseCard = DataBaseCard.internal();

  factory DataBaseCard() => _baseCard;

  static Database? _db;

  DataBaseCard.internal();


  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();

    return _db!;
  }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'naqsh_soft.db');
    var db = await openDatabase(
      path,
      version: 1,
    );
    return db;
  }
}