String capitalize(String value) {
  if (value != null && !value.isEmpty) {
    return "${value[0].toUpperCase()}${value.substring(1)}";
  }

  return value; 
}