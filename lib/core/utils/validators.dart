String? validateEmail(String? email) {
  if (email == null || !email.contains('@')) return 'Enter valid email';
  return null;
}
