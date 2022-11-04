void main(List<String> args) {
  String date = "2022-11-02T00:30:00Z";

  var dateDateTime =
      DateTime.parse("${date.substring(0, 10)} ${date.substring(11, 20)}");
  dateDateTime = dateDateTime.toLocal();
  print("${dateDateTime.hour}:${dateDateTime.minute}");
}
