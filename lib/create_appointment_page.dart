import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'colors.dart' as color;

class CreateAppointmentPage extends StatefulWidget {
  const CreateAppointmentPage({super.key});

  @override
  State<CreateAppointmentPage> createState() => _CreateAppointmentPageState();
}

class _CreateAppointmentPageState extends State<CreateAppointmentPage> {
  String? selectedCategory;
  String? selectedService;
  DateTime? selectedDate;
  String? selectedTimeSlot;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  final List<String> categories = ['Men', 'Women', 'Children', 'Pet'];

  final Map<String, List<Map<String, dynamic>>> categoryServices = {
    'Men': [
      {'name': 'Classic Haircut', 'duration': '30 min', 'price': '₹25'},
      {'name': 'Premium Haircut', 'duration': '45 min', 'price': '₹35'},
      {'name': 'Beard Trim', 'duration': '20 min', 'price': '₹15'},
      {'name': 'Full Beard Service', 'duration': '35 min', 'price': '₹25'},
      {'name': 'Hot Towel Shave', 'duration': '40 min', 'price': '₹30'},
      {'name': 'Complete Package', 'duration': '75 min', 'price': '₹55'},
    ],
    'Women': [
      {'name': 'Haircut & Styling', 'duration': '60 min', 'price': '₹45'},
      {'name': 'Hair Coloring', 'duration': '120 min', 'price': '₹80'},
      {'name': 'Hair Treatment', 'duration': '45 min', 'price': '₹50'},
      {'name': 'Blow Dry', 'duration': '30 min', 'price': '₹25'},
      {'name': 'Manicure', 'duration': '30 min', 'price': '₹20'},
      {'name': 'Pedicure', 'duration': '45 min', 'price': '₹30'},
    ],
    'Children': [
      {'name': 'Kids Haircut', 'duration': '25 min', 'price': '₹15'},
      {'name': 'Teen Haircut', 'duration': '30 min', 'price': '₹20'},
      {'name': 'Kids Styling', 'duration': '20 min', 'price': '₹12'},
    ],
    'Pet': [
      {'name': 'Pet Bath & Grooming', 'duration': '60 min', 'price': '₹40'},
      {'name': 'Pet Haircut', 'duration': '45 min', 'price': '₹35'},
      {'name': 'Nail Trimming', 'duration': '15 min', 'price': '₹10'},
    ],
  };

  final List<String> timeSlots = [
    '09:00 AM', '09:30 AM', '10:00 AM', '10:30 AM',
    '11:00 AM', '11:30 AM', '12:00 PM', '12:30 PM',
    '02:00 PM', '02:30 PM', '03:00 PM', '03:30 PM',
    '04:00 PM', '04:30 PM', '05:00 PM', '05:30 PM',
    '06:00 PM', '06:30 PM', '07:00 PM',
  ];

  List<Map<String, dynamic>> get availableServices {
    if (selectedCategory == null) return [];
    return categoryServices[selectedCategory] ?? [];
  }

