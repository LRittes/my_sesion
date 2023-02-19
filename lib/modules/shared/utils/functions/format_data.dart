List<String> formatData(String value) {
  var data = DateTime.parse(value);
  String day = data.day > 9 ? data.day.toString() : "0${data.day}";
  String month = data.month > 9 ? data.month.toString() : "0${data.month}";
  int year = data.year;
  String weekDay = '';
  switch (data.weekday) {
    case DateTime.monday:
      weekDay = "Monday";
      break;
    case DateTime.tuesday:
      weekDay = "Tuesday";
      break;
    case DateTime.wednesday:
      weekDay = "Wednesday";
      break;
    case DateTime.thursday:
      weekDay = "Thursday";
      break;
    case DateTime.friday:
      weekDay = "Friday";
      break;
    case DateTime.saturday:
      weekDay = "Saturday";
      break;
    case DateTime.sunday:
      weekDay = "Sunday";
      break;
    default:
  }

  return [weekDay, "$day/$month/$year"];
}
