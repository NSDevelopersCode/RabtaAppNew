import 'package:flutter/material.dart';
import 'package:raabta/utils/media_query.dart';

class TextFieldAndButton extends StatefulWidget {
  const TextFieldAndButton({
    super.key,
    required this.controller,
    this.isloading = false,
    required this.onpressed,
    required this.hintcolor,
    required this.bordercolor,
    this.image,
    required this.hint,
    required this.label,
    this.inputType,
  });
  final TextEditingController controller;
  final VoidCallback onpressed;
  final Color? hintcolor;
  final Color? bordercolor;
  final String hint;
  final bool isloading;
  final String? image;
  final TextInputType? inputType;
  final String label;

  @override
  State<TextFieldAndButton> createState() => _TextFieldAndButtonState();
}

class _TextFieldAndButtonState extends State<TextFieldAndButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        children: [
          SizedBox(
            width: screenwidth(context) * 0.65,
            child: TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter Valid Input";
                }
                return null;
              },
              // onSaved:(newValue) => widget.onSaved,
              // style: const TextStyle(color: Colors.white),
              onTapOutside: (event) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              controller: widget.controller,
              keyboardType: widget.inputType,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                      child: widget.image != null
                          ? Image.asset(
                              widget.image!,
                              height: 10,
                              width: 10,
                            )
                          : const Icon(
                              Icons.search,
                              color: Colors.grey,
                            )),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(width: 1, color: widget.bordercolor!),
                ),
                label: Text(widget.label),
                labelStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                hintText: widget.hint,
                hintStyle: TextStyle(color: widget.hintcolor),
                // enabledBorder: OutlineInputBorder(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(width: 2),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: widget.onpressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: widget.isloading
                    ? const Center(
                        child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator.adaptive(
                              strokeWidth: 2,
                              backgroundColor: Colors.white,
                            )),
                      )
                    : const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
