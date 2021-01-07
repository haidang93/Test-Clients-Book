part of menu_scaffold;

List<MenuItem> menuItems = [
  new MenuItem(
    icon: Icon(Icons.home),
    title: 'Home',
    onTap: () {
      // Get.offNamed(Routes.HOME);
    },
    route: Routes.HOME,
  ),
  new MenuItem(
    icon: Icon(Icons.home_repair_service),
    title: 'Clients',
    onTap: () {
      // Get.offNamed(Routes.CLIENTS);
    },
    route: Routes.CLIENTS,
  ),
  new MenuItem(
    icon: Icon(Icons.design_services),
    title: 'My Services',
    onTap: () {
      // Get.offNamed(Routes.CLIENTS);
    },
    route: Routes.MY_SERVICES,
  ),
  new MenuItem(
    icon: Stack(
      alignment: Alignment.center,
      children: [
        Icon(Icons.calendar_today),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            DateTime.now().day.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    title: 'Calendar',
    onTap: () {
      // Get.offNamed(Routes.CALENDAR);
    },
    route: Routes.CALENDAR,
  ),
  new MenuItem(
    icon: Icon(Icons.analytics),
    title: 'Analysis',
    onTap: () {
      // Get.offNamed(Routes.ANALYSIS);
    },
    route: Routes.ANALYSIS,
  ),
  new MenuItem(
    icon: Icon(Icons.contact_support),
    title: 'Support',
    onTap: () {
      // Get.offNamed(Routes.SUPPORT);
    },
    route: Routes.SUPPORT,
  ),
];
