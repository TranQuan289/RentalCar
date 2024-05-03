import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rental_car/presentation/views/auth/notifier/auth_notifier.dart';

import '../../../../application/utils/colors_utils.dart';
import '../../../common/widgets/text_button_widget.dart';
import '../../../common/widgets/text_form_field.dart';
import 'icon_button_widget.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
    required this.emailController,
    required this.notifier,
  });

  final TextEditingController emailController;
  final AuthNotifier notifier;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome to, RentalCar',
            style: TextStyle(
                color: ColorUtils.primaryColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Enter your account to continue',
            style: TextStyle(
              color: ColorUtils.textColor,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldCustomWidget(
            hint: 'Your email address',
            label: "Email address",
            inputAction: TextInputAction.next,
            controller: emailController,
          ),
          SizedBox(
            height: 20.h,
          ),
          TextFormFieldCustomWidget(
            hint: 'Your password',
            label: "Password",
            controller: emailController,
            inputAction: TextInputAction.done,
            obscureText: true,
            suffixIcon: IconButton(
              onPressed: () => {},
              icon: true
                  ? SvgPicture.asset(
                      'assets/icons/visibility_on.svg',
                      colorFilter: ColorFilter.mode(
                        ColorUtils.textColor,
                        BlendMode.srcIn,
                      ),
                    )
                  : SvgPicture.asset(
                      'assets/icons/visibility_off.svg',
                      colorFilter: ColorFilter.mode(
                        ColorUtils.textColor,
                        BlendMode.srcIn,
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          TextButtonWidget(
            label: 'Login',
            onPressed: () {},
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              child: Text(
                'Forgot password?',
                style: TextStyle(
                  color: ColorUtils.textColor,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: ColorUtils.textColor,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  "Or login with",
                  style: TextStyle(
                    color: ColorUtils.primaryColor,
                    fontSize: 14,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: ColorUtils.textColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButtonWidget(
                icon: Image.asset(
                  'assets/icons/ic_google.png',
                  width: 30.w,
                  height: 30.h,
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              IconButtonWidget(
                icon: Image.asset(
                  'assets/icons/ic_facebook.png',
                  width: 30.w,
                  height: 30.h,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Didn\'t you have a RentalCar account? ',
                  style: TextStyle(
                    color: ColorUtils.textColor,
                    fontSize: 14,
                  ),
                ),
                GestureDetector(
                  onTap: () => notifier.changeView(),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: ColorUtils.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
