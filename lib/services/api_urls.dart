class URL {
  static String apiVersion = "1.0.0";
  static String baseURL = "http://global.timetick.ae/MAttendance";

  static String loginURL = "$baseURL/api/Login/Login?";
  static String profileURL = "$baseURL/api/Client/ClientList?";

  static String summaryReportListUrl = '$baseURL/api/SummaryReport/Report?';

// client
  static String insertClientURL = '$baseURL/api/Customer/CustomerInsert';
  static String leadSourceListURL = '$baseURL/api/Customer/LeadSourceList?';
  static String nextVisitListURL =
      '$baseURL/api/CheckInOut/PendingClientListReport?';

  static String productURL = '$baseURL/api/Customer/ProductDetails?';
  static String clientListURL = '$baseURL/api/Customer/CustomerList?';
  // check api url
  static String checkInURL = '$baseURL/api/CheckInOut/ClientVisitInsert';
  static String checkInListURL =
      '$baseURL/api/CheckInOut/ChkinChkOutClientReport?';

  static String checkOutURL = '$baseURL/api/CheckInOut/ClientCheckOut';
  static String checkOutListURL = '$baseURL/api/CheckInOut/ChkOutClientReport?';

  static String scheduleClientURL = '$baseURL/api/CheckInOut/ScheduleClientAPI';

  // Admin
  static String employeeListURL = '$baseURL/api/Employee/EmployeeList?';
}
