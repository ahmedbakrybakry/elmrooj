import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/colors.dart';

import '../../../core/constants/assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
children: [
  Container(
    height: MediaQuery.of(context).size.height*0.2,

    padding: EdgeInsets.symmetric(vertical: 20,
    horizontal: 30,
    ),
    color: Colors.blue,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
IconButton(onPressed: (){}, icon: Container(
  color: AppColors.secondcolor,
  child: Icon(Icons.menu,color: AppColors.whitecolor,
  size: 30,
  ),
)),
        
        Spacer(),
        Image.asset(Images.logomain,color: AppColors.secondcolor,)
      ],
    ),
  ),
  Container(
    height: MediaQuery.of(context).size.height*0.8,

    child: Stack(
      children: [
        // الصورة في الخلفية
        Image.asset(
          'assets/background.jpg',
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
        Column(
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
                color: AppColors.maincolor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 40),  // مسافة بين النصوص والأزرار
            // الأزرار
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // الزر الأول
                ElevatedButton(
                  onPressed: () {
                    // هنا تضع الكود الذي ينفذ عند الضغط
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,  // اللون الخلفي
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text(
                    'اطلب خدمتك الآن',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(width: 20),  // مسافة بين الأزرار
                // الزر الثاني
                ElevatedButton(
                  onPressed: () {
                    // هنا تضع الكود الذي ينفذ عند الضغط
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,  // اللون الخلفي
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: Text(
                    'التواصل معنا الآن',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),)
],
        ),
      ),
    );
  }
}
