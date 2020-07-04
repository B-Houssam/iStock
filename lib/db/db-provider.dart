import 'package:iStock/models/produit.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseProvider {
  static const String TABLE_PRODUIT = 'produit';

  static const String COLUMN_ID = 'id';
  static const String COLUMN_REF = 'ref';
  static const String COLUMN_CONS = 'consomation';
  static const String COLUMN_QTE = 'qte';
  static const String COLUMN_COUT = 'cout';
  //static const String COLUMN_SEUIL = 'seuil';

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
      version: 2,
      onCreate: (Database database, int version) async {
        print("Creating produit database");
        await database.execute("CREATE TABLE $TABLE_PRODUIT ("
            "$COLUMN_ID INTEGER PRIMARY KEY,"
            "$COLUMN_REF TEXT,"
            "$COLUMN_CONS INTEGER,"
            "$COLUMN_QTE INTEGER,"
            "$COLUMN_COUT INTEGER"
            //"$COLUMN_SEUIL INTEGER"
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

  Future<Produit> insert(Produit p) async {
    final db = await database;
    p.id = await db.insert(TABLE_PRODUIT, p.toMap());
    return p;
  }
}
