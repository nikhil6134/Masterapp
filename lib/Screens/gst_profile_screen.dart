import 'package:flutter/material.dart';
import 'package:masterapp/constants.dart';
import 'package:masterapp/providers/profile_provider.dart';
import 'package:masterapp/widgets/first_tile.dart';
import 'package:masterapp/widgets/row_tile.dart';
import 'package:provider/provider.dart';

class GstProfileScreen extends StatefulWidget {
  const GstProfileScreen({Key? key, required this.id}) : super(key: key);
  static const routename = "/gst-profile";
  final String id;

  @override
  _GstProfileScreenState createState() => _GstProfileScreenState();
}

class _GstProfileScreenState extends State<GstProfileScreen> {
  Map<String, dynamic> loadprofile = {};
  bool _isInit = true;
  bool _isloading = false;
  bool iserror = true;
  bool isNull = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      {}
      setState(() {
        _isloading = true;
      });

      Provider.of<Profiles>(context).fetchandsetprofiles(widget.id).then((_) {
        setState(() {
          _isloading = false;
          iserror = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final profiledata = Provider.of<Profiles>(context);
    final profiles = profiledata.profiles;
    Future.delayed(const Duration(milliseconds: 9000), () {
      if (iserror == true) {
        setState(() {
          _isloading = false;
          isNull = true;
        });
      }
    });
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return isNull
        ? Scaffold(
            body: Container(
              child: Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: height * 0.5,
                  ),
                  Text(
                    "NOT FOUND!! AN ERROR OCCURED!!",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      decoration: BoxDecoration(
                          color: kPrimarycolor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          "Try Again",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                ],
              )),
            ),
          )
        : _isloading
            ? Scaffold(
                body: Container(
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(kPrimarycolor),
                    ),
                  ),
                ),
              )
            : Scaffold(
                backgroundColor: kbacgroundcolor1,
                appBar: AppBar(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                  ),
                  centerTitle: true,
                  bottom: PreferredSize(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    )),
                                SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  "GST Profile",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.white),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "GSTIN of the Tax Payer",
                              style: TextStyle(color: Colors.white60),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              widget.id,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Text(
                              profiles['name'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              width: width * 0.25,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: kPrimarycolor),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      profiles['status'],
                                      style: TextStyle(
                                          color: kPrimarycolor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                    preferredSize: Size.fromHeight(height * 0.22),
                  ),
                ),
                body: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
                  child: SafeArea(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          FirstTile(),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RowTile(
                                text1: "State Jurisdiction",
                                text2: "Ward 74",
                              ),
                              RowTile(
                                text1: "Centre Jurisdiction",
                                text2: "RANGE-139",
                              ),
                              RowTile(
                                text1: "Taxpayer Type",
                                text2: profiles['taxpayertype'],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Constitution of Business",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  profiles['businesstype'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date of Registration",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  profiles['date'],
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: kPrimarycolor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      "Get Return Filing Status",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
  }
}
