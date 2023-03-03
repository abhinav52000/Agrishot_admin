// import 'dart:async';

// ///The `StreamTransformers` for validations
// mixin Validators {
//   var emailValidator = StreamTransformer<String, String>.fromHandlers(
//     handleData: (email, sink) {
//       if (email.isEmpty) {
//         return sink.addError("This field can't be empty");
//       }
//       if (email.length > 32) {
//         return sink.addError("Email can't be more than 32 characters");
//       }
//       if (!email.startsWith(RegExp(r'[A-za-z]'))) {
//         return sink.addError("Email cannot start with special characters");
//       }
//       if (email.length < 6) {
//         return sink.addError("Email is too short");
//       }
//       if (!RegExp(
//               r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//           .hasMatch(email)) {
//         return sink.addError("Invalid Email");
//       } else {
//         sink.add(email);
//       }
//     },
//   );

//   var loginPasswordValidator = StreamTransformer<String, String>.fromHandlers(
//     handleData: (password, sink) {
//       if (password.isEmpty) {
//         return sink.addError("This field can't be empty");
//       }

//       if (password.length < 8) {
//         return sink.addError("Password can't be less than 8 characters");
//       } else {
//         sink.add(password);
//       }
//     },
//   );
// }
