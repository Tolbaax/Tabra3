class EndPoints {
  static const String baseUrl = 'http://momedsalah-001-site1.atempurl.com/api';
  static const String register = '$baseUrl/User/Register';
  static const String login = '$baseUrl/User/Login';
  static const String allUrgentCases = '$baseUrl/UrgentCase/GetAllUrgentCase';
  static const String addUrgentCase = '$baseUrl/UrgentCase/AddUrgentCase';
  static const String allDonors = '$baseUrl/Donor/GetAllDonors';
  static const String addDonor = '$baseUrl/Donor/AddDonor';
  static const String allRecipient = '$baseUrl/Recipient/GetAllRecipient';
  static const String addRecipient = '$baseUrl/Recipient/AddRecipient';
}
