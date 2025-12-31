import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../gen/colors.gen.dart';
import '../../styleguide/typography.dart';



class CustomTextField extends TextField {
  final TextEditingController textController;

  const CustomTextField(this.textController, {super.key}) : super(controller: textController);

  static TextField textFieldSingle(TextEditingController controller,
      {String? hintText,
        TextInputType? keyboardType,
        int? minLine,
        int? maxLine,
        Widget? prefix,
        List<TextInputFormatter>? inputFormatters,ValueChanged<String>? onChanged}) {
    return TextField(
      controller: controller,
      onChanged:onChanged,
      textInputAction: TextInputAction.done,
      keyboardType: keyboardType ?? TextInputType.name,
      minLines: minLine,
      maxLines: maxLine,
      style: placeholder.w400.copyWith(color: ColorName.black),
      inputFormatters:inputFormatters,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(top: 8, left: 20, right: 20),
        hintText: hintText,
        prefixIcon: prefix,
        hintStyle:
        placeholder.w400.copyWith(color: ColorName.black.withOpacity(0.2)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: ColorName.border),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(width: 0.5, color: ColorName.border),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(width: 0.5, color: ColorName.border), //<-- SEE HERE
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
