enum Routes {
  /// Routes in same orders as [Routes.values]
  home("/", "home"),
  works("/works", "works"),
  contact("/contact", "contact"),

  /// can be any routes after
  workDetails("/:id", "work_details");

  final String path;
  final String name;

  const Routes(this.path, this.name);
}
