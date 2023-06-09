import 'package:employee_persona_api/view/widgets/detailsdialogbox.dart';
import 'package:flutter/material.dart';

import '../../model/usermodel.dart';

class CardTileWidget extends StatelessWidget {
  final UserModel user;
  const CardTileWidget({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      elevation: 10.0,
      color: Colors.deepOrange.shade100,
      shadowColor: Colors.deepOrange,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Emp.ID'),
              Text(
                user.id.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          title: Text(
            'Name: ${user.name}',
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold,),
          ),
          subtitle: Text(
            'Username: ${user.username}',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black54),
          ),
          trailing: IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return DetailsDialogBoxWidget(user: user,);
                },
              );
            },
            icon: const Icon(
              Icons.info,
            ),
          ),
        ),
      ),
    );
  }
}

