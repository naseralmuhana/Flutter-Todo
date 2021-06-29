class Validator {
  final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

  String? validName(value) {
    if (value == null || value.isEmpty) {
      return 'Required Field.';
    }
    return null;
  }

  String? validEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Required Field.';
    } else if (!emailRegex.hasMatch(value)) {
      return 'Please enter valid email address.';
    }
    return null;
  }

  String? validPassword(value) {
    if (value == null || value.isEmpty) {
      return 'Required Field.';
    } else if (value!.length < 6) {
      return 'Please enter more than 6 characters.';
    }
    return null;
  }

  String? validConfirmPassword(value, passwordFieldKey) {
    if (value!.isEmpty) {
      return 'Required Field.';
    } else if (value != passwordFieldKey.currentState!.value) {
      return 'Password do not match.';
    }
    return null;
  }
}
