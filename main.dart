void main() {
  String? name;
  name ??= 'min';
  name = null;
  name ??= 'another';
  print(name);
}
