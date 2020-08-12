import 'package:iStock/db/db-provider.dart';

class Produitf {
  int idd;
  double qe;
  int qq;
  int d;
  String ref;
  double cadence;
  int stockSec;
  int stockAl;
  int ptc;
  int stockmin;

  Produitf({
    this.idd,
    this.qe,
    this.qq,
    this.d,
    this.ref,
    this.cadence,
    this.stockSec,
    this.stockAl,
    this.ptc,
    this.stockmin,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_IDD: idd,
      DatabaseProvider.COLUMN_REFF: ref,
      DatabaseProvider.COLUMN_CAD: cadence,
      DatabaseProvider.Column_D: d,
      DatabaseProvider.COLUMN_QTEE: qe,
      DatabaseProvider.Column_QQ: qq,
      DatabaseProvider.COLUMN_STSEC: stockSec,
      DatabaseProvider.COLUMN_STAL: stockAl,
      DatabaseProvider.COLUMN_PTC: ptc,
      DatabaseProvider.COLUMN_STMIN: stockmin,
    };
    if (idd != null) {
      map[DatabaseProvider.COLUMN_REFF] = idd;
    }
    return map;
  }

  Produitf.fromMap(Map<String, dynamic> map) {
    idd = map[DatabaseProvider.COLUMN_IDD];
    cadence = map[DatabaseProvider.COLUMN_CAD];
    qq = map[DatabaseProvider.Column_QQ];
    d = map[DatabaseProvider.Column_D];
    ref = map[DatabaseProvider.COLUMN_REFF];
    qe = map[DatabaseProvider.COLUMN_QTEE];
    stockSec = map[DatabaseProvider.COLUMN_STSEC];
    stockAl = map[DatabaseProvider.COLUMN_STAL];
    ptc = map[DatabaseProvider.COLUMN_PTC];
    stockmin = map[DatabaseProvider.COLUMN_STMIN];
  }
}
