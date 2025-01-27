import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:plantairium/common/utils/colors.dart';
import 'package:plantairium/features/account/ui/account.dart';
import 'package:plantairium/features/plants/ui/plant.dart';
import 'package:plantairium/features/sensors/ui/sensors.dart';
class Base extends StatefulWidget {
  const Base({super.key, this.title, this.signupData});
  final String? title;
  final SignupData? signupData;
  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  int _currentPage = 0;
  final PageController _controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(10),
          // height: MediaQuery.of(context).size.height - 200,
          child: PageView(
            // physics: constNeverScrollableScrollPhysics(),
            controller: _controller,
            children: const [
              SensorsView(),
              Account(),
            ],
            onPageChanged: (value) => setState(() {
              _currentPage = value;
            }),
          ),
        ),
        extendBody: false,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Palette.primary,
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Icon(
            Icons.document_scanner_outlined,
            color: Palette.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 10,
          shadowColor: Palette.primary,
          surfaceTintColor: Palette.white,
          color: Palette.white,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          height: 60,
          notchMargin: 8,
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color:
                      _currentPage == 0 ? Palette.primary : Palette.deselected,
                ),
                onPressed: () {
                  setState(() {
                    _currentPage = 0;
                    _controller.jumpToPage(_currentPage);
                  });
                },
              ),
              // IconButton(
              //   icon: Icon(
              //     Icons.favorite,
              //     color:
              //         _currentPage == 1 ? Palette.primary : Palette.deselected,
              //   ),
              //   onPressed: () {
              //     setState(() {
              //       _currentPage = 1;
              //       _controller.jumpToPage(_currentPage);
              //     });
              //   },
              // ),
              const SizedBox(
                width: 50,
              ),
              // IconButton(
              //   icon: Icon(
              //     Icons.chat,
              //     color:
              //         _currentPage == 2 ? Palette.primary : Palette.deselected,
              //   ),
              //   isSelected: true,
              //   onPressed: () {
              //     setState(() {
              //       _currentPage = 2;
              //       _controller.jumpToPage(_currentPage);
              //     });
              //   },
              // ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color:
                      _currentPage == 1 ? Palette.primary : Palette.deselected,
                ),
                onPressed: () {
                  setState(() {
                    _currentPage = 1;
                    _controller.jumpToPage(_currentPage);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
