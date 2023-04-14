class PieData {
  PieData(this.xData, this.yData, [this.text]);
  final String xData;
  final num yData;
  final String text;
}

class LineData {
  LineData(this.month, this.total);

  final String month;
  final double total;
}
