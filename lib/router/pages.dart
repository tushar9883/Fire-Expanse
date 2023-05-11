import 'package:data_expanse/router/router_name.dart';
import 'package:data_expanse/ui/auth/authcheck/authcheck_screen.dart';
import 'package:data_expanse/ui/auth/forgot/forgot_binding.dart';
import 'package:data_expanse/ui/auth/forgot/forgot_screen.dart';
import 'package:data_expanse/ui/auth/login/login_binding.dart';
import 'package:data_expanse/ui/auth/login/login_screen.dart';
import 'package:data_expanse/ui/auth/singup/singup_binding.dart';
import 'package:data_expanse/ui/auth/singup/singup_screen.dart';
import 'package:data_expanse/ui/home/home.dart';
import 'package:data_expanse/ui/home/home_binding.dart';
import 'package:data_expanse/ui/newtransaction/newtransaction.dart';
import 'package:data_expanse/ui/newtransaction/newtransaction_binding.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Pages {
  static List<GetPage> pages() {
    return [
      GetPage(
        name: RouterName.authCheck,
        page: () => const AuthCheckScreen(),
      ),
      GetPage(
        name: RouterName.login,
        page: () => const LoginScreen(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: RouterName.forgotPassword,
        page: () => const ForgotScreen(),
        binding: ForgotBinding(),
      ),
      GetPage(
        name: RouterName.signup,
        page: () => const SingupScreen(),
        binding: SingupBinding(),
      ),
      GetPage(
        name: RouterName.home,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: RouterName.newTransaction,
        page: () => const NewTransactionScreen(),
        binding: NewTransactionBinding(),
      ),
    ];
  }
}
