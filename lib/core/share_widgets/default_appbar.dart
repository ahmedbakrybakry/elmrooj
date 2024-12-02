import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/assets.dart';
import 'package:flutter_application_1/core/constants/colors.dart';
import 'package:flutter_application_1/features/about_us/about_us.dart';
import 'package:flutter_application_1/features/splash/screens/splash_screen.dart';

// نحتاج أن نضيف الاستيراد للصفحات التي سيتم التنقل إليها

class DefaultAppbar extends StatelessWidget {
  DefaultAppbar({super.key});

  // قائمة العناصر التي ستظهر في الـ Dropdown
  final List<String> menuItems = ['الرئيسية', 'من نحن', 'الخدمات', 'المدونة', 'اتصل بنا'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.17,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      color: AppColors.barcolor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // زر الـ menu الذي يفتح القائمة
          IconButton(
            onPressed: () {
              // عند الضغط، نعرض الـ Dropdown في المكان الصحيح
              _showFullScreenMenu(context);
            },
            icon: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: AppColors.secondcolor,
              ),
              child: Icon(
                Icons.menu,
                color: AppColors.whitecolor,
                size: 40,
              ),
            ),
          ),
          const Spacer(),
          // الشعار
          Image.asset(
            Images.logomain,
            color: AppColors.secondcolor,
          ),
        ],
      ),
    );
  }

  // دالة لعرض القائمة أسفل الزر
  void _showFullScreenMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject() as RenderBox; // الحصول على حجم وموضع الزر
    final size = button.size;
    final position = button.localToGlobal(Offset.zero); // موقع الزر بالنسبة للشاشة

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        position.dx, // يبدأ من نفس موضع الزر على الـ X-axis
        position.dy + size.height, // يبدأ من أسفل الزر (موضع Y + الارتفاع)
        0.0,
        0.0,
      ),
      items: menuItems.map((String item) {
        return PopupMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.black, // النص باللون الأسود
              fontSize: 18,
            ),
          ),
        );
      }).toList(),
    ).then((selectedValue) {
      // عند اختيار عنصر من القائمة، ننتقل إلى الشاشة المعنية
      if (selectedValue != null) {
        _navigateToScreen(context, selectedValue);
      }
    });
  }

  // دالة التنقل بين الشاشات باستخدام Navigator.push()
  void _navigateToScreen(BuildContext context, String selectedValue) {
    switch (selectedValue) {
      case 'الرئيسية':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
             // HomeScreen()
            const SplashScreen()
          ),
        );
        break;
      case 'من نحن':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>

              const AboutUs()
         
          ),
        );
        break;
      case 'الخدمات':
      // عرض قائمة فرعية للخدمات عند الضغط على "الخدمات"
        _showServicesMenu(context);
        break;
      case 'المدونة':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>

            //  BlogScreen()
          const SplashScreen()
          ),
        );
        break;
      case 'اتصل بنا':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
            //  ContactScreen()
            const SplashScreen()
          ),
        );
        break;
      default:
        break;

    }
  }

  // دالة لعرض قائمة فرعية للخدمات عند الضغط على "الخدمات"
  void _showServicesMenu(BuildContext context) {
    final List<String> servicesMenuItems = [
      'تصميم وتطوير مواقع',
      'تصميم متجر الكتروني',
      'الفيديوهات الإعلانية',
      'إدارة المواقع الإلكترونية',
      'تحسين ظهور الموقع',
      'نظام خدمة العملاء CRM',
      'إدارة صفحات السوشيال ميديا',
      'إعلانات جوجل',
      'تصاميم السوشيال ميديا',
      'زيادة المتابعين'
    ];

    // عرض الـ Dropdown لقائمة الخدمات
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0.0, 0.0, 0.0, 0.0),
      items: servicesMenuItems.map((String item) {
        return PopupMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: const TextStyle(
              color: Colors.black, // النص باللون الأسود
              fontSize: 18,
            ),
          ),
        );
      }).toList(),
    ).then((selectedService) {
      // عند اختيار خدمة من القائمة، ننتقل إلى الشاشة المعنية
      if (selectedService != null) {
        _navigateToServiceScreen(context, selectedService);
      }
    });
  }

  // دالة التنقل بين شاشات الخدمات
  void _navigateToServiceScreen(BuildContext context, String selectedService) {
    switch (selectedService) {
      case 'تصميم وتطوير مواقع':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              //WebDesignScreen()
          const SplashScreen()
          ),
        );
        break;
      case 'تصميم متجر الكتروني':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
             // EcommerceDesignScreen()
            const SplashScreen()
          ),
        );
        break;
      case 'الفيديوهات الإعلانية':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
             // AdvertisingVideosScreen()
          const SplashScreen()
          ),
        );
        break;
      case 'إدارة المواقع الإلكترونية':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
            //  WebsiteManagementScreen()
          const SplashScreen()
          ),
        );
        break;
      case 'تحسين ظهور الموقع':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
          //    SeoOptimizationScreen()
          const SplashScreen()
          ),
        );
        break;
      case 'نظام خدمة العملاء CRM':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
            //  CrmSystemScreen()
          const SplashScreen()
          ),
        );
        break;
      case 'إدارة صفحات السوشيال ميديا':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
          //    SocialMediaManagementScreen()
          const SplashScreen()
          ),
        );
        break;
      case 'إعلانات جوجل':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
          //    GoogleAdsScreen()
          const SplashScreen()
          ),
        );
        break;
      case 'تصاميم السوشيال ميديا':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
              //SocialMediaDesignsScreen()
          const SplashScreen()
          ),
        );
        break;
      case 'زيادة المتابعين':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) =>
          //    IncreaseFollowersScreen()
          const SplashScreen()
          ),
        );
        break;
      default:
        break;
    }
  }
}
