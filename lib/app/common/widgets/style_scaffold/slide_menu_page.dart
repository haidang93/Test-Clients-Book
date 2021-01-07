part of menu_scaffold;

class _SlideMenuPage extends StatefulWidget {
  _SlideMenuPage({
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
  final List<MenuItem> items;
  final Widget header;
  final Widget footer;
  final Widget body;
  final List<Widget> acctions;
  final Color color;

  @override
  _SlideMenuPageState createState() => _SlideMenuPageState();
}

class _SlideMenuPageState extends State<_SlideMenuPage>
    with TickerProviderStateMixin {
  bool menu = false;
  bool pageZoomer = false;
  bool startAnimation = false;
  int animationDuration = 300;
  Animation<double> menuButtonAnimation;
  AnimationController menuButtonContoller;
  Offset tapPosition = Offset(0, 0);
  List<SlideMenuItem> items;

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
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: double.infinity, child: widget.header),
                    ),
                    Expanded(
                      child: Container(
                        child: Center(
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: items.map((item) {
                                  // item.position = tapPosition;
                                  return Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: double.infinity,
                                      child: item,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      alignment: Alignment.centerLeft,
                      child: Container(
                          width: double.infinity, child: widget.footer),
                    ),
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
                    onTap: hideMenu,
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
                                        onPressed: menuButtonHandle,
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
          AnimatedPositioned(
            duration: Duration(milliseconds: startAnimation ? 300 : 0),
            top: startAnimation ? 0 : tapPosition.dy,
            left: startAnimation ? 0 : 20,
            child: Visibility(
              visible: pageZoomer,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOutQuint,
                height:
                    startAnimation ? MediaQuery.of(context).size.height : 40,
                width: startAnimation
                    ? MediaQuery.of(context).size.width
                    : MediaQuery.of(context).size.width * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(startAnimation ? 0 : 100),
                ),
              ),
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
    items = widget.items
        .map((e) => SlideMenuItem(
              onLongPress: e.onLongPress,
              onTap: e.onTap,
              title: e.title,
              icon: e.icon,
              hideMenu: hideMenu,
              position: tapPosition,
              pageTransition: pageTransiton,
              route: e.route,
            ))
        .toList();
  }

  Future pageTransiton(Offset passPosition) async {
    tapPosition = passPosition;
    setState(() {
      pageZoomer = true;
    });
    Future.delayed(Duration(milliseconds: 100), () {
      setState(() {
        startAnimation = true;
      });
    });
  }

  Future hideMenu() async {
    setState(() {
      if (menu = true) menu = false;
    });
    menuButtonContoller.reverse();
    items.forEach((element) async {
      element.controller.reverse();
    });
  }

  Future menuButtonHandle() async {
    setState(() {
      menu = !menu;
    });

    if (menu) {
      menuButtonContoller.forward();
      await Future.delayed(Duration(milliseconds: 100), () {});
      for (var item in items) {
        item.controller.forward();
        await Future.delayed(Duration(milliseconds: 50), () {});
      }
    } else {
      menuButtonContoller.reverse();
      items.forEach((element) {
        element.controller.reverse();
      });
    }
  }
}
