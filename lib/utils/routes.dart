 
import 'package:join_re/screens/company/basic_info_employer.dart';
import 'package:join_re/screens/company/company_profile.dart';
import 'package:join_re/screens/company/complete_info.dart';
import 'package:join_re/screens/company/employer_login.dart';
import 'package:join_re/screens/company/post_job_success.dart';
import 'package:join_re/screens/company/profile_updated_employer.dart';
import 'package:join_re/screens/email_verification/email_confirmation.dart';
import 'package:join_re/screens/email_verification/email_success.dart';
import 'package:join_re/screens/email_verification/verify_email.dart';
import 'package:join_re/screens/chat/Conversation_page.dart';
import 'package:join_re/screens/employee/package_confirmation.dart';
import 'package:join_re/screens/employee/popup/add_video.dart';
import 'package:join_re/screens/employee/popup/cv_color.dart';
import 'package:join_re/screens/employee/popup/cv_template.dart';
import 'package:join_re/screens/employee/employee_home.dart';
import 'package:join_re/screens/employee/popup/add_photo.dart';
import 'package:join_re/screens/employee/popup/change_password.dart';
import 'package:join_re/screens/employee/education.dart';
import 'package:join_re/screens/employee/packages.dart';
import 'package:join_re/screens/employee/popup/password_reset_success.dart';
import 'package:join_re/screens/employee/preview_page.dart';
import 'package:join_re/screens/employee/view_profile.dart';
import 'package:join_re/screens/employee/work_exp.dart';
import 'package:join_re/screens/employee/employee_login.dart';
import 'package:join_re/screens/main_page.dart';
import 'package:join_re/screens/main_page_employer.dart';
import 'package:join_re/screens/mobile_verification/mobile_success.dart';
import 'package:join_re/screens/mobile_verification/verification.dart';
import 'package:join_re/screens/mobile_verification/verify_mobile.dart';
import 'package:join_re/screens/options/options.dart';
import 'package:join_re/screens/employee/basic_info.dart';
import 'package:join_re/widgets/profile_updated.dart';

 final route = {
        '/work_exp': (context) => WorkExp(),
        '/education': (context) => const Education(),
        '/profile_updated': (context) => ProfileUpdated(),
        '/select_option': (context) => Options(),
        '/basic_info_employee': (context) => const BasicInfo(),
        '/basic_info_employer': (context) => const BasicInfoEmployer(),
        '/verify_mobile': (context) => VerifyMobile(),
        '/verify_email': (context) => VerifyEmail(),
        // '/preview_employee': (context) => PreviewPage(data:0),
        '/employee_home': (context) => const MainPage (pg :0),
        '/employer_home': (context) => const MainPageEmployer(pg :0),
        // '/employee_home': (context) => const EmployeeHome(),
        // '/view_profile': (context) => ViewProfile(data: [],),
        '/packages': (context) => Packages(),
        '/package_confirmation': (context) => PackageConfirmation(),
        '/add_photo': (context) => AddPhoto(id:0),
        '/add_video': (context) => AddVideo(id:0),
        '/change_password': (context) => ChangePassword(id:0),
        '/password_reset_success': (context) => PasswordResetSuccess(),
        '/email_confirmation': (context) => EmailConfirmation(),
        '/email_success': (context) => EmailSuccess(),
        '/mobile_success': (context) => MobileSuccess(),
        '/post_job_success':(context) => PostJobSuccess(),
        '/verification': (context) => Verification(),
        '/inbox': (context) => ConversationPage(),
        '/employee_login': (context) => const EmployeeLogin(),
        '/employer_login': (context) => EmployerLogin(),
        '/cv_color': (context) => CVColor(id:0),
        '/cv_template': (context) => CVTemplate(id:0,color: '',),
        '/company_profile': (context) => CompanyProfile(),
        '/profile_updated_employer': (context) => ProfileUpdatedEmployer(),
        '/preview_employer': (context) => const CompleteInfo(),
      };
    