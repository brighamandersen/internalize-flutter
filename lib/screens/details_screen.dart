import 'package:flutter/material.dart';
import 'package:internalize/enums.dart';
import 'package:internalize/models/passage_model.dart';
import 'package:internalize/passage_provider.dart';
import 'package:internalize/routes.dart';
import 'package:internalize/utils.dart';
import 'package:internalize/widgets/confirm_delete_dialog.dart';
import 'package:internalize/widgets/passage_not_found.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  DetailsScreenState createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  AmountToShow _amountToShow = AmountToShow.full;

  @override
  Widget build(BuildContext context) {
    final String passageId =
        ModalRoute.of(context)?.settings.arguments as String;

    return Consumer<PassageProvider>(
      builder: (context, passageProvider, child) {
        final Passage passage = passageProvider.passages.firstWhere(
          (p) => p.id == passageId,
          orElse: () => Passage(id: '', title: 'Not Found', body: 'Not Found'),
        );

        if (passage.id.isEmpty ||
            passage.title.isEmpty ||
            passage.body.isEmpty) {
          return const PassageNotFound();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(passage.title, style: const TextStyle(fontSize: 24)),
            actions: [
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    _onEditIconPress(context, passage);
                  } else if (value == 'delete') {
                    _onDeleteIconPress(context, passage);
                  }
                },
                itemBuilder:
                    (BuildContext context) => [
                      PopupMenuItem(
                        value: 'edit',
                        child: Row(
                          children: const [
                            Icon(Icons.edit),
                            SizedBox(width: 8),
                            Text('Edit', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        value: 'delete',
                        child: Row(
                          children: const [
                            Icon(Icons.delete),
                            SizedBox(width: 8),
                            Text('Delete', style: TextStyle(fontSize: 16)),
                          ],
                        ),
                      ),
                    ],
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
                      Utils.applyMaskToBody(passage.body, _amountToShow),
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
      },
    );
  }
}

void _onEditIconPress(BuildContext context, Passage passage) {
  Navigator.pushNamed(context, Routes.editPassage, arguments: passage);
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
  Navigator.pop(context);
}
