import 'dart:async';
import 'package:path/path.dart';
import 'package:products/models/productModel.dart';
import 'package:products/services/productServices.dart';
import 'package:products/services/userServices.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteProductsDB {

  static final FavoriteProductsDB instance = FavoriteProductsDB._init();

  static Database? _database;

  FavoriteProductsDB._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'products.db');
    return await openDatabase(
        path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
            CREATE TABLE IF NOT EXISTS products (
              id_product TEXT PRIMARY KEY,
              name TEXT NOT NULL,
              description TEXT NOT NULL,
              id_seller TEXT NOT NULL,
              seller_name TEXT NOT NULL,
              calification REAl NOT NULL
            )
          ''');
        }
    );
  }

  Future sync()async{
    final data = await ProductApi().getFavorites();
    for(ProductModel product in data.products){
      await instance.insert(product);
    }
  }

  Future uploadSync()async{
    final data = await instance.getAll();
    for(ProductModel product in data.products){
      print(product.idProduct);
      await ProductApi().addFavorite(idProduct: product.idProduct);
    }
  }

  Future insert(ProductModel product) async {
    final db = await instance.database;
    return await db
    .rawQuery('INSERT OR REPLACE INTO products(id_product, name, description, id_seller, seller_name, calification) VALUES (?,?,?,?,?,?)', 
    [product.idProduct, product.name, product.description, product.idSeller, product.sellerName, product.calification]);
  }

  Future delete(String id) async {
    final db = await instance.database;
    return await db.rawQuery('DELETE FROM products WHERE id_product = ?', [id]);
  }

  Future deleteAll() async {
    final db = await instance.database;
    return await db.rawQuery('DELETE FROM products');
  }

  Future<ProductsModel> getAll() async {
    final db = await instance.database;
    List<Map> result = await db.rawQuery('SELECT * FROM products');
    return ProductsModel.fromJson(result);
  }

  Future<ProductsModel> getById(String id) async {
    final db = await instance.database;
    List<Map> result = await db.rawQuery('SELECT * FROM products WHERE id_product = ?', [id]);
    return ProductsModel.fromJson(result);
  }
}