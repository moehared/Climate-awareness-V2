class DialogRequest {
  final String title;
  final String description;
  final String buttonTitle;
  String? cancelText;

  DialogRequest({
    required this.title,
    required this.description,
    required this.buttonTitle,
    this.cancelText,
  });
}

class DialogResponse {
  String? fieldOne;
  String? fieldTwo;
  bool confirmed;

  DialogResponse({
    this.fieldOne,
    this.fieldTwo,
    this.confirmed = false,
  });
}
