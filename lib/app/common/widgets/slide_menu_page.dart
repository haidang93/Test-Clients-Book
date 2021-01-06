import 'package:clientsbook/app/common/const.dart';
import 'package:clientsbook/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPagaLayout extends StatefulWidget {
  MainPagaLayout({
    Key key,
    this.body,
    this.title,
  }) : super(key: key);
  final Widget body;
  final Widget title;
  @override
  _MainPagaLayoutState createState() => _MainPagaLayoutState();
}

class _MainPagaLayoutState extends State<MainPagaLayout> {
  @override
  Widget build(BuildContext context) {
    return SlideMenuPage(
      title: widget.title,
      centerTitle: true,
      color: Colors.indigo[800],
      header: FlatButton(
        onPressed: () {
          Get.offNamed(Routes.SETTING);
        },
        child: Row(
          children: [
            Icon(
              Icons.settings,
              size: 28,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              'Setting',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      footer: FlatButton(
          onPressed: () {
            Get.offNamedUntil(Routes.LOGIN, (route) => false);
          },
          child: Row(
            children: [
              Icon(
                Icons.logout,
                size: 28,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          )),
      items: menuItems,
      body: widget.body,
    );
  }
}

class SlideMenuPage extends StatefulWidget {
  SlideMenuPage({
    Key key,
    this.centerTitle = false,
    @required this.title,
    @required this.items,
    this.header,
    this.footer,
    this.acctions,
    this.color = Colors.deepPurple,
    @required this.body,
  }) : super(key: key);
  final bool centerTitle;
  final Widget title;
  final List<SlideMenuItem> items;
  final Widget header;
  final Widget footer;
  final Widget body;
  final List<Widget> acctions;
  final Color color;

  @override
  _SlideMenuPageState createState() => _SlideMenuPageState();
}

class _SlideMenuPageState extends State<SlideMenuPage>
    with TickerProviderStateMixin {
  bool menu = false;
  int animationDuration = 300;
  Animation<double> menuButtonAnimation;
  AnimationController menuButtonContoller;
  Offset tapPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  widget.color.withOpacity(1),
                  widget.color.withOpacity(0.5),
                  widget.color.withOpacity(0.3),
                ],
              ),
            ),
            padding: EdgeInsets.all(20),
            child: SafeArea(
              child: Container(
                height: double.infinity,
                width: MediaQuery.of(context).size.width * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Theme(
                      data: ThemeData(
                        textTheme: TextTheme(
                          button: TextStyle(color: Colors.white),
                        ),
                      ),
                      child: widget.header,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: widget.items.map((item) {
                        tapPosition = item.position;
                        item.showMenu = menu;
                        return Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: double.infinity,
                            child: item,
                          ),
                        );
                      }).toList(),
                    ),
                    widget.footer,
                  ],
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeInOutQuad,
            top: menu ? MediaQuery.of(context).size.height * 0.07 : 0,
            left: menu ? MediaQuery.of(context).size.width * 0.6 : 0,
            bottom: menu ? MediaQuery.of(context).size.height * 0.07 : 0,
            right: menu ? -MediaQuery.of(context).size.width * 0.6 : 0,
            duration: Duration(milliseconds: animationDuration),
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                ),
                AnimatedPositioned(
                  top: menu ? 30 : 0,
                  bottom: menu ? 30 : 0,
                  left: 0,
                  right: -80,
                  duration: Duration(milliseconds: animationDuration),
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: animationDuration),
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(menu ? 40 : 0),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  left: menu ? 20 : 0,
                  right: menu ? -40 : 0,
                  top: 0,
                  bottom: 0,
                  duration: Duration(milliseconds: animationDuration),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (menu = true) menu = false;
                        menuButtonContoller.reverse();
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: animationDuration),
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(menu ? 40 : 0),
                      ),
                      child: SafeArea(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Theme(
                                  data: ThemeData(
                                    textTheme: TextTheme(
                                      headline6: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                  ),
                                  child: Row(
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                        icon: AnimatedIcon(
                                            icon: AnimatedIcons.menu_arrow,
                                            color: textColor,
                                            progress: menuButtonContoller),
                                        onPressed: showMenuHandle,
                                      ),
                                      if (!widget.centerTitle) widget.title,
                                      if (widget.acctions != null)
                                        Row(
                                          children: widget.acctions,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                        ),
                                    ],
                                  ),
                                ),
                                if (widget.centerTitle) widget.title,
                              ],
                            ),
                            Expanded(child: widget.body),
                          ],
                        ),
                      ),
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

  @override
  void initState() {
    super.initState();
    menuButtonContoller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
  }

  showMenuHandle() async {
    setState(() {
      menu = !menu;
    });

    if (menu) {
      menuButtonContoller.forward();
      await Future.delayed(Duration(milliseconds: 100), () {});
      for (var item in widget.items) {
        item.controller.forward();
        await Future.delayed(Duration(milliseconds: 50), () {});
      }
    } else {
      menuButtonContoller.reverse();
      widget.items.forEach((element) {
        element.controller.reverse();
      });
    }
    // setState(() {});
  }
}

// ignore: must_be_immutable
class SlideMenuItem extends StatefulWidget {
  SlideMenuItem(
      {this.icon,
      @required this.title,
      @required this.onTap,
      this.onLongPress,
      Key key})
      : super(key: key);
  final Widget icon;
  final String title;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  bool showMenu;
  AnimationController controller;
  Offset position;

  @override
  _SlideMenuItemState createState() => _SlideMenuItemState();
}

class _SlideMenuItemState extends State<SlideMenuItem>
    with SingleTickerProviderStateMixin {
  Animation<Offset> animation;
  Offset position;

  @override
  void initState() {
    super.initState();
    widget.controller =
        AnimationController(duration: Duration(milliseconds: 150), vsync: this);
    animation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset.zero,
    ).animate(widget.controller);
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: GestureDetector(
        onTapDown: (detail) {
          widget.position = detail.globalPosition;
        },
        child: FlatButton(
          onPressed: () {
            widget.onTap();
            widget.showMenu = false;
          },
          onLongPress: widget.onLongPress,
          child: Theme(
            data: ThemeData(
              iconTheme: IconThemeData(size: 28, color: Colors.white),
            ),
            child: Row(
              children: [
                widget.icon,
                SizedBox(width: 10),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }
}

List<SlideMenuItem> menuItems = [
  new SlideMenuItem(
    icon: Icon(Icons.home),
    title: 'Home',
    onTap: () {
      Get.offNamed(Routes.HOME);
    },
  ),
  new SlideMenuItem(
    icon: Icon(Icons.home_repair_service),
    title: 'Clients',
    onTap: () {
      Get.offNamed(Routes.CLIENTS);
    },
  ),
  new SlideMenuItem(
    icon: Icon(Icons.calendar_today),
    title: 'Calendar',
    onTap: () {
      Get.offNamed(Routes.CALENDAR);
    },
  ),
  new SlideMenuItem(
    icon: Icon(Icons.analytics),
    title: 'Analysis',
    onTap: () {
      Get.offNamed(Routes.ANALYSIS);
    },
  ),
  new SlideMenuItem(
    icon: Icon(Icons.contact_support),
    title: 'Support',
    onTap: () {
      Get.offNamed(Routes.SUPPORT);
    },
  ),
];
