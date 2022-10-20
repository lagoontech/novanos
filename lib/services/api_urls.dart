class URL {
  static String API_VERSION = "1.0.0";
  static String BASE_URL = "http://global.timetick.ae/MAttendance";

  static String LOGIN = "$BASE_URL/api/Login/Login?";
  static String PROFILE = "$BASE_URL/api/Client/ClientList?";
  static String CHECK_IN = "$BASE_URL/api/IO/IO/";
  static String CHECK_IN_NEW = "$BASE_URL/api/CheckInOut/CheckInOut";
  static String MANUAL_ENTRY_LIST = "$BASE_URL/api/ManualEntry/ManualEntryList";
  static String LEAVE_LIST = "$BASE_URL/api/Leave/LeaveList";
  static String LEAVE_TYPE = "$BASE_URL/api/Leave/LoadLeaveType";
  static String LEAVE_REQUEST = "$BASE_URL/api/Leave/LeaveInsert";
  static String MANUAL_REQUEST = "$BASE_URL/api/ManualEntry/ManualEntryInsert";
  static String PRIVACY = "https://lagoontechnologies.com/privacy-policy-3";
  static String SUMMARY_REPORT_LIST = '$BASE_URL/api/SummaryReport/Report?';

// client
  static String INSERT_CLIENT = '$BASE_URL/api/Customer/CustomerInsert';
  static String LEAD_SOURCE_LIST = '$BASE_URL/api/Customer/LeadSourceList?';

  static String PRODUCTS = '$BASE_URL/api/Customer/ProductDetails?';
  static String CLIENT_LIST = '$BASE_URL/api/Customer/CustomerList?';
  // check api url
  static String CHECK = '$BASE_URL/api/CheckInOut/ClientVisitInsert';
}
