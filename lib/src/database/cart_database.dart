import 'package:sqflite/sqflite.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:testcrm/src/model/product_model/product_detail_model/product_detail.dart';
class DataBaseCard {
  final String _columnTable = 'cartTable';
  final String _columnId = 'ID';
  String columnName = 'NAME';
  String columnPrice = 'NARHI';
  String columnPriceS = 'OSONI';
  String columnCardCount = 'count';
  String columnMoth = 'OY';
  String columnYear = 'YIL';
  String columnPriceSs = 'SNARHI';
  String columnIdTip = 'ID_TIP';
  String columnIdSkl2 = 'ID_SKL2';

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
    String path = join(databasesPath, 'naqsh.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $_columnTable('
      '$_columnId INTEGER PRIMARY KEY,'
      '$columnName TEXT,'
      '$columnPrice REAL,'
      '$columnPriceS REAL,'
      '$columnPriceSs REAL,'
      '$columnMoth TEXT,'
      '$columnYear TEXT,'
      '$columnIdSkl2 INTEGER,'
      '$columnIdTip INTEGER,'
      '$columnCardCount INTEGER)',
    );
  }

  Future<int> saveProductCart(DetailResult item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      _columnTable,
      item.toJson(),
    );
    print(result);
    return result;
  }

  Future<int> updateProduct(DetailResult products) async {
    var dbClient = await db;
    return await dbClient.update(
      _columnTable,
      where: "id = ?",
      products.toJson(),
      whereArgs: [products.id],
    );
  }

  Future<int> deleteProductCard(int id) async {
    var dbClient = await db;
    int result = await dbClient.delete(
      _columnTable,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<void> clear() async {
    var dbClient = await db;
    await dbClient.rawQuery('DELETE FROM $_columnTable');
  }

  Future<List<DetailResult>> getProductCart() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $_columnTable');
    List<DetailResult> data = <DetailResult>[];
    for (int i = 0; i < list.length; i++) {
      DetailResult p = DetailResult(
        soni: list[i]['OY'],
        name: list[i]['NAME'],
        idSkl2: list[i]['ID_SKL2'],
        narhi: list[i]['NARHI'],
        oy: list[i]['OY'],
        idTip: list[i]['ID_TIP'],
        yil: list[i]['YIL'],
        count: list[i]['count'],
        id: list[i]['ID'],
        osoni: list[i]['OSONI'],
        snarhi: list[i]['SNARHI'],
      );
      data.add(p);
    }
    return data;
  }
}
