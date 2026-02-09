import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime)? onSubmit;

  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

  final _valueController = TextEditingController();
  DateTime? _selectedDate =DateTime.now();

  _submitForm() {

      final title = _titleController.text;
      final value = double.tryParse(_valueController.text) ?? 0.0;

      if(title.isEmpty || value <= 0 || _selectedDate == null){
        return;
      }

      widget.onSubmit?.call(title, value,_selectedDate!);
      Navigator.of(context).pop();
  }

  _showDatepicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Theme.of(context).colorScheme.primary, // header
              onPrimary: Colors.white, // texto do header
              surface: Colors.white, // fundo do calendário
              onSurface: Colors.black, // texto dos dias
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).colorScheme.primary, // OK/Cancel
              ),
            ),
          ),
          child: child!,
        );
      },
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: _valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),

            Container(
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        _selectedDate == null ? 'nenhuma data seleciona '
                      : 'Data secionada: ${DateFormat('dd/Mm/yy').format(_selectedDate!)}',
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    child: Text(
                      'selecionar data',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: _showDatepicker,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: Text('Nova Transação'),

                  onPressed: _submitForm,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
