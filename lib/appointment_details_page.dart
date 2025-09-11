import 'package:flutter/material.dart';
import 'colors.dart' as color;

class AppointmentDetailsPage extends StatelessWidget {
  const AppointmentDetailsPage({super.key});

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
              // Header with back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 24,
                      color: color.AppColor.homePageIcons,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text(
                    "Appointment Details",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: color.AppColor.homePageTitle,
                    ),
                  ),
                  // const Expanded(child: SizedBox()),
                  // Icon(
                  //   Icons.edit,
                  //   size: 20,
                  //   color: color.AppColor.homePageIcons,
                  // ),
                ],
              ),
              const SizedBox(height: 30),

              // Appointment Card
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.AppColor.gradientFirst.withOpacity(0.8),
                      color.AppColor.gradientSecond.withOpacity(0.9),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(5, 10),
                      blurRadius: 20,
                      color: color.AppColor.gradientSecond.withOpacity(0.3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Premium Haircut\n& Beard Styling",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                        Icon(
                          Icons.content_cut,
                          color: color.AppColor.homePageContainerTextSmall,
                          size: 50,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        // Icon(
                        //   Icons.attach_money_rounded,
                        //   color: color.AppColor.homePageContainerTextSmall,
                        //   size: 20,
                        // ),
                        // const SizedBox(width: 5),
                        Text(
                          "\₹65",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: color.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Icon(
                          Icons.access_time,
                          color: color.AppColor.homePageContainerTextSmall,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "45 min",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: color.AppColor.homePageContainerTextSmall,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Date & Time Section
              _buildDetailSection(
                "Date & Time",
                [
                  _buildDetailRow(Icons.calendar_today, "Date", "Today, Sep 11, 2025"),
                  _buildDetailRow(Icons.access_time, "Time", "2:30 PM - 3:15 PM"),
                ],
              ),
              const SizedBox(height: 25),

              // Barber Details Section
              _buildDetailSection(
                "Your Barber",
                [
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/loki.jpeg"), // Add barber image
                          backgroundColor: color.AppColor.gradientFirst.withOpacity(0.2),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Loki Thandavesh",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: color.AppColor.homePageTitle,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                "Senior Barber • 8 years exp",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: color.AppColor.homePageSubtitle,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Icon(Icons.star, color: Colors.amber, size: 16),
                                  const SizedBox(width: 2),
                                  Text(
                                    "4.9 (14K reviews)",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: color.AppColor.homePageSubtitle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.phone,
                          color: color.AppColor.gradientFirst,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),

              // Location Section
              _buildDetailSection(
                "Location",
                [
                  _buildDetailRow(Icons.location_on, "Address", "123 Koppa Street, Mandya"),
                  _buildDetailRow(Icons.directions_car, "Parking", "Free parking available"),
                ],
              ),
              const SizedBox(height: 25),

              // Services Section
              _buildDetailSection(
                "Services Included",
                [
                  _buildServiceItem("✂️ Premium Hair Cut", "Professional styling"),
                  _buildServiceItem("🧔 Beard Trim & Shape", "Precision grooming"),
                  _buildServiceItem("🧴 Hair Wash & Styling", "Premium products"),
                  _buildServiceItem("💆 Head Massage", "Relaxing treatment"),
                ],
              ),
              const SizedBox(height: 30),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        border: Border.all(color: color.AppColor.gradientFirst, width: 2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _showCancelDialog(context);
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: color.AppColor.gradientFirst,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            color.AppColor.gradientFirst,
                            color.AppColor.gradientSecond,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () {
                          _showRescheduleDialog(context);
                        },
                        child: Text(
                          "Reschedule",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailSection(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color.AppColor.homePageTitle,
          ),
        ),
        const SizedBox(height: 15),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 3),
                color: Colors.grey.withOpacity(0.1),
              ),
            ],
          ),
          child: Column(children: children),
        ),
      ],
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(
            icon,
            color: color.AppColor.gradientFirst,
            size: 20,
          ),
          const SizedBox(width: 15),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: color.AppColor.homePageSubtitle,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              color: color.AppColor.homePageTitle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceItem(String service, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            service.split(' ')[0], // Get the emoji
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.substring(service.indexOf(' ') + 1), // Get text after emoji
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: color.AppColor.homePageTitle,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: color.AppColor.homePageSubtitle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showCancelDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            "Cancel Appointment",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color.AppColor.homePageTitle,
            ),
          ),
          content: const Text("Are you sure you want to cancel this appointment?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "No",
                style: TextStyle(color: color.AppColor.homePageSubtitle),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Appointment cancelled successfully")),
                );
              },
              child: Text(
                "Yes, Cancel",
                style: TextStyle(color: color.AppColor.gradientFirst),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showRescheduleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            "Reschedule Appointment",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color.AppColor.homePageTitle,
            ),
          ),
          content: const Text("Would you like to select a new date and time?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: color.AppColor.homePageSubtitle),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Redirecting to booking calendar...")),
                );
              },
              child: Text(
                "Select Date",
                style: TextStyle(color: color.AppColor.gradientFirst),
              ),
            ),
          ],
        );
      },
    );
  }
}