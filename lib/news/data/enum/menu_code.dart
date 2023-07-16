enum MenuCode {
  entertainment,
  technology,
  lifestyle,
}

String getMenuCode(MenuCode menuCode) {
  switch (menuCode) {
    case MenuCode.entertainment:
      return "Entertainment";
    case MenuCode.technology:
      return "Technology";
    case MenuCode.lifestyle:
      return "Lifestyle";
    default:
      return "";
  }
}
