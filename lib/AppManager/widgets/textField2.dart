
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grocery/AppManager/appUtils.dart';



class MyTextField2 extends StatefulWidget {

  final String hintText;
  final Widget suffixIcon;
  final Icon prefixIcon;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final int maxLine;
  final int maxLength;
  final bool isPasswordField;
  final bool enabled;
  final String prefixText;
  final TextAlign textAlign;
  final TextInputType keyboardType;
  final InputDecoration decoration;
  final ValueChanged onChanged;

  const MyTextField2({Key key, this.hintText, this.controller,
    this.isPasswordField,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLength,
    this.enabled,
    this.textAlign,
    this.keyboardType,
    this.decoration,
    this.prefixText,
    this.onChanged,
    this.maxLine}) : super(key: key);

  @override
  _MyTextField2State createState() => _MyTextField2State();
}

class _MyTextField2State extends State<MyTextField2> {

  bool obscure=false;

  App app=App();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.isPasswordField??false){
      obscure=widget.isPasswordField;
      setState(() {

      });
    }
  }





  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextFormField(
        onTap: (){

        },
          enabled: widget.enabled??true,
          controller: widget.controller,
          minLines: 1,
          maxLines: widget.maxLine?? 1,
          obscureText: widget.isPasswordField==null? false:obscure,
          maxLength: widget.maxLength??null,
          textAlign: widget.textAlign?? TextAlign.start,
          keyboardType: widget.keyboardType?? null,
          onChanged: widget.onChanged==null? null:(val){
            widget.onChanged(val);
          },
          style: TextStyle(
              fontSize: 15,

          ),
          decoration: widget.decoration??InputDecoration(
            filled: true,
            counterText: '',
            prefixText: widget.prefixText,
            //contentPadding: widget.isPasswordField==null? EdgeInsets.all(5):widget.isPasswordField? EdgeInsets.fromLTRB(5,5,5,5):EdgeInsets.all(5),
            contentPadding: EdgeInsets.all(5),
            hintText: widget.hintText??null,
            hintStyle: TextStyle(
                fontSize: 15,
            ),
            errorStyle: TextStyle(
                fontSize: 12,
            ),
            prefixIcon: widget.prefixIcon??null,
            suffixIcon:  (widget.isPasswordField==null || widget.isPasswordField==false)? widget.suffixIcon??null:IconButton(
              splashRadius: 5,
              icon: obscure? Icon(Icons.visibility_off,
                color: Colors.white,)
                  : Icon(Icons.visibility,
                color: Colors.white,),
              onPressed: (){
                setState(() {
                  obscure=!obscure;
                });

              },),
            fillColor: Colors.white,

            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                  color: Colors.red,
                  width: 1
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                  color: Colors.grey,
                  width: 1
              ),
            ),
          ),
          validator: widget.validator??null
      ),
    );
  }
}


