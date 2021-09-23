class Points {
  final points;
  final date;
  final bool? isAdded;

  Points({this.points, this.date, this.isAdded});
}

List<Points> pointsList = [
  Points(points: 200, date: '25/09/2021', isAdded: true),
  Points(points: 100, date: '22/09/2021', isAdded: false),
  Points(points: 200, date: '20/09/2021', isAdded: true),
  Points(points: 300, date: '18/09/2021', isAdded: true),
  Points(points: 400, date: '16/09/2021', isAdded: false),
  Points(points: 250, date: '16/09/2021', isAdded: false),
];
