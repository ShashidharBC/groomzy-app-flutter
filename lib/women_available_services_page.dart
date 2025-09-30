import 'package:flutter/material.dart';
import 'colors.dart' as color;

class WomenAvailableServicesPage extends StatefulWidget {
  const WomenAvailableServicesPage({super.key});

  @override
  State<WomenAvailableServicesPage> createState() => _WomenAvailableServicesPageState();
}

class _WomenAvailableServicesPageState extends State<WomenAvailableServicesPage> {
  // Women's grooming services data
  final List<Map<String, dynamic>> womenServices = [
    {
      'name': 'Hair Spa Treatment',
      'description': 'Deep conditioning and nourishing hair treatment',
      'duration': '60 min',
      'price': '₹800',
      'icon': Icons.spa,
      'category': 'Hair Care'
    },
    {
      'name': 'Keratin Treatment',
      'description': 'Smoothing and straightening keratin therapy',
      'duration': '120 min',
      'price': '₹2500',
      'icon': Icons.auto_fix_high,
      'category': 'Hair Care'
    },
    {
      'name': 'Hair Color & Highlights',
      'description': 'Professional hair coloring with premium products',
      'duration': '90 min',
      'price': '₹1500',
      'icon': Icons.palette,
      'category': 'Hair Styling'
    },
    {
      'name': 'Hair Cut & Style',
      'description': 'Precision cut with blow-dry and styling',
      'duration': '45 min',
      'price': '₹500',
      'icon': Icons.content_cut,
      'category': 'Hair Styling'
    },
    {
      'name': 'Bridal Hair Styling',
      'description': 'Elegant bridal hairstyle with accessories',
      'duration': '90 min',
      'price': '₹3000',
      'icon': Icons.favorite,
      'category': 'Hair Styling'
    },
    {
      'name': 'Classic Facial',
      'description': 'Deep cleansing facial with face massage',
      'duration': '60 min',
      'price': '₹1000',
      'icon': Icons.face,
      'category': 'Facial'
    },
    {
      'name': 'Gold Facial',
      'description': 'Luxury gold facial for radiant skin',
      'duration': '75 min',
      'price': '₹2000',
      'icon': Icons.stars,
      'category': 'Facial'
    },
    {
      'name': 'Anti-Aging Facial',
      'description': 'Advanced facial treatment for mature skin',
      'duration': '70 min',
      'price': '₹1800',
      'icon': Icons.auto_awesome,
      'category': 'Facial'
    },
    {
      'name': 'Threading (Eyebrows)',
      'description': 'Precise eyebrow shaping with threading',
      'duration': '15 min',
      'price': '₹50',
      'icon': Icons.face_retouching_natural,
      'category': 'Threading'
    },
    {
      'name': 'Full Face Threading',
      'description': 'Complete facial hair removal with threading',
      'duration': '30 min',
      'price': '₹150',
      'icon': Icons.face_2,
      'category': 'Threading'
    },
    {
      'name': 'Upper Lip Threading',
      'description': 'Quick upper lip hair removal',
      'duration': '10 min',
      'price': '₹30',
      'icon': Icons.face_retouching_natural,
      'category': 'Threading'
    },
    {
      'name': 'Full Body Waxing',
      'description': 'Complete body hair removal with premium wax',
      'duration': '90 min',
      'price': '₹2000',
      'icon': Icons.accessibility_new,
      'category': 'Waxing'
    },
    {
      'name': 'Arms & Legs Waxing',
      'description': 'Smooth arms and legs with hot wax',
      'duration': '45 min',
      'price': '₹600',
      'icon': Icons.back_hand,
      'category': 'Waxing'
    },
    {
      'name': 'Brazilian Waxing',
      'description': 'Professional bikini area waxing',
      'duration': '30 min',
      'price': '₹800',
      'icon': Icons.health_and_safety,
      'category': 'Waxing'
    },
    {
      'name': 'Manicure',
      'description': 'Hand care with nail polish and massage',
      'duration': '45 min',
      'price': '₹400',
      'icon': Icons.back_hand,
      'category': 'Nails'
    },
    {
      'name': 'Pedicure',
      'description': 'Foot care with nail polish and massage',
      'duration': '50 min',
      'price': '₹500',
      'icon': Icons.accessibility,
      'category': 'Nails'
    },
    {
      'name': 'Gel Nail Extension',
      'description': 'Long-lasting gel nail extensions',
      'duration': '75 min',
      'price': '₹1200',
      'icon': Icons.pan_tool,
      'category': 'Nails'
    },
    {
      'name': 'Bridal Makeup',
      'description': 'Complete bridal makeup with premium products',
      'duration': '120 min',
      'price': '₹5000',
      'icon': Icons.face_4,
      'category': 'Makeup'
    },
    {
      'name': 'Party Makeup',
      'description': 'Glamorous makeup for special occasions',
      'duration': '60 min',
      'price': '₹2000',
      'icon': Icons.celebration,
      'category': 'Makeup'
    },
    {
      'name': 'HD Makeup',
      'description': 'High-definition airbrush makeup',
      'duration': '90 min',
      'price': '₹3500',
      'icon': Icons.camera_alt,
      'category': 'Makeup'
    },
    {
      'name': 'Body Massage',
      'description': 'Relaxing full body massage therapy',
      'duration': '60 min',
      'price': '₹1500',
      'icon': Icons.self_improvement,
      'category': 'Spa'
    },
    {
      'name': 'Aromatherapy',
      'description': 'Therapeutic massage with essential oils',
      'duration': '75 min',
      'price': '₹2000',
      'icon': Icons.local_florist,
      'category': 'Spa'
    },
    {
      'name': 'Bridal Package',
      'description': 'Complete bridal grooming package',
      'duration': '240 min',
      'price': '₹12000',
      'icon': Icons.diamond,
      'category': 'Package'
    },
    {
      'name': 'Party Ready Package',
      'description': 'Hair, makeup, and manicure combo',
      'duration': '150 min',
      'price': '₹4500',
      'icon': Icons.card_giftcard,
      'category': 'Package'
    }
  ];

