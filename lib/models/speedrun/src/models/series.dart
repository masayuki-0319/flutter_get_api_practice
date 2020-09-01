// ref: https://github.com/speedruncomorg/api/blob/master/version1/series.md#get-series
class Series {
  Series({
    this.id,
    this.nameInt,
    this.nameJap,
    this.abbreviation,
    this.webLink,
    this.moderators,
    this.created,
    this.assets,
    // this.logo,
    // this.coverTiny,
    // this.coverSmall,
    // this.coverMedium,
    // this.coverLarge,
    // this.icon,
    // this.trophy1st,
    // this.trophy2nd,
    // this.trophy3rd,
    // this.trophy4th,
    // this.background,
    // this.foreground,
    this.selfLink,
    this.gamesLink,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> convertMap(String attr) {
      final baseConvert = json['$attr'] as Map<String, dynamic>;
      return Map<String, dynamic>.from(baseConvert);
    }

    return Series(
      id: json['id'] as String,
      nameInt: json['names']['international'] as String ?? 'none',
      nameJap: json['names']['japanese'] as String ?? 'none',
      abbreviation: json['abbreviation'] as String,
      webLink: json['weblink'] as String,
      moderators: convertMap('moderators'),
      created: json['created'] as String,
      assets: convertMap('assets'),
      // logo: json['assets']['logo'] as String,
      // coverTiny: json['assets']['cover-tiny'] as String,
      // coverSmall: json['assets']['cover-small'] as String,
      // coverMedium: json['assets']['cover-medium'] as String,
      // coverLarge: json['assets']['cover-large'] as String,
      // icon: json['assets']['icon'] as String,
      // trophy1st: json['assets']['trophy-1st'] as String,
      // trophy2nd: json['assets']['trophy-2nd'] as String,
      // trophy3rd: json['assets']['trophy-3rd'] as String,
      // trophy4th: json['assets']['trophy-4th'] as String,
      // background: json['assets']['background'] as String,
      // foreground: json['assets']['foreground'] as String,
      selfLink: json['links'][0]['uri'] as String,
      gamesLink: json['links'][1]['uri'] as String,
    );
  }

  final String id;
  final String nameInt;
  final String nameJap;
  final String abbreviation;
  final String webLink;
  final Map<String, dynamic> moderators;
  final String created;
  final Map<String, dynamic> assets;
  // final String logo;
  // final String coverTiny;
  // final String coverSmall;
  // final String coverMedium;
  // final String coverLarge;
  // final String icon;
  // final String trophy1st;
  // final String trophy2nd;
  // final String trophy3rd;
  // final String trophy4th;
  // final String background;
  // final String foreground;
  final String selfLink;
  final String gamesLink;
}
