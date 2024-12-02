import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:flutter_application_1/core/share_widgets/default_appbar.dart';

import '../../../core/constants/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
children: [
  DefaultAppbar(),
  Container(
    height: MediaQuery.of(context).size.height*0.8,

    child: Stack(
      children: [
        // الصورة في الخلفية
        Image.asset(
         Images.mainbackground ,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        // التعتيم على الصورة
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.5),  // تعتيم بنسبة 50%
        ),
        // النصوص والأزرار
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // النص الأول
              Text(
                'نعمل بدقة وذكاء لمساعدتك',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),  // مسافة بين النصوص
              // النص الثاني
              Text(
                'في التواصل لجمهورك المستهدف',
                style: TextStyle(
                  color: Color(0xffe38e39),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40),  // مسافة بين النصوص والأزرار
              // الأزرار
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // الزر الأول
                  ElevatedButton(
                    onPressed: () {
                      // هنا تضع الكود الذي ينفذ عند الضغط
                    },
                    style: ElevatedButton.styleFrom(

                      backgroundColor:Color(0xff9c6f22),  // اللون الخلفي
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Row(
                        children: [
                          Icon(Icons.forward),
                          SizedBox(width: 10,),
                          Text(
                            'اطلب خدمتك الآن',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),  // مسافة بين الأزرار
                  // الزر الثاني
                  ElevatedButton(
                    onPressed: () {
                      // هنا تضع الكود الذي ينفذ عند الضغط
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blackcolor,  // اللون الخلفي
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.4,
                      child: Row(
                        children: [
                          Icon(Icons.forward,color: AppColors.whitecolor,),
                          SizedBox(width: 10,),

                          Text(
                            'التواصل معنا الآن',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),)
],
        ),
      ),
    );
  }
}
