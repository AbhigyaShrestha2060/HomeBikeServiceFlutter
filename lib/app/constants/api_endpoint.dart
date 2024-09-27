class ApiEndPoints {
  ApiEndPoints._();
  static const Duration connectionTimeout = Duration(seconds: 10000);
  static const Duration receiveTimeout = Duration(seconds: 10000);
  // static const String baseUrl = "http://192.168.137.1:5000/api/";
  // static const String baseUrl = "http://192.168.10.0:5000/api/";
  // static const String baseUrl = "http://localhost:5000/api/";
  // static const String baseUrl = "http://192.168.1.79:5000/api/";
  static const String baseUrl = "http://10.0.2.2:5000/api/";


  // Auth Routes
  static const String loginUser = 'user/login';
  static const String createUser = 'user/create';
  static const String getAllUsers = "user/all";
  static const String getUserById = "user/get/";
  static const String verifyUser = 'user/verify';
  static const String getMe = 'user/current_profile';
  static const String getToken = 'user/get_user_token';
  static const String updateUser = 'user/update_profile';

  static const String sentOtp = 'user/forgot-password';
  static const String verifyOtp = 'user/reset-password';

  // Service Routes
  static const String getAllBikes = 'bike/get_all_bikes';
  static const String paginationBike = 'bike/pagination';
  static const String getBikeImage = 'http://10.0.2.2:5000/bikes/';
  static const String getBikeByModel = 'bike/model';

  // Booking Routes

  static const String addToBookings = "booking/add";
  static const String getBookings = "booking/userBooking";

  static const String changeStatus = "booking/change_status";

  // Chat Routes
  static const String sendMessage = 'messages/send';
  static const String getMessages = 'messages/get/';
  static const String getMessageById = 'messages/get_by_id/';
  static const String sendFile = 'messages/send/file';
  static const String messageFileUrl =
      'http://192.168.137.1:5000/messages/files/';
  static const String messageImageUrl =
      'http://192.168.137.1:5000/messages/images/';

  // Khalti Routes
  static const String khalti = 'payment/initialize_khalti';
  static const String completepayment = 'payment/complete-khalti-payment';
}
