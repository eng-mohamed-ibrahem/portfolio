enum Routes {
  home("/", "home"),
  works("/works", "works"),
  contact("/contact", "contact");

  final String path;
  final String name;

  const Routes(this.path, this.name);
}