  Map<String, dynamic>? get selectedServiceDetails {
    if (selectedService == null || selectedCategory == null) return null;
    return categoryServices[selectedCategory]?.firstWhere(
          (service) => service['name'] == selectedService,
      orElse: () => {},
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 60)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: color.AppColor.gradientSecond,
              onPrimary: Colors.white,
              onSurface: color.AppColor.homePageTitle,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  bool get isFormValid {
    return selectedCategory != null &&
        selectedService != null &&
        selectedDate != null &&
        selectedTimeSlot != null &&
        nameController.text.isNotEmpty &&
        phoneController.text.isNotEmpty;
  }

  void _bookAppointment() {
    if (!isFormValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 20),
            SizedBox(width: 10),
            Text('Appointment Confirmed!', style: TextStyle(
              fontSize: 20,)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service: $selectedService', style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text('Date: ${DateFormat('EEEE, MMMM d, y').format(selectedDate!)}'),
            Text('Time: $selectedTimeSlot'),
            SizedBox(height: 5),
            Text('Name: ${nameController.text}'),
            Text('Phone: ${phoneController.text}'),
            if (notesController.text.isNotEmpty) ...[
              SizedBox(height: 5),
              Text('Notes: ${notesController.text}'),
            ],
            SizedBox(height: 10),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total:', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text(
                  selectedServiceDetails?['price'] ?? '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: color.AppColor.gradientSecond,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context); // Go back to home page
            },
            child: Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 70, left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: color.AppColor.homePageIcons,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Text(
                      "Create Appointment",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: color.AppColor.homePageTitle,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.calendar_today,
                    color: color.AppColor.gradientSecond,
                    size: 28,
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Category Selection
              Text(
                "Select Category",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: color.AppColor.homePageTitle,
                ),
              ),
              SizedBox(height: 15),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categories.map((category) {
                  bool isSelected = selectedCategory == category;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = category;
                        selectedService = null; // Reset service when category changes
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      decoration: BoxDecoration(
                        color: isSelected ? color.AppColor.gradientSecond : Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: color.AppColor.gradientSecond,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: isSelected
                                ? color.AppColor.gradientSecond.withOpacity(0.3)
                                : Colors.grey.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : color.AppColor.homePageTitle,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 30),

              // Service Selection
              if (selectedCategory != null) ...[
                Text(
                  "Select Service",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
                SizedBox(height: 15),
                ...availableServices.map((service) {
                  bool isSelected = selectedService == service['name'];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedService = service['name'];
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12),
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: isSelected ? color.AppColor.gradientSecond.withOpacity(0.1) : Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: isSelected ? color.AppColor.gradientSecond : Colors.grey.shade200,
                          width: isSelected ? 2 : 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: color.AppColor.gradientFirst.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.content_cut,
                              color: color.AppColor.gradientFirst,
                              size: 24,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  service['name'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: color.AppColor.homePageTitle,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Icon(Icons.access_time, size: 14, color: Colors.grey.shade600),
                                    SizedBox(width: 5),
                                    Text(
                                      service['duration'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Text(
                            service['price'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.gradientSecond,
                            ),
                          ),
                          if (isSelected)
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Icon(
                                Icons.check_circle,
                                color: color.AppColor.gradientSecond,
                                size: 24,
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                SizedBox(height: 30),
              ],

              // Date Selection
              if (selectedService != null) ...[
                Text(
                  "Select Date",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
                SizedBox(height: 15),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: selectedDate != null ? color.AppColor.gradientSecond : Colors.grey.shade300,
                        width: selectedDate != null ? 2 : 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: color.AppColor.gradientSecond,
                          size: 24,
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            selectedDate != null
                                ? DateFormat('EEEE, MMMM d, y').format(selectedDate!)
                                : 'Choose a date',
                            style: TextStyle(
                              fontSize: 16,
                              color: selectedDate != null
                                  ? color.AppColor.homePageTitle
                                  : Colors.grey.shade600,
                              fontWeight: selectedDate != null ? FontWeight.w600 : FontWeight.normal,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],

              // Time Slot Selection
              if (selectedDate != null) ...[
                Text(
                  "Select Time Slot",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
                SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: timeSlots.map((slot) {
                    bool isSelected = selectedTimeSlot == slot;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTimeSlot = slot;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        decoration: BoxDecoration(
                          color: isSelected ? color.AppColor.gradientSecond : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? color.AppColor.gradientSecond : Colors.grey.shade300,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: isSelected
                                  ? color.AppColor.gradientSecond.withOpacity(0.2)
                                  : Colors.grey.withOpacity(0.1),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          slot,
                          style: TextStyle(
                            color: isSelected ? Colors.white : color.AppColor.homePageTitle,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 30),
              ],

              // Personal Information
              if (selectedTimeSlot != null) ...[
                Text(
                  "Your Information",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
                SizedBox(height: 15),

                // Name Field
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name *',
                    hintText: 'Enter your name',
                    prefixIcon: Icon(Icons.person, color: color.AppColor.gradientSecond),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: color.AppColor.gradientSecond, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Phone Field
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number *',
                    hintText: 'Enter your phone number',
                    prefixIcon: Icon(Icons.phone, color: color.AppColor.gradientSecond),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: color.AppColor.gradientSecond, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 15),

                // Notes Field
                TextField(
                  controller: notesController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: 'Additional Notes (Optional)',
                    hintText: 'Any special requests or preferences',
                    prefixIcon: Icon(Icons.note, color: color.AppColor.gradientSecond),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: color.AppColor.gradientSecond, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Booking Summary
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        color.AppColor.gradientFirst.withOpacity(0.1),
                        color.AppColor.gradientSecond.withOpacity(0.1),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: color.AppColor.gradientSecond.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Booking Summary',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color.AppColor.homePageTitle,
                        ),
                      ),
                      SizedBox(height: 15),
                      _buildSummaryRow(Icons.category, 'Category', selectedCategory ?? ''),
                      _buildSummaryRow(Icons.content_cut, 'Service', selectedService ?? ''),
                      _buildSummaryRow(
                        Icons.calendar_today,
                        'Date',
                        selectedDate != null ? DateFormat('MMM d, y').format(selectedDate!) : '',
                      ),
                      _buildSummaryRow(Icons.access_time, 'Time', selectedTimeSlot ?? ''),
                      _buildSummaryRow(
                        Icons.timer,
                        'Duration',
                        selectedServiceDetails?['duration'] ?? '',
                      ),
                      Divider(height: 20, thickness: 1),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.homePageTitle,
                            ),
                          ),
                          Text(
                            selectedServiceDetails?['price'] ?? '',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: color.AppColor.gradientSecond,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                // Book Appointment Button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: isFormValid ? _bookAppointment : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color.AppColor.gradientSecond,
                      disabledBackgroundColor: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: isFormValid ? 5 : 0,
                    ),
                    child: Text(
                      'Book Appointment',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: color.AppColor.gradientSecond),
          SizedBox(width: 12),
          Text(
            '$label:',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14,
                color: color.AppColor.homePageTitle,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}