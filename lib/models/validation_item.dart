class ValidationItem {
  String value;
  String error;

  ValidationItem({this.value, this.error});

  bool isValid(){
    return (value != null && value.isNotEmpty && error == null);
  }
}
