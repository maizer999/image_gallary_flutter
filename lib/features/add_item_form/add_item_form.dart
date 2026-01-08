import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddItemFormScreen extends StatefulWidget {
  const AddItemFormScreen({super.key});

  @override
  State<AddItemFormScreen> createState() => _AddItemFormScreenState();
}

class _AddItemFormScreenState extends State<AddItemFormScreen> {
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

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      debugPrint("تم التحقق من النموذج وإرساله بنجاح!");
    }
  }

  @override
  Widget build(BuildContext context) {
    // استخدام Directionality لجعل التطبيق يدعم العربية (من اليمين لليسار)
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_forward, color: Colors.black), // سهم العودة لليمين
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text("رفع بيانات KYC",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
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

              // زر الإرسال
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _onSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E1E1E),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    child: const Text("إرسال البيانات",
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 4.0),
      child: Text(
          label,
          style: GoogleFonts.cairo(
              color: Colors.black45,
              fontSize: 14,
              fontWeight: FontWeight.w700
          )
      ),
    );
  }

  Widget _textInput(TextEditingController controller, String hint, String? Function(String?)? validator, [TextInputType type = TextInputType.text]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: type,
        textAlign: TextAlign.right,
        style: GoogleFonts.cairo(fontSize: 15), // نص المستخدم
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.cairo(fontSize: 13, color: Colors.grey), // نص التلميح
          errorStyle: GoogleFonts.cairo(color: Colors.red, height: 0.8), // نص الخطأ
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
}