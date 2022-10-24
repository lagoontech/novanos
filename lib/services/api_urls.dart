class URL {
  static String API_VERSION = "1.0.0";
  static String BASE_URL = "http://global.timetick.ae/MAttendance";

  static String LOGIN = "$BASE_URL/api/Login/Login?";
  static String PROFILE = "$BASE_URL/api/Client/ClientList?";

  static String SUMMARY_REPORT_LIST = '$BASE_URL/api/SummaryReport/Report?';

// client
  static String INSERT_CLIENT = '$BASE_URL/api/Customer/CustomerInsert';
  static String LEAD_SOURCE_LIST = '$BASE_URL/api/Customer/LeadSourceList?';
  static String NEXT_VISIT_LIST =
      '$BASE_URL/api/CheckInOut/PendingClientListReport?';

  static String PRODUCTS = '$BASE_URL/api/Customer/ProductDetails?';
  static String CLIENT_LIST = '$BASE_URL/api/Customer/CustomerList?';
  // check api url
  static String CHECK_IN = '$BASE_URL/api/CheckInOut/ClientVisitInsert';
  static String CHECK_IN_LIST =
      '$BASE_URL/api/CheckInOut/ChkinChkOutClientReport?';

  static String CHECK_OUT = '$BASE_URL/api/CheckInOut/ClientCheckOut';
  static String CHECK_OUT_LIST = '$BASE_URL/api/CheckInOut/ChkOutClientReport?';

  static String SCHEDULE_CLIENT = '$BASE_URL/api/CheckInOut/ScheduleClientAPI';
}
