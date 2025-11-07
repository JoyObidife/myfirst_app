import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirst_app/model/user_detail.dart';
import 'package:myfirst_app/pages/notification_page.dart';
import 'package:myfirst_app/pages/payment_methods.dart';
import 'package:myfirst_app/pages/personal_information.dart';
import 'package:myfirst_app/provider/user_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildonprofilepics(),
          _builddetails(),
          SizedBox(height: 16,),

          _buildaccountsection(),
          SizedBox(height: 16,),

          _buildSupportSection(),
          SizedBox(height: 16,),
ElevatedButton.icon(
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.red.shade100,
    foregroundColor: Colors.red.shade900,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  onPressed: () {},
  icon: Icon(Icons.logout),
  label: Text("Logout"),
),
        
        ]
      )
      );
    
    
  }

  Column _buildSupportSection() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Support",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            ListTile(
              title: Text(
                "About Us",
                style: TextStyle(fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
            ),

            Divider(),
            ListTile(
              title: Text(
                "Contact Us",
                style: TextStyle(fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
            ),

            
          ],
        );
  }

  Column _buildaccountsection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Account",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                return PersonalInformation();

              },

              ),
            );
          },
          title: Text("Personal information", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),

        Divider(),

        ListTile(
          onTap: () {
            Navigator.of(context).push(
MaterialPageRoute(builder: (contex){
  return PaymentMethods();

}
            )
            );
        },
          title: Text("Payment Methods", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
    
        Divider(),

        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context){
                return NotificationPage();


              })
            );
        },
          title: Text("Notifications", style: TextStyle(fontSize: 16)),
          trailing: Icon(Icons.arrow_forward_ios_outlined, size: 16),
        ),
      ],
    );
  }

  Widget _buildonprofilepics() {
     UserDetail? user = BlocProvider.of<UserCubit>(context).state;
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle),
      clipBehavior: Clip.hardEdge,
      child: Image.network(user!.profilePicture, width: 100, height: 100),
    );
  }

  Widget _builddetails() {
      UserDetail? user = BlocProvider.of<UserCubit>(context).state;

    if(user == null) return Text("User Details not set");

    return Column(
      children: [
        Text(
          user.name,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        Text(
          user.email,
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),
        ),
      ],
    );
  }
}
