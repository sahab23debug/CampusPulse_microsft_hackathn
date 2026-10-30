import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

/// Section 5.8: Campus Rental Marketplace
/// Features:
/// - Real-time item search & category filters
/// - Working item listing form ("+ List Your Item")
/// - Mandatory damage liability consent checkbox before renting
/// - Clean, light Material 3 design
class RentalScreen extends StatefulWidget {
  const RentalScreen({super.key});

  @override
  State<RentalScreen> createState() => _RentalScreenState();
}

class _RentalScreenState extends State<RentalScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = 'All';

  final List<Map<String, dynamic>> _items = [
    {
      'id': 1,
      'title': 'Casio fx-991EX ClassWiz Scientific Calculator',
      'category': 'Calculators',
      'owner': 'Rohan Verma',
      'pricePerDay': '₹20/day',
      'deposit': '₹300',
      'condition': 'Excellent (Like New)',
      'pickup': 'Nilgiri Hostel, Room 214',
      'isAvailable': true,
      'imageUrl': 'https://images.unsplash.com/photo-1587145820266-a5951ee6f620?w=400',
    },
    {
      'id': 2,
      'title': 'Arduino Uno R3 Starter Kit + Sensors & Breadboard',
      'category': 'Hardware & Kits',
      'owner': 'Sahab Raza',
      'pricePerDay': '₹40/day',
      'deposit': '₹500',
      'condition': 'Good (All components tested)',
      'pickup': 'LHC Central Foyer',
      'isAvailable': true,
      'imageUrl': 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400',
    },
    {
      'id': 3,
      'title': 'Kurose & Ross: Computer Networking (7th Ed)',
      'category': 'Books & Notes',
      'owner': 'Priya Nair',
      'pricePerDay': '₹15/day',
      'deposit': '₹200',
      'condition': 'Highlighted clean textbook',
      'pickup': 'Central Library Gate 2',
      'isAvailable': true,
      'imageUrl': 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400',
    },
    {
      'id': 4,
      'title': 'Engineering Mini Drafter + Drawing Sheet Tube',
      'category': 'Lab & Drawing',
      'owner': 'Aarav Sharma',
      'pricePerDay': '₹25/day',
      'deposit': '₹400',
      'condition': 'Calibrated scales, smooth joints',
      'pickup': 'Mechanical Block Gate 1',
      'isAvailable': true,
      'imageUrl': 'https://images.unsplash.com/photo-1581092160607-ee22621dd758?w=400',
    },
    {
      'id': 5,
      'title': 'Standard White Lab Coat + Safety Goggles (Size M)',
      'category': 'Lab & Drawing',
      'owner': 'Ananya Verma',
      'pricePerDay': '₹15/day',
      'deposit': '₹150',
      'condition': 'Clean, washed & ironed',
      'pickup': 'Chemistry Lab Foyer',
      'isAvailable': true,
      'imageUrl': 'https://images.unsplash.com/photo-1584036561566-baf8f5f1b144?w=400',
    },
    {
      'id': 6,
      'title': 'Raspberry Pi 4 (4GB) + Acrylic Case & 5V Adapter',
      'category': 'Hardware & Kits',
      'owner': 'Karan Mehta',
      'pricePerDay': '₹60/day',
      'deposit': '₹1000',
      'condition': 'Running Debian Bullseye',
      'pickup': 'Girnar Hostel Room 302',
      'isAvailable': true,
      'imageUrl': 'https://images.unsplash.com/photo-1550751827-4bd374c3f58b?w=400',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showListItemDialog() {
    final titleController = TextEditingController();
    final priceController = TextEditingController(text: '25');
    final depositController = TextEditingController(text: '300');
    final pickupController = TextEditingController(text: 'Hostel Reception / Library');
    String itemCategory = 'Calculators';
    String condition = 'Excellent (Like New)';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: EdgeInsets.only(
                left: 24,
                right: 24,
                top: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    const SizedBox(height: 16),
                    const Row(
                      children: [
                        Icon(Icons.storefront_rounded, color: AppColors.primary),
                        SizedBox(width: 8),
                        Text(
                          'List an Item for Rent',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      'Help campus peers by renting out calculators, books, lab coats, and hardware kits.',
                      style: TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                    ),
                    const SizedBox(height: 18),

                    // Item Title
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        labelText: 'Item Name & Model',
                        hintText: 'e.g. Casio fx-82MS or Texas Instruments TI-84',
                        prefixIcon: Icon(Icons.shopping_bag_outlined),
                      ),
                    ),
                    const SizedBox(height: 14),

                    // Category Dropdown
                    DropdownButtonFormField<String>(
                      initialValue: itemCategory,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                        prefixIcon: Icon(Icons.category_outlined),
                      ),
                      items: ['Calculators', 'Hardware & Kits', 'Books & Notes', 'Lab & Drawing']
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (val) => setModalState(() => itemCategory = val!),
                    ),
                    const SizedBox(height: 14),

                    // Price & Deposit
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: priceController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Price per Day (₹)',
                              prefixIcon: Icon(Icons.currency_rupee),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: TextField(
                            controller: depositController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              labelText: 'Security Deposit (₹)',
                              prefixIcon: Icon(Icons.shield_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),

                    // Condition Dropdown
                    DropdownButtonFormField<String>(
                      initialValue: condition,
                      decoration: const InputDecoration(
                        labelText: 'Item Condition',
                        prefixIcon: Icon(Icons.thumb_up_alt_outlined),
                      ),
                      items: ['Excellent (Like New)', 'Good (Working)', 'Acceptable / Used']
                          .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                          .toList(),
                      onChanged: (val) => setModalState(() => condition = val!),
                    ),
                    const SizedBox(height: 14),

                    // Pickup Location
                    TextField(
                      controller: pickupController,
                      decoration: const InputDecoration(
                        labelText: 'Pickup Location on Campus',
                        hintText: 'e.g. Nilgiri Hostel Room 102 or Library Foyer',
                        prefixIcon: Icon(Icons.location_on_outlined),
                      ),
                    ),
                    const SizedBox(height: 22),

                    // Submit Listing Button
                    ElevatedButton.icon(
                      onPressed: () {
                        if (titleController.text.trim().isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Please enter an item title')),
                          );
                          return;
                        }

                        final newItem = {
                          'id': _items.length + 1,
                          'title': titleController.text.trim(),
                          'category': itemCategory,
                          'owner': 'Aarav Sharma (You)',
                          'pricePerDay': '₹${priceController.text.trim()}/day',
                          'deposit': '₹${depositController.text.trim()}',
                          'condition': condition,
                          'pickup': pickupController.text.trim().isNotEmpty
                              ? pickupController.text.trim()
                              : 'Campus Library Foyer',
                          'isAvailable': true,
                          'imageUrl': itemCategory == 'Calculators'
                              ? 'https://images.unsplash.com/photo-1587145820266-a5951ee6f620?w=400'
                              : (itemCategory == 'Books & Notes'
                                  ? 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400'
                                  : 'https://images.unsplash.com/photo-1518770660439-4636190af475?w=400'),
                        };

                        setState(() {
                          _items.insert(0, newItem);
                        });

                        Navigator.pop(ctx);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('🎉 "${newItem['title']}" listed for rent successfully!'),
                            backgroundColor: AppColors.attendanceSafe,
                          ),
                        );
                      },
                      icon: const Icon(Icons.check_circle_outline),
                      label: const Text('Publish Rental Listing'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  void _showRentDialog(Map<String, dynamic> item) {
    bool agreedToConsent = false;
    DateTime returnDate = DateTime.now().add(const Duration(days: 3));

    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setDialogState) => AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Row(
            children: [
              const Icon(Icons.storefront, color: AppColors.primary),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Rent ${item['title']}',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary.withValues(alpha: 0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Daily Rental Rate:', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                        Text(item['pricePerDay'], style: const TextStyle(fontWeight: FontWeight.w900, color: AppColors.primary)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Refundable Security Deposit:', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                        Text(item['deposit'], style: const TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Condition:', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                        Text(item['condition'], style: const TextStyle(fontSize: 12)),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Pickup:', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            item['pickup'],
                            style: const TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Return Due Date selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Expected Return Date:', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  TextButton.icon(
                    onPressed: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: returnDate,
                        firstDate: DateTime.now().add(const Duration(days: 1)),
                        lastDate: DateTime.now().add(const Duration(days: 60)),
                      );
                      if (picked != null) {
                        setDialogState(() => returnDate = picked);
                      }
                    },
                    icon: const Icon(Icons.calendar_today, size: 14),
                    label: Text('${returnDate.day}/${returnDate.month}/${returnDate.year}'),
                  ),
                ],
              ),
              const Divider(),
              const SizedBox(height: 6),

              // Mandatory Damage Consent Checkbox (Prompt constraint 5.8)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: agreedToConsent,
                    activeColor: AppColors.primary,
                    onChanged: (val) {
                      setDialogState(() => agreedToConsent = val ?? false);
                    },
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        'I agree to be fully responsible for any damage or loss during the rental period.',
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                '📸 Handover photo inspection will be recorded on pickup.',
                style: TextStyle(fontSize: 11, color: AppColors.textSecondaryLight),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: !agreedToConsent
                  ? null
                  : () {
                      Navigator.pop(ctx);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Rental request sent to ${item['owner']}! Due date reminder set.'),
                          backgroundColor: AppColors.attendanceSafe,
                        ),
                      );
                    },
              child: const Text('Confirm & Request'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final filtered = _items.where((item) {
      final matchesCategory = _selectedCategory == 'All' || item['category'] == _selectedCategory;
      final matchesQuery = query.isEmpty ||
          item['title'].toString().toLowerCase().contains(query) ||
          item['owner'].toString().toLowerCase().contains(query) ||
          item['pickup'].toString().toLowerCase().contains(query) ||
          item['category'].toString().toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        title: const Text('Campus Rental Marketplace', style: TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          ElevatedButton.icon(
            onPressed: _showListItemDialog,
            icon: const Icon(Icons.add, size: 18),
            label: const Text('List Item'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(100, 38),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          const SizedBox(width: 14),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar (Requested by user)
            TextField(
              controller: _searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search calculators, textbooks, lab coats, kits...',
                prefixIcon: const Icon(Icons.search, color: AppColors.primary),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, size: 18),
                        onPressed: () {
                          _searchController.clear();
                          setState(() {});
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppColors.lightBorder),
                ),
              ),
            ),
            const SizedBox(height: 14),

            // Category Filter Chips
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['All', 'Calculators', 'Hardware & Kits', 'Books & Notes', 'Lab & Drawing'].map((cat) {
                  final isSelected = _selectedCategory == cat;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(cat),
                      selected: isSelected,
                      selectedColor: AppColors.primaryLight,
                      labelStyle: TextStyle(
                        color: isSelected ? AppColors.primary : AppColors.textSecondaryLight,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                      onSelected: (val) => setState(() => _selectedCategory = cat),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 18),

            // Header Count
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Rentals (${filtered.length})',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                Text(
                  _selectedCategory,
                  style: const TextStyle(fontSize: 13, color: AppColors.primary, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Item Cards List
            if (filtered.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.lightBorder),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.search_off_rounded, size: 48, color: AppColors.textSecondaryLight),
                    const SizedBox(height: 12),
                    Text(
                      'No rental items found for "${_searchController.text}"',
                      style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Be the first to list this item for students!',
                      style: TextStyle(color: AppColors.textSecondaryLight, fontSize: 13),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: _showListItemDialog,
                      icon: const Icon(Icons.add),
                      label: const Text('List This Item Now'),
                    ),
                  ],
                ),
              )
            else
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filtered.length,
                separatorBuilder: (_, __) => const SizedBox(height: 14),
                itemBuilder: (context, index) {
                  final item = filtered[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.lightBorder),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.network(
                            item['imageUrl'],
                            height: 160,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Container(
                              height: 140,
                              color: AppColors.primaryLight,
                              child: const Center(
                                child: Icon(Icons.shopping_bag_outlined, size: 48, color: AppColors.primary),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item['title'],
                                          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                                        ),
                                        const SizedBox(height: 4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: AppColors.primary.withValues(alpha: 0.1),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          child: Text(
                                            item['category'].toString().toUpperCase(),
                                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: AppColors.primary),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    item['pricePerDay'],
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'Owner: ${item['owner']} • Deposit: ${item['deposit']}',
                                style: const TextStyle(fontSize: 13, color: AppColors.textSecondaryLight),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined, size: 14, color: AppColors.textSecondaryLight),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      item['pickup'],
                                      style: const TextStyle(fontSize: 12, color: AppColors.textSecondaryLight),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton.icon(
                                  onPressed: () => _showRentDialog(item),
                                  icon: const Icon(Icons.handshake_outlined, size: 18),
                                  label: const Text('Request to Rent'),
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(vertical: 12),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
