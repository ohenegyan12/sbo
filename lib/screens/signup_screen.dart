import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import 'success_screen.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _currentStep = 1;

  // Step 1 Controllers
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _digitalAddressController = TextEditingController();

  // Step 2 Controllers/State
  String? _selectedInstitution;
  final _institutionNameController = TextEditingController();
  String? _selectedDistrict;

  // Step 3 Controllers
  final _icuController = TextEditingController();
  final _serialController = TextEditingController();

  final List<String> _institutionOptions = ['Education', 'Health', 'Security', 'Other'];
  final List<String> _districtOptions = ['District A', 'District B', 'District C', 'District D'];

  void _nextStep() {
    if (_currentStep < 3) {
      setState(() {
        _currentStep++;
      });
    } else {
      // Final submission
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const SuccessScreen(
            illustration: AppAssets.signUpSuccess,
            title: 'Application Received Successfully',
            subtitle: 'Thank you for your submission. We’ve received your application and our team is currently reviewing it. We’ll get back to you with an update as soon as possible.',
          ),
        ),
      );
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() {
        _currentStep--;
      });
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: _previousStep,
        ),
        title: Text(
          'Step $_currentStep of 3',
          style: TextStyle(
            color: AppColors.darkBackground.withOpacity(0.5),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: List.generate(3, (index) {
                  return Expanded(
                    child: Container(
                      height: 4,
                      margin: EdgeInsets.only(right: index == 2 ? 0 : 8),
                      decoration: BoxDecoration(
                        color: index < _currentStep 
                            ? AppColors.primaryColor 
                            : const Color(0xFFF5F6FA),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  );
                }),
              ),
            ),
            
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildStepHeader(),
                    const SizedBox(height: 32),
                    if (_currentStep == 1) _buildStep1(),
                    if (_currentStep == 2) _buildStep2(),
                    if (_currentStep == 3) _buildStep3(),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: _nextStep,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        _currentStep == 3 ? 'Complete Sign Up' : 'Continue',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.darkBackground.withOpacity(0.8),
                          fontSize: 14,
                        ),
                        children: [
                          const TextSpan(text: "Already have an account? "),
                          WidgetSpan(
                            alignment: PlaceholderAlignment.middle,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                                  (route) => false,
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepHeader() {
    String title = '';
    String subtitle = '';

    switch (_currentStep) {
      case 1:
        title = 'Personal Info';
        subtitle = 'Please provide your personal details';
        break;
      case 2:
        title = 'Institution Info';
        subtitle = 'Tell us about your organization';
        break;
      case 3:
        title = 'Device Info';
        subtitle = 'Finalize your account setup';
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.darkBackground,
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColors.darkBackground.withOpacity(0.5),
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildStep1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Full Name'),
        _buildTextField('Enter your full name', _fullNameController),
        const SizedBox(height: 24),
        _buildLabel('Email Address'),
        _buildTextField('Enter your email address', _emailController),
        const SizedBox(height: 24),
        _buildLabel('Phone Number'),
        _buildTextField('Enter your phone number', _phoneController, keyboardType: TextInputType.phone),
        const SizedBox(height: 24),
        _buildLabel('Digital Address'),
        _buildTextField('Enter digital address (GPS)', _digitalAddressController),
      ],
    );
  }

  Widget _buildStep2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('Institution Type'),
        _buildDropdownField(
          hint: 'Select institution type',
          value: _selectedInstitution,
          items: _institutionOptions,
          onChanged: (val) => setState(() => _selectedInstitution = val),
        ),
        const SizedBox(height: 24),
        _buildLabel('Name of Institution'),
        _buildTextField('Enter name of institution', _institutionNameController),
        const SizedBox(height: 24),
        _buildLabel('Select District'),
        _buildDropdownField(
          hint: 'Select your district',
          value: _selectedDistrict,
          items: _districtOptions,
          onChanged: (val) => setState(() => _selectedDistrict = val),
        ),
      ],
    );
  }

  Widget _buildStep3() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildLabel('ICU Number'),
        _buildTextField('Enter ICU number', _icuController),
        const SizedBox(height: 24),
        _buildLabel('Serial Number'),
        _buildTextField('Enter serial number', _serialController),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF081730),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller, {TextInputType keyboardType = TextInputType.text}) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(
            color: AppColors.darkBackground,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String hint,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Container(
      height: 60, // Fixed height for consistency
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: value,
          hint: Text(
            hint,
            style: TextStyle(
              color: Colors.grey.shade400,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          style: const TextStyle(
            color: AppColors.darkBackground,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          borderRadius: BorderRadius.circular(16),
          dropdownColor: Colors.white,
          elevation: 8,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Text(item),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: AppColors.darkBackground,
            size: 24,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _digitalAddressController.dispose();
    _institutionNameController.dispose();
    _icuController.dispose();
    _serialController.dispose();
    super.dispose();
  }
}
