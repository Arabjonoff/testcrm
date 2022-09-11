import 'package:sqflite/sqflite.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:testcrm/src/model/send_order/send_order_model.dart';

class DataBaseCard {
  final String _columnTable = 'cart_table';
  final String _columnId = 'id';
  String columnName = 'name';
  String columnPrice = 'price';
  String columnPriceS = 'priceS';
  String columnCardCount = 'count';

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
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute(
      'CREATE TABLE $_columnTable('
      '$_columnId INTEGER PRIMARY KEY, '
      '$columnName TEXT, '
      '$columnPrice REAL, '
      '$columnPriceS REAL, '
      '$columnCardCount REAL)',
    );
  }

  Future<int> saveProductCart(OrderResult item) async {
    var dbClient = await db;
    var result = await dbClient.insert(
      _columnTable,
      item.toJson(),
    );
    return result;
  }

  Future<int> updateProduct(OrderResult products) async {
    var dbClient = await db;
    return await dbClient.update(
      _columnTable,
      products.toJson(),
      where: "id = ?",
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

  Future<List<Tzakaz1>> getProductCart() async {
    var dbClient = await db;
    List<Map> list = await dbClient.rawQuery('SELECT * FROM $_columnTable');
    List<Tzakaz1> data = <Tzakaz1>[];
    for (int i = 0; i < list.length; i++) {
      Tzakaz1 p = Tzakaz1(
        soni: list[i]['soni'],
        name: list[i]['name'],
        snarh: list[i]['snarh'],
        sm: list[i]['sm'],
        idSkl2: list[i]['idSkl2'],
        narhi: list[i]['narhi'],
      );
      data.add(p);
    }
    return data;
  }
}
