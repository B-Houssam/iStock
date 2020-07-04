import 'package:iStock/db/db-provider.dart';

class Produit {
  int id;
  String ref;
  int qte;
  int consomation;
  int cout;
  //int seuil;

  Produit({
    this.id,
    this.ref,
    this.consomation,
    this.qte,
    this.cout,
    //this.seuil
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_REF: ref,
      DatabaseProvider.COLUMN_ID: id,
      DatabaseProvider.COLUMN_CONS: consomation,
      DatabaseProvider.COLUMN_COUT: cout,
      DatabaseProvider.COLUMN_QTE: qte,
      //DatabaseProvider.COLUMN_SEUIL: seuil,
    };
    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }
    return map;
  }

  Produit.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    ref = map[DatabaseProvider.COLUMN_REF];
    qte = map[DatabaseProvider.COLUMN_QTE];
    //seuil = map[DatabaseProvider.COLUMN_SEUIL];
    cout = map[DatabaseProvider.COLUMN_COUT];
    consomation = map[DatabaseProvider.COLUMN_CONS];
  }
}
