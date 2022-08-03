class NavBar {
  final String path;
  final String name;
  const NavBar({required this.path,required this.name});
}

const itemsNavBar = [
  NavBar(name: 'Home',path: 'assets/icons/Home-icon.svg' ),
  NavBar(name: 'Favorites',path: 'assets/icons/favorite-svgrepo-com.svg' ),
  NavBar(name: 'Profile',path: 'assets/icons/profile-svgrepo-com.svg' ),
];