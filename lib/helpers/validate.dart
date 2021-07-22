dynamic isRequired(fieldName, value) {
  if (value == null || value.isEmpty) {
    return "${fieldName} is required.";
  }

  return null;
}

dynamic isEmail(fieldName, value) {
  if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)) {
    return "${fieldName} is invalid email.";
  }

  return null;
}

dynamic validatePassword(fieldName, value) {
  if (value == null || value.isEmpty) {
    return "${fieldName} is required.";
  }

  if (value.length < 6 || value.length > 32) {
    return "${fieldName} must be greater than 6 and less than 32 characters.";
  }

  return null;
}