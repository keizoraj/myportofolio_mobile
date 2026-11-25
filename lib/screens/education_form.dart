import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
  const EducationFormPage({super.key});

  @override
  State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk setiap input
  final TextEditingController _institutionController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _majorController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  DateTime? _startDate;
  DateTime? _endDate;

  // Mengubah DateTime menjadi format dd/mm/yyyy
  String _formatDate(DateTime date) {
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final year = date.year.toString();

    return '$day/$month/$year';
  }

  // Menampilkan date picker
  Future<void> _selectDate({required bool isStartDate}) async {
    FocusScope.of(context).unfocus();

    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: isStartDate
          ? (_startDate ?? DateTime.now())
          : (_endDate ?? _startDate ?? DateTime.now()),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      helpText: isStartDate ? 'Select Start Date' : 'Select End Date',
    );

    if (selectedDate != null) {
      setState(() {
        if (isStartDate) {
          _startDate = selectedDate;
          _startDateController.text = _formatDate(selectedDate);

          // Hapus tanggal selesai jika lebih awal dari tanggal mulai
          if (_endDate != null && _endDate!.isBefore(_startDate!)) {
            _endDate = null;
            _endDateController.clear();
          }
        } else {
          _endDate = selectedDate;
          _endDateController.text = _formatDate(selectedDate);
        }
      });
    }
  }

  // Menampilkan dialog ringkasan data
  void _saveEducation() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext dialogContext) {
          return AlertDialog(
            title: const Text('Education successfully added!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Institution: ${_institutionController.text.trim()}'),
                  const SizedBox(height: 8),
                  Text('Degree: ${_degreeController.text.trim()}'),
                  const SizedBox(height: 8),
                  Text('Major: ${_majorController.text.trim()}'),
                  const SizedBox(height: 8),
                  Text('Start Date: ${_startDateController.text}'),
                  const SizedBox(height: 8),
                  Text('End Date: ${_endDateController.text}'),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _institutionController.dispose();
    _degreeController.dispose();
    _majorController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Education Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),

      drawer: const LeftDrawer(),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // === Institution ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _institutionController,
                  decoration: InputDecoration(
                    hintText: 'Contoh: Universitas Indonesia',
                    labelText: 'Institution Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Institution name cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),

              // === Degree ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _degreeController,
                  decoration: InputDecoration(
                    hintText: 'Contoh: Bachelor Degree',
                    labelText: 'Degree',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Degree cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),

              // === Major ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _majorController,
                  decoration: InputDecoration(
                    hintText: 'Contoh: Information Systems',
                    labelText: 'Major',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Major cannot be empty!';
                    }
                    return null;
                  },
                ),
              ),

              // === Start Date ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _startDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Select start date',
                    labelText: 'Start Date',
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onTap: () {
                    _selectDate(isStartDate: true);
                  },
                  validator: (String? value) {
                    if (_startDate == null) {
                      return 'Start date must be selected!';
                    }
                    return null;
                  },
                ),
              ),

              // === End Date ===
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _endDateController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: 'Select end date',
                    labelText: 'End Date',
                    suffixIcon: const Icon(Icons.calendar_today),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onTap: () {
                    _selectDate(isStartDate: false);
                  },
                  validator: (String? value) {
                    if (_endDate == null) {
                      return 'End date must be selected!';
                    }

                    if (_startDate != null && _endDate!.isBefore(_startDate!)) {
                      return 'End date cannot be before start date!';
                    }

                    return null;
                  },
                ),
              ),

              // === Tombol Simpan ===
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    onPressed: _saveEducation,
                    child: const Text('Save'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
