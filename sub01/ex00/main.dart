Map<String, int> SpaceData = {
  'NGC 162': 1862,
  '87 Sylvia': 1866,
  'R 136a1': 1985,
  '28978 Ixion': 2001,
  'NGC 6715': 1778,
  '94400 Hongdaeyong': 2001,
  '6354 Vangelis': 1934,
  'C/2020 F3': 2020,
  'Cartwheel Galaxy': 1941,
  'Sculptor Dwarf Elliptical Galaxy': 1937,
  'Eight-Burst Nebula': 1835,
  'Rhea': 1672,
  'C/1702 H1': 1702,
  'Messier 5': 1702,
  'Messier 50': 1711,
  'Cassiopeia A': 1680,
  'Great Comet of 1680': 1680,
  'Butterfly Cluster': 1654,
  'Triangulum Galaxy': 1654,
  'Comet of 1729': 1729,
  'Omega Nebula': 1745,
  'Eagle Nebula': 1745,
  'Small Sagittarius Star Cloud': 1764,
  'Dumbbell Nebula': 1764,
  '54509 YORP': 2000,
  'Dia': 2000,
  '63145 Choemuseon': 2000,
};

void main() {
  SpaceData.forEach((key, value) {
    print('$key : $value');
  });
  print('|\n|\n');
  List<String> sortedKeys = SpaceData.keys.toList();
  sortedKeys.sort((a, b) {
    return SpaceData[a]!.compareTo(SpaceData[b]!);
  });
  Map<String, int> sortedMap = {};
  sortedKeys.forEach((element) {
    sortedMap[element] = SpaceData[element]!;
  });
  sortedMap.forEach((key, value) {
    print('$key : $value');
  });
}
