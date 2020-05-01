class BengkuluModel {
  final String confirmed;
  final String recovered;
  final String deaths;
  final String odp;
  final String pdp;
  final DateTime lastupdate;

  BengkuluModel({
    this.confirmed,
    this.deaths,
    this.recovered,
    this.odp,
    this.pdp,
    this.lastupdate,
  });
}