  String selectedCategory = 'All';
  final List<String> categories = [
    'All',
    'Hair Care',
    'Hair Styling',
    'Facial',
    'Threading',
    'Waxing',
    'Nails',
    'Makeup',
    'Spa',
    'Package'
  ];

  List<Map<String, dynamic>> get filteredServices {
    if (selectedCategory == 'All') {
      return womenServices;
    }
    return womenServices.where((service) => service['category'] == selectedCategory).toList();
  }

  Color getCategoryColor(String category) {
    switch (category) {
      case 'Hair Care': return Colors.pink.shade400;
      case 'Hair Styling': return Colors.purple.shade400;
      case 'Facial': return Colors.blue.shade400;
      case 'Threading': return Colors.orange.shade400;
      case 'Waxing': return Colors.teal.shade400;
      case 'Nails': return Colors.red.shade400;
      case 'Makeup': return Colors.deepPurple.shade400;
      case 'Spa': return Colors.green.shade400;
      case 'Package': return Colors.amber.shade700;
      default: return color.AppColor.gradientFirst;
    }
  }

  void _showServiceDetails(Map<String, dynamic> service) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: getCategoryColor(service['category']).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    service['icon'],
                    color: getCategoryColor(service['category']),
                    size: 30,
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
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: color.AppColor.homePageTitle,
                        ),
                      ),
                      Text(
                        service['category'],
                        style: TextStyle(
                          fontSize: 14,
                          color: getCategoryColor(service['category']),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              service['description'],
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                height: 1.5,
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: color.AppColor.gradientFirst.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.access_time, size: 16, color: color.AppColor.gradientFirst),
                      SizedBox(width: 5),
                      Text(
                        service['duration'],
                        style: TextStyle(
                          color: color.AppColor.gradientFirst,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Text(
                  service['price'],
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color.AppColor.gradientSecond,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: color.AppColor.gradientSecond,
                      side: BorderSide(color: color.AppColor.gradientSecond),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text('Cancel'),
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // TODO: Navigate to booking page
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Booking ${service['name']}...'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: color.AppColor.gradientSecond,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                      elevation: 2,
                    ),
                    child: Text(
                      'Book Now',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
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
              // Header with back button
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: color.AppColor.homePageIcons,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Women's Services",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w700,
                            color: color.AppColor.homePageTitle,
                          ),
                        ),
                        Text(
                          "${womenServices.length} services available",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),

              // Category Filter
              Container(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String category = categories[index];
                    bool isSelected = selectedCategory == category;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategory = category;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12),
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? color.AppColor.gradientSecond
                              : Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(
                            color: color.AppColor.gradientSecond, // Blue border
                            width: 0.5, // Border thickness
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
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: isSelected
                                  ? Colors.white
                                  : color.AppColor.homePageTitle,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 25),

              // Services List
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredServices.length,
                itemBuilder: (context, index) {
                  final service = filteredServices[index];
                  return GestureDetector(
                    onTap: () => _showServiceDetails(service),
                    child: Container(
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: getCategoryColor(service['category']).withOpacity(0.1),
                            blurRadius: 15,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  getCategoryColor(service['category']).withOpacity(0.2),
                                  getCategoryColor(service['category']).withOpacity(0.1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Icon(
                              service['icon'],
                              color: getCategoryColor(service['category']),
                              size: 30,
                            ),
                          ),
                          SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        service['name'],
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: color.AppColor.homePageTitle,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                      decoration: BoxDecoration(
                                        color: getCategoryColor(service['category']).withOpacity(0.15),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        service['category'],
                                        style: TextStyle(
                                          fontSize: 11,
                                          color: getCategoryColor(service['category']),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6),
                                Text(
                                  service['description'],
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 15,
                                      color: color.AppColor.gradientFirst,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      service['duration'],
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: color.AppColor.gradientFirst,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Text(
                                      service['price'],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: color.AppColor.gradientSecond,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}