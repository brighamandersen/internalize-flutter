import 'package:flutter/material.dart';
import 'package:fly/models/passage_model.dart';
import 'package:fly/passage_provider.dart';
import 'package:fly/routes.dart';
import 'package:fly/utils.dart';
import 'package:fly/widgets/confirm_delete_dialog.dart';
import 'package:provider/provider.dart';

enum AmountToShow { none, firstLetters, full }

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  AmountToShow _amountToShow = AmountToShow.full;

  @override
  Widget build(BuildContext context) {
    final Passage passage =
        ModalRoute.of(context)?.settings.arguments as Passage;

    String textToDisplay = '';
    switch (_amountToShow) {
      case AmountToShow.none:
        textToDisplay = Utils.convertTextToBlanks(passage.body);
        break;
      case AmountToShow.firstLetters:
        textToDisplay = Utils.convertTextToBlanksBesidesFirstLetters(
          passage.body,
        );
        break;
      case AmountToShow.full:
        textToDisplay = passage.body;
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(passage.title, style: const TextStyle(fontSize: 24)),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  value: 'Edit',
                  child: Row(
                    children: const [
                      Icon(Icons.edit),
                      SizedBox(width: 8),
                      Text('Edit'),
                    ],
                  ),
                  onTap: () => _onEditIconPress(context, passage),
                ),
                PopupMenuItem(
                  value: 'Delete',
                  child: Row(
                    children: const [
                      Icon(Icons.delete),
                      SizedBox(width: 8),
                      Text('Delete'),
                    ],
                  ),
                  onTap: () => _onDeleteIconPress(context, passage),
                ),
              ];
            },
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  textToDisplay,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<AmountToShow>(
                showSelectedIcon: false,
                segments: const [
                  ButtonSegment(
                    value: AmountToShow.none,
                    label: Text('None', style: TextStyle(fontSize: 16)),
                  ),
                  ButtonSegment(
                    value: AmountToShow.firstLetters,
                    label: Text('Some', style: TextStyle(fontSize: 16)),
                  ),
                  ButtonSegment(
                    value: AmountToShow.full,
                    label: Text('All', style: TextStyle(fontSize: 16)),
                  ),
                ],
                selected: {_amountToShow},
                onSelectionChanged: (newSelection) {
                  setState(() {
                    _amountToShow = newSelection.first;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onEditIconPress(BuildContext context, Passage passage) {
    Navigator.pushReplacementNamed(
      context,
      Routes.editPassage,
      arguments: passage,
    );
  }

  void _onDeleteIconPress(BuildContext context, Passage passage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDeleteDialog(
          passage: passage,
          onConfirm: () {
            _onConfirmDeletePress(context, passage);
          },
        );
      },
    );
  }

  void _onConfirmDeletePress(BuildContext context, Passage passage) {
    context.read<PassageProvider>().deletePassage(passage.id);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Passage deleted')));
    Navigator.pop(context); // Close screen
  }
}
