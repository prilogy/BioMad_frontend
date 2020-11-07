int getAgeFromDate(DateTime date) =>
    DateTime.now().difference(date).inDays ~/ 365;