import 'package:iStock/db/db-provider.dart';

class Produit {
  int id;
  String nom;
  int qte;
  String fournisseur;
  String description;
  int seuil;

  Produit(
      {this.id,
      this.nom,
      this.description,
      this.qte,
      this.fournisseur,
      this.seuil});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_NOM: nom,
      DatabaseProvider.COLUMN_ID: id,
      DatabaseProvider.COLUMN_DESC: description,
      DatabaseProvider.COLUMN_FOUR: fournisseur,
      DatabaseProvider.COLUMN_QTE: qte,
      DatabaseProvider.COLUMN_SEUIL: seuil,
    };
    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }
    return map;
  }

  Produit.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    nom = map[DatabaseProvider.COLUMN_NOM];
    qte = map[DatabaseProvider.COLUMN_QTE];
    seuil = map[DatabaseProvider.COLUMN_SEUIL];
    fournisseur = map[DatabaseProvider.COLUMN_FOUR];
    description = map[DatabaseProvider.COLUMN_DESC];
  }
}
