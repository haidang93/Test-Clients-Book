part of menu_scaffold;

class MenuItem {
  MenuItem({
    this.icon,
    this.title,
    this.onTap,
    this.onLongPress,
    this.route,
  });
  final Widget icon;
  final String title;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final String route;
}

class SlideMenuItem extends StatefulWidget {
  SlideMenuItem({
    this.icon,
    this.title,
    this.onTap,
    this.route,
    this.onLongPress,
    Key key,
    this.hideMenu,
    this.position,
    this.pageTransition,
  }) : super(key: key);
  final Widget icon;
  final String title;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final Function hideMenu;
  final Function pageTransition;
  final String route;
  AnimationController controller;
  Offset position;

  @override
  _SlideMenuItemState createState() => _SlideMenuItemState();
}

class _SlideMenuItemState extends State<SlideMenuItem>
    with SingleTickerProviderStateMixin {
  Animation<Offset> animation;
  GlobalKey key = GlobalKey();
  // Offset position;

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
          key: key,
          onPressed: () async {
            RenderBox renderBox = key.currentContext.findRenderObject();
            widget.position = renderBox.localToGlobal(Offset.zero);
            // log(widget.position.dy.toString());
            if (Get.currentRoute == widget.route) {
              await widget.hideMenu();
            } else {
              await widget.pageTransition(widget.position);
              widget.onTap();
              Future.delayed(Duration(milliseconds: 500), () {
                Get.offNamed(widget.route);
              });
            }
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
