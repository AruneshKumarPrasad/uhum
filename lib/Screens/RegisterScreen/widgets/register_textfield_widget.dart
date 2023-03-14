import '../../../Barrel/app_barrel.dart';

class RegisterTextField extends StatelessWidget {
  const RegisterTextField({
    super.key,
    required TextEditingController controller,
    required this.hintText,
    required this.focus,
    this.validator,
  }) : _controller = controller;

  final TextEditingController _controller;
  final FocusNode focus;
  final String hintText;
  final Function? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      width: double.maxFinite,
      alignment: Alignment.center,
      child: TextFormField(
        focusNode: focus,
        controller: _controller,
        obscureText: hintText == '*******' ? true : false,
        validator: (value) {
          if (validator != null) {
            return validator!(value);
          }
          return null;
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          focusedErrorBorder: buildOutlineInputBorder(error: true),
          errorBorder: buildOutlineInputBorder(error: true),
          disabledBorder: buildOutlineInputBorder(),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey.shade500),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder({bool error = false}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: error ? Colors.red : Colors.grey.shade500,
        width: 2.0,
      ),
      borderRadius: const BorderRadius.all(
        Radius.circular(32.0),
      ),
    );
  }
}
