import 'package:iStock/models/produit.dart';
import 'package:iStock/models/produitf.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String TABLE_PRODUIT = 'produit';
  static const String TABLE_FINAL = 'final';

  static const String COLUMN_ID = 'id';
  static const String COLUMN_REF = 'ref';
  static const String COLUMN_CONS = 'consomation';
  static const String COLUMN_QTE = 'qte';
  static const String COLUMN_COUT = 'cout';

  static const String COLUMN_IDD = 'idd';
  static const String COLUMN_REFF = 'ref';
  static const String COLUMN_QTEE = 'qte';
  static const String COLUMN_CAD = 'cad';
  static const String COLUMN_STSEC = 'stsec';
  static const String COLUMN_STAL = 'stal';
  static const String COLUMN_PTC = 'ptc';
  static const String COLUMN_STMIN = 'stmin';
  static const String Column_D = "d";
  static const String Column_QQ = "qq";

  DatabaseProvider._();
  static final DatabaseProvider db = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    print('db getter called');

    if (_database != null) {
      return _database;
    }

    _database = await createDatabase();
    return _database;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, 'ProduitDB.db'),
      version: 3,
      onCreate: (Database database, int version) async {
        print("Creating produit database");
        await database.execute("CREATE TABLE $TABLE_PRODUIT ("
            "$COLUMN_ID INTEGER PRIMARY KEY,"
            "$COLUMN_REF TEXT,"
            "$COLUMN_CONS INTEGER,"
            "$COLUMN_QTE INTEGER,"
            "$COLUMN_COUT INTEGER"
            ")");
        await database.execute("CREATE TABLE $TABLE_FINAL ("
            "$COLUMN_IDD INTEGER PRIMARY KEY,"
            "$COLUMN_REFF TEXT,"
            "$COLUMN_QTEE DOUBLE,"
            "$Column_QQ INTEGER,"
            "$Column_D INTEGER,"
            "$COLUMN_CAD DOUBLE,"
            "$COLUMN_STSEC INTEGER,"
            "$COLUMN_STAL INTEGER,"
            "$COLUMN_PTC INTEGER,"
            "$COLUMN_STMIN INTEGER"
            ")");
      },
    );
  }

  Future<List<Produit>> getProduits() async {
    final db = await database;
    var produits = await db.query(TABLE_PRODUIT, columns: [
      COLUMN_ID,
      COLUMN_REF,
      COLUMN_CONS,
      COLUMN_QTE,
      COLUMN_COUT //,
      //COLUMN_SEUIL
    ]);

    List<Produit> productList = List<Produit>();

    produits.forEach((current) {
      Produit p = Produit.fromMap(current);
      productList.add(p);
    });

    return productList;
  }

  Future<List<Produitf>> getProduitsF() async {
    final db = await database;
    var produits = await db.query(TABLE_FINAL, columns: [
      COLUMN_IDD,
      COLUMN_REFF,
      Column_D,
      Column_QQ,
      COLUMN_QTEE,
      COLUMN_CAD,
      COLUMN_STSEC,
      COLUMN_STAL,
      COLUMN_PTC,
      COLUMN_STMIN
    ]);

    List<Produitf> productList = List<Produitf>();

    produits.forEach((current) {
      Produitf p = Produitf.fromMap(current);
      productList.add(p);
    });

    return productList;
  }

  Future<List<Produit>> getProduitsOrdre() async {
    final db = await database;
    var produits = await db.query(TABLE_PRODUIT, orderBy: "$COLUMN_COUT DESC");

    List<Produit> productList = List<Produit>();

    produits.forEach((current) {
      Produit p = Produit.fromMap(current);
      productList.add(p);
    });

    return productList;
  }

  Future<List<Produit>> getProduitsOrdreCons() async {
    final db = await database;
    var produits = await db.query(TABLE_PRODUIT, orderBy: "$COLUMN_CONS DESC");

    List<Produit> productList = List<Produit>();

    produits.forEach((current) {
      Produit p = Produit.fromMap(current);
      productList.add(p);
    });

    return productList;
  }

  Future<List<Produit>> getProduitsOrdreQte() async {
    final db = await database;
    var produits = await db.query(TABLE_PRODUIT, orderBy: "$COLUMN_QTE ASC");

    List<Produit> productList = List<Produit>();

    produits.forEach((current) {
      Produit p = Produit.fromMap(current);
      productList.add(p);
    });

    return productList;
  }

  Future<Produit> insert(Produit p) async {
    final db = await database;
    p.id = await db.insert(TABLE_PRODUIT, p.toMap());
    return p;
  }

  Future<Produitf> insertf(Produitf p) async {
    final db = await database;
    p.idd = await db.insert(TABLE_FINAL, p.toMap());
    return p;
  }

  Future deleteAllRows() async {
    final db = await database;
    db.delete(TABLE_FINAL);
  }
}
