import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providert_stmng/provider/usr_provider.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<UserProvider>().fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('API calling'),
      ),
      body: SafeArea(
        child: userProvider.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    leading:
                        Text(userProvider.allUserList[index].id.toString()),
                    title:
                        Text(userProvider.allUserList[index].name.toString()),
                    subtitle: Text(
                        userProvider.allUserList[index].company.toString()),
                  );
                },
                itemCount: userProvider.allUserList.length,
              ),
      ),
    );
  }
}
