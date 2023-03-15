import '../../../Barrel/app_barrel.dart';

class ProfileInfoTextFieldWidget extends StatelessWidget {
  const ProfileInfoTextFieldWidget({
    super.key,
    required TextEditingController controller,
    required this.hintText,
  }) : _controller = controller;

  final TextEditingController _controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      textInputAction: hintText == 'Your Last Name here...'
          ? TextInputAction.done
          : TextInputAction.next,
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
