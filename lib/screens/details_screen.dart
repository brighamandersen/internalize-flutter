import 'package:flutter/material.dart';
import 'package:fly/models/passage_model.dart';
import 'package:fly/passage_provider.dart';
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
  AmountToShow _amountToShow = AmountToShow.none;

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
        title: Text(passage.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog(context, passage);
            },
            tooltip: 'Delete Passage',
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(textToDisplay, style: const TextStyle(fontSize: 18)),
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
                    label: Text('Blanks'),
                  ),
                  ButtonSegment(
                    value: AmountToShow.firstLetters,
                    label: Text('First Letters'),
                  ),
                  ButtonSegment(
                    value: AmountToShow.full,
                    label: Text('Full Text'),
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

  void _showDeleteConfirmationDialog(BuildContext context, Passage passage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ConfirmDeleteDialog(
          passage: passage,
          onConfirm: () {
            _deletePassage(context, passage);
          },
        );
      },
    );
  }

  void _deletePassage(BuildContext context, Passage passage) {
    context.read<PassageProvider>().deletePassage(passage.id);
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Passage deleted')));
    Navigator.pop(context); // Close screen
  }
}
