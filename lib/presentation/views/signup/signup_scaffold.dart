part of 'signup_page.dart';

class _Scaffold extends StatelessWidget {
  _Scaffold({
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
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24,
                  children: [
                    header,
                    const SizedBox(
                      height: 6,
                    ),
                    name,
                    camId,
                    emergencyNumbers,
                    const SizedBox(
                      height: 10,
                    ),
                    button,
                    const SizedBox(
                      height: 10,
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
