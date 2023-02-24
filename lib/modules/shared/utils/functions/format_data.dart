Map<String, String> formatData(DateTime date) {
  String day = date.day > 9 ? date.day.toString() : "0${date.day}";
  String month = date.month > 9 ? date.month.toString() : "0${date.month}";
  int year = date.year;
  String weekDay = '';
  switch (date.weekday) {
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

  return {
    "weekDay": weekDay,
    "date": "$day/$month/$year",
    "dateToJson": "$day$month$year"
  };
}
