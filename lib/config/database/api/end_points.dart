class EndPoints {
  //basic urls
  static const String baseUrl = 'http://localhost:5053/api/';
  static const String prefixToken = 'Bearer';
  static const String images = "http://localhost:5053/";

  //auth
  static const String forgetPassword = "";
  static const String resendCode = "";
  static const String resetPassword = "";
  static const String verifyEmail = "";
  static const String login = "";
  static const String register = "";
  static const String checkEmail = "";

  static const String ads = "";
  //products
  static const String bestSellerProducts = "products/top-popular";
  static const String categories = "categories";
  static const String offers = "";
  static const String recommendationProducts = "products/recommended";
  static const String productDetails = "products";
  //wishlist
  static const String addToWishlist = "";
  static const String removeFromWishlist = "";
  static const String wishlist = "";

  //cart
  static const String updateCartQuantity = "";
  static const String removeProductFromCart = "";
  static const String addProductToCart = "";
  static const String cartProducts = "";

  static var categoryDetails;
}

class ApiKeys {
  static const String email = "email";
  static const String password = "password";
  static const String rePassword = "rePassword";
  static const String newPassword = 'newPassword';
  static const String oldPassword = 'oldPassword';
  static const String confirmPassword = 'confirmPassword';
  static const String message = "message";
  static const String token = "token";
  static const String name = "name";
  static const String phone = "phone";
  static const String image = "image";
  static const String age = "age";
  static const String coordinates = "coordinates";
  static const String location = "location";
  static const String otpSecret = "otpSecret";
}
