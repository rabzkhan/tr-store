import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:sqflite/sqflite.dart';
import 'package:trstore/app/database/db_consts.dart';
import 'package:trstore/app/modules/cart/controllers/cart_controller.dart';
import 'package:trstore/app/modules/cart/models/cart_model.dart';
import 'package:path/path.dart';
import 'package:trstore/helpers/helpers.dart';

class DatabaseRepository {
  CartController cartController = Get.find();
  static final DatabaseRepository instance = DatabaseRepository._init();
  DatabaseRepository._init();

  Database? _database;
  //check if db is created it yes then returns it, if no then creates one
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('cartItems.db');
    return _database!;
  }

  // initializing db
  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //create db with rules and fileds
  Future _createDB(Database db, int version) async {
    await db.execute('''
    create table ${DbConst.tableName} ( 
      ${DbConst.id} integer primary key autoincrement, 
      ${DbConst.productId} integer not null, 
      ${DbConst.title} text not null,
      ${DbConst.description} text not null,
      ${DbConst.imageUrl} text not null,
      ${DbConst.quantity} integer not null,
      ${DbConst.price} integer not null)
      '''); // <-- Add closing parenthesis here
  }

  Future<List<CartModel>> getCartList() async {
    final db = await instance.database;
    final result = await db.query(DbConst.tableName);
    return result.map((json) => CartModel.fromJson(json)).toList();
  }

  Future<void> insert({required CartModel cart}) async {
    try {
      final db = await database;
      db.insert(DbConst.tableName, cart.toMap());
      CustomSnackBar.showToast(message: "Product added to cart!");
    } catch (e) {
      Logger().d(e.toString());
    } finally {
      cartController.getCartItems();
    }
  }

  Future<void> delete(int productId) async {
    try {
      final db = await instance.database;
      await db.delete(
        DbConst.tableName,
        where: '${DbConst.productId} = $productId',
        whereArgs: [],
      );
      CustomSnackBar.showToast(message: "Product deleted from cart!");
    } catch (e) {
      Logger().d(e.toString());
    } finally {
      cartController.getCartItems();
    }
  }

  Future<void> update(CartModel cart) async {
    try {
      final db = await instance.database;
      db.update(
        DbConst.tableName,
        cart.toMap(),
        where: '${DbConst.id} = ?',
        whereArgs: [cart.productId],
      );
    } catch (e) {
      Logger().d(e.toString());
    } finally {
      cartController.getCartItems();
    }
  }
}
