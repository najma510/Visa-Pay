import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:VisaPay/components/alertDialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;
final firestoreUser = Firestore.instance.collection('users');

class LocateMerchantScreen extends StatefulWidget {
  @override
  _LocateMerchantScreenState createState() => _LocateMerchantScreenState();
}

class Post {
  final String name;
  final String address;
  Post(this.name, this.address);
}

class _LocateMerchantScreenState extends State<LocateMerchantScreen> {
  String messageText;
  String email = ' ';
  String name = ' ';

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        final DocumentSnapshot doc =
            await firestoreUser.document(loggedInUser.email).get();

        setState(() {
          email = doc.data['email'];
          name = doc.data['name'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> onBackPressed() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog(context);
      },
    );
  }

  Future<List<Post>> search(String search) async {
    await Future.delayed(Duration(seconds: 1));
    return List.generate(search.length, (int index) {
      return Post("Name : $search $index", "Address: $search - $index km");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('images/map.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: null,
          title: Text(
            'VisaPay',
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: SearchBar<Post>(
              cancellationWidget: Text(
                "Cancel",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w500,
                ),
              ),
              searchBarStyle: SearchBarStyle(
                backgroundColor: Colors.white,
              ),
              onSearch: search,
              icon: Icon(
                Icons.list,
                color: Colors.black,
              ),
              hintText: "Search Merchant...",
              onItemFound: (Post post, int index) {
                return Card(
                  color: Colors.white60,
                  elevation: 15,
                  child: ListTile(
                    leading: Icon(
                      Icons.fastfood,
                      color: Colors.black,
                    ),
                    title: Text(
                      post.name,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      post.address,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, 'place_order');
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
