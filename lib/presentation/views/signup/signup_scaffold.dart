part of 'signup_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.appbar,
    required this.header,
    required this.name,
    required this.camId,
    required this.emergencyNumbers,
    required this.button,
    required this.formKey,
  });

  final Widget appbar;
  final Widget header;
  final Widget name;
  final Widget camId;
  final Widget emergencyNumbers;
  final Widget button;
  final GlobalKey formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            appbar,
            SizedBox(
              height: 24.h, // .h 추가
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w), // .w 추가
              child: Form(
                key: formKey,
                child: Column(
                  spacing: 24.h,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    header,
                    SizedBox(
                      height: 6.h, // .h 추가
                    ),
                    name,
                    camId,
                    emergencyNumbers,
                    SizedBox(
                      height: 10.h, // .h 추가
                    ),
                    button,
                    SizedBox(
                      height: 10.h, // .h 추가
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}