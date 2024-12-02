import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Container(
                        width: 30,
                        height: 40,
                        color: Colors.amber,
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      )),
                  const Spacer(),
                  Image.asset(
                    "assets/mainlogo.png",
                    width: 70,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 500,
              child: Stack(
                children: [
                  SizedBox(
                      height: 500,
                      child: Image.asset(
                        "assets/marketing-analysis.jpg",
                        fit: BoxFit.fitHeight,
                      )),
                  Positioned(
                    bottom: 0,
                    child: Center(
                      child: Image.asset("assets/about-banner.png"),
                    ),
                  ),
                  const Positioned(
                    top: 25,
                    right: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "من نحن",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(height: 25),
                        SizedBox(
                          width: 450,
                          child: Text(
                            '''تأسست شركة الجودي والمروج لتقنية المعلومات بدولة الإمارات - دبي   وهي شركة رائدة في مجال التسويق الرقمي لتقديم خدماتها في التسويق الاكتروني للمؤسسات والأفراد والشركات وقد خدمت أكثر من 5 آلاف عميل حتى الآن وحازت علي رضاء جميع العملاء''',
                            style: TextStyle(
                                fontSize: 16, color: Colors.white, height: 1.9),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Image.asset("assets/about-dynamic-team-im.jpg"),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    "شركة الجودي للتسويق الإلكتروني",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'تأسست شركة الجودي للتسويق الإلكتروني، وهي شركة رائدة في مجال التسويق الإلكتروني في الشرق الأوسط . تعتبر الشركة اليوم من أهم اللاعبين في هذا المجال، وذلك بفضل خبرتها الواسعة وفريق عملها المحترف والمتخصص.',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 25,),
                  Text(
                    "خدمات شركة الجودي",
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.indigo[900],
                        fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                      '''
تتمثل خدمات شركة الجودي في التسويق الإلكتروني:
 تصميم المواقع الإلكترونية-
إدارة الحملات الإعلانية-
كما توفر الشركة أيضًا برامج تسويقية إلكترونية وبرامج إدارة المواقع الإلكترونية.
 التسويق عبر وسائل التواصل الاجتماعي-
  ''',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
