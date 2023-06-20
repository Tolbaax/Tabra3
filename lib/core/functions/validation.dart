class Validators {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'الاسم لا يمكن أن يكون فارغًا';
    }

    if (value.length < 3) {
      return 'يجب أن يتكون الاسم من ثلاثة أحرف على الأقل';
    } else if (value.length > 30) {
      return 'لا يمكن أن يتجاوز الاسم 30 حرفًا';
    }

    return null;
  }

  static String? validateAge(String value) {
    if (value.isEmpty) {
      return 'العمر لا يمكن أن يكون فارغًا';
    }

    if (value.length < 1) {
      return 'يجب أن يتكون العمر من رقم ع الاقل';
    } else if (value.length > 30) {
      return 'لا يمكن أن يتجاوز العمر 3 رقم';
    }
    return null;
  }

  static String? validateType(String value) {
    if (value.isEmpty) {
      return 'النوع لا يمكن أن يكون فارغًا';
    }

    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'البريد الإلكتروني لا يمكن أن يكون فارغًا';
    }
    final RegExp emailRegex = RegExp(r'^[\w.-]+@[\w-]+(\.[\w-]+)*\.[\w-]{2,}$');

    if (!emailRegex.hasMatch(value)) {
      return 'يرجى إدخال عنوان بريد إلكتروني صالح';
    }

    // Check if the value contains spaces
    if (value.contains(' ')) {
      return 'عنوان البريد الإلكتروني لا يمكن أن يحتوي على مسافات';
    }

    // Check if the value has a valid domain name
    final List<String> valueParts = value.split('@');
    if (valueParts.length != 2) {
      return 'يرجى إدخال عنوان بريد إلكتروني صالح';
    }
    final String domainName = valueParts[1];
    if (domainName.isEmpty || !domainName.contains('.')) {
      return 'يرجى إدخال عنوان بريد إلكتروني صالح';
    }

    // Check if the value has a valid top-level domain name
    final List<String> domainParts = domainName.split('.');
    final String tld = domainParts.last;
    if (tld.length < 2 || tld.length > 6) {
      return 'يرجى إدخال عنوان بريد إلكتروني صالح';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    if (value.length < 6) {
      return 'يجب أن تتكون كلمة المرور من ستة أحرف على الأقل';
    }

    return null;
  }
}
