import 'package:ecommerce/constant.dart';
import 'package:ecommerce/model/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

import '../../../model/cart_product_model.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

      _database = await initDb();
      return _database;

  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'cartProduct.db');
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      CREATE TABLE $tableCartProduct(
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnProductId TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL
      )
      ''');
    });
  }

  getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!
        .query(tableCartProduct); //now i will get all the data in this table
    List<CartProductModel> list=maps.isNotEmpty ?
        maps.map((product) => CartProductModel.fromJson(product)).toList()
        :[];

    return list;
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient?.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  updateProduct(CartProductModel model)async{
    var dbClient = await database;
    return await dbClient!.update(tableCartProduct, model.toJson(),
    where : '$columnProductId = ?' ,whereArgs:[model.productId]);
  }
}
