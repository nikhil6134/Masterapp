import 'package:flutter/material.dart';
import 'package:masterapp/Screens/gst_profile_screen.dart';
import 'package:masterapp/constants.dart';

class Search extends StatefulWidget {
  const Search({
    Key? key,
    required GlobalKey<FormState> formkey,
  })  : _formkey = formkey,
        super(key: key);

  final GlobalKey<FormState> _formkey;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final inputcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Form(
            key: widget._formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Enter GST Number",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 8,
                ),
                builSearchField(inputcontroller),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    if (widget._formkey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  GstProfileScreen(id: inputcontroller.text)));
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kPrimarycolor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Center(
                        child: Text(
                          "Search",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}

TextFormField builSearchField(TextEditingController inputcontroller) {
  return TextFormField(
    controller: inputcontroller,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return "Please Enter GST Number";
      } else if (value.length != 15) {
        return "Please Enter a Valid GST Number";
      }
      return null;
    },
    decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFf2f2f2),
        hintText: "Ex: 07AACDM9910O1ZP",
        hintStyle: TextStyle(color: Colors.grey)),
  );
}
