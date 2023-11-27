class GoPaths {
  static const home = '/';
  static const componentsView = '/components';
  static  componentDetail({String? id}) => '/components/${id ?? ':id'}';
}
