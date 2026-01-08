import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../add_item_image/providers/item_provider.dart';

class AddItemFormScreen extends ConsumerStatefulWidget {
  final List<File> images;
  const AddItemFormScreen({super.key, required this.images});

  @override
  ConsumerState<AddItemFormScreen> createState() => _AddItemFormScreenState();
}

class _AddItemFormScreenState extends ConsumerState<AddItemFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _videoController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  bool _isLoading = false;

  Future<void> _onSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    if (widget.images.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("الرجاء رفع صورة واحدة على الأقل")),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final result = await ref.read(itemRepositoryProvider).addItem(
        name: _nameController.text,
        description: _descController.text,
        categoryId: "2",
        price: _priceController.text,
        contact: _contactController.text,
        videoLink: _videoController.text,
        allCategoryIds: "2",
        address: _addressController.text,
        latitude: "23.232639",
        longitude: "69.6415341",
        country: _countryController.text,
        city: _cityController.text,
        state: _stateController.text,
        showOnlyToPremium: "1",
        galleryImages: widget.images,
      );

      result.when(
            (response) {
          // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(content: Text(response.message ?? "تم رفع البيانات بنجاح")),
          // );
          _showSuccessDialog("تم رفع البيانات بنجاح" , context);
          // Navigator.of(context).pop(); // back to previous screen
        },
            (error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("حدث خطأ: $error")),
          );
        },
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("فشل الإرسال: $e")),
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "رفع بيانات KYC",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    Text(
                      "أدخل تفاصيل الإعلان",
                      style: GoogleFonts.cairo(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _inputLabel("الاسم"),
                    _textInput(_nameController, "أدخل الاسم هنا", (v) => v!.isEmpty ? "الرجاء إدخال الاسم" : null),
                    _inputLabel("الوصف"),
                    _textInput(_descController, "وصف المختصر", (v) => v!.isEmpty ? "الرجاء إدخال الوصف" : null),
                    _inputLabel("السعر"),
                    _textInput(_priceController, "0.00", (v) => v!.isEmpty ? "الرجاء تحديد السعر" : null, TextInputType.number),
                    _inputLabel("رقم التواصل"),
                    _textInput(_contactController, "07XXXXXXXX", (v) => v!.isEmpty ? "رقم الهاتف مطلوب" : null, TextInputType.phone),
                    _inputLabel("رابط الفيديو (اختياري)"),
                    _textInput(_videoController, "https://youtube.com/...", null),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Divider(),
                    ),
                    Text(
                      "الموقع الجغرافي",
                      style: GoogleFonts.cairo(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _inputLabel("الدولة"),
                    _textInput(_countryController, "الأردن", (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null),
                    _inputLabel("المدينة"),
                    _textInput(_cityController, "عمان", (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null),
                    _inputLabel("المنطقة / الولاية"),
                    _textInput(_stateController, "جاردنز", (v) => v!.isEmpty ? "هذا الحقل مطلوب" : null),
                    _inputLabel("العنوان التفصيلي"),
                    _textInput(_addressController, "اسم الشارع، المبنى...", (v) => v!.isEmpty ? "العنوان مطلوب" : null),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E1E1E),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                      "إرسال البيانات",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputLabel(String label) => Padding(
    padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
    child: Text(
      label,
      style: GoogleFonts.cairo(color: Colors.black45, fontSize: 14, fontWeight: FontWeight.w700),
    ),
  );

  Widget _textInput(TextEditingController controller, String hint, String? Function(String?)? validator,
      [TextInputType type = TextInputType.text]) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: TextFormField(
          controller: controller,
          validator: validator,
          keyboardType: type,
          textAlign: TextAlign.right,
          style: GoogleFonts.cairo(fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.cairo(fontSize: 13, color: Colors.grey),
            errorStyle: GoogleFonts.cairo(color: Colors.red, height: 0.8),
            filled: true,
            fillColor: const Color(0xFFF1F8F5),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.red, width: 2.0),
            ),
          ),
        ),
      );
}


void _showSuccessDialog(String message , BuildContext context ) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          // Centers the icon and title area
          title: const Center(
            child: Icon(Icons.check_circle, color: Colors.green, size: 60),
          ),
          content: Text(
            message,
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(fontWeight: FontWeight.bold),
          ),
          // 🔥 This line centers all buttons in the actions list
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            SizedBox(
              width: double.infinity, // Makes the button wider if you prefer
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "حسناً",
                  style: GoogleFonts.cairo(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}