import 'package:get/get.dart';

class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // English Language
        'en_US': {
          // main app
          "language": "language",
          "indra": "Indra",
          "airavat": "Airavat",
          'title': "Team INDRA App",
          "login": "Login",
          "otp_verification": "OTP Verification",
          "otp_instruction":
              "Please enter the mobile number to get the verification code",
          "phone_number": "Phone Number",
          "continue": "Continue",
          // test
          "hello": "HELLO WORLD !",
          "how_are_you?": "How are You ?",
          "heyy": "hey!",

          // area calculator
          "area_calculator": "Area Calculator",
          "enter_length": "Enter Length of the field",
          "enter_width": "Enter Width of the field",
          "length": "Length",
          "meter": "meter",
          "foot": "foot",
          "width": "Width",
          "OR": "OR",
          "enter_area": "Enter Area of the field",
          "area": "Area",
          "sq_meter": "sq_meter",
          "sq_foot": "sq_foot",
          "acre": "acre",
          "gunta": "gunta",
          "enter_plant_to_plant_distance": "Enter plant to plant distance (mm)",
          "p_to_p_distance": "Plant to Plant distance",
          "calulate": "Calulate Number of Saplings required",
          "please_enter_required_data": "please enter required data",
          "enter_valid_p_to_p_distance": "Please enter plant to plant distance",
          "approx_sapling_count": "Approximate required Sapling count",
          "suggested": "Suggested",
          "to": "to",
          "warning_cnt":
              "*This are just approximate count, the actual requirement may vary due to lots of other factors. Please take it into consideration!",

          // disease prediction
          "disease_prediction": "Disease Prediction",
          "tomato": "Tomato",
          "brinjal": "Brinjal",
          "chili": "Chili",
          "apple": "Apple",
          "bell_pepper": "BellPepper",
          "cheery": "Cheery",
          "corn": "Corn",
          "grape": "Grape",
          "peach": "Peach",
          "potato": "Potato",
          "rice": "Rice",
          "tap_to_select_image": "Tap to select an image",
          "crop_details": "Crop Details",
          "unknown": "Unknown",

          // disease variables
          "disease": "Disease",
          "confidence": "Confidence",
          "crop": "Crop",
          "dis_name": "Disease name",

          // individual diseases

          // apple
          "apple_0": "Apple Apple Scab",
          "apple_1": "Apple Black Rot",
          "apple_2": "Apple Cedar Apple Rust",
          "apple_3": "Apple Healthy",

          // Bell Pepper
          "BellPepper_0": "Bell_Pepper Healthy",
          "BellPepper_1": "Bell_Pepper Bacterial  Spot",

          // cheery
          "cherry_0": "Cherry Powdery Mildew",
          "cherry_1": "Cherry Healthy",

          // corn
          "corn_0": "Corn​(Maize) Northern Leaf Blight",
          "corn_1": "Corn​(Maize) Common Rust",
          "corn_2": "Corn​(Maize) Gray Leaf Spot",
          "corn_3": "Corn​(Maize) Healthy",

          // grape
          "grape_0": "Grape Black Rot",
          "grape_1": "Grape Esca​(Black Measles)",
          "grape_2": "Grape Healthy",
          "grape_3": "Grape Leaf Blight​(Isariopsis Leaf Spot)",

          // peach
          "peach_0": "Peach Bacterial Spot",
          "peach_1": "Peach Healthy",

          // potato
          "potato_0": "Potato Early Blight",
          "potato_1": "Potato Healthy",
          "potato_2": "Potato Late Blight",

          // rice
          "rice_0": "Rice Healthy",
          "rice_1": "Rice Brown Spot",
          "rice_2": "Rice Hispa",
          "rice_3": "Rice Leaf Blast",

          // tomato
          "tomato_0": "Tomato Bacterial Spot",
          "tomato_1": "Tomato Early Blight",
          "tomato_2": "Tomato Late Blight",
          "tomato_3": "Tomato Leaf Mold",
          "tomato_4": "Tomato Healthy",
          "tomato_5": "Tomato Mosaic Virus",
          "tomato_6": "Tomato Septoria Leaf Spot",
          "tomato_7": "Tomato Target Spot",
          "tomato_8": "Tomato Two-spotted Spider-mite",
          "tomato_9": "Tomato Yellow Leaf Curl Virus",

          // brinjal
          "brinjal_0": "Healthy Leaf",
          "brinjal_1": "Insect Pest Disease",
          "brinjal_2": "Leaf Spot Disease",
          "brinjal_3": "Mosaic Virus Disease",
          "brinjal_4": "Small Leaf Disease",
          "brinjal_5": "White Mold Disease",

          // chili
          "0": "healthy",
          "1": "leaf curl",
          "2": "leaf spot",
          "3": "wihtefly",
          "4": "yellowish",

          // user model
          "uid": "uid",
          "name": "name",
          "phone": "phone",
          "street": "street",
          "village": "village",
          "taluka": "taluka",
          "district": "district",
          "zip": "zip",
          "state": "state",

          // videos
          "informational_videos": "Informational Videos",
          "error1": "Error getting data from api",

          // chatbot
          "chatbot": "Chat Bot",
          "ask_question": "Ask Question",

          // otp page
          "otp_msg": "Enter the six digit code sent to your \nphone number",
          "otp_not_got": "Didn't get a code? ",

          // enter user details
          "enter_details": "Enter User Details",
          "username": "Name",

          //
          "something_wrong": "Something went wrong",

          // fertilizer recommmend
          "fertilizer_recom": "Fertilizer recommendation",
          "soil_type": "Soil Type",

          // fertilizer crop types
          "Jawar(Sorghum)": "Jawar(Sorghum)",
          "Barley(JAV)": "Barley(JAV)",

          "nitrogen": "Nitrogen",
          "potassium": "Potassium",
          "phosphorous": "Phosphorous",
          "calculate": "Calculate",

          "profile": "Profile",
          "snapshot_error": "Snapshot data error",
        },

        ////////////////////////////////////////////////////////////////////
        // Hindi Language
        'hi_IN': {
          // main app
          "language": "भाषा",
          "indra": "इंद्र",
          "airavat": "ऐरावत",
          'title': "टीम इंद्र ऐप",
          "login": "लॉग इन करें",
          "otp_verification": "ओटीपी सत्यापन",
          "otp_instruction":
              "सत्यापन कोड प्राप्त करने के लिए कृपया मोबाइल नंबर दर्ज करें",
          "phone_number": "फ़ोन नंबर",
          "continue": "आगे बढ़ें",
          // test
          "hello": "हैलो वर्ल्ड !",
          "how_are_you?": "आप कैसे हैं ?",
          "heyy": "अरे!",

          // area calculator
          "area_calculator": "क्षेत्र कैलकुलेटर",
          "enter_length": "फ़ील्ड की लंबाई दर्ज करें",
          "enter_width": "फ़ील्ड की चौड़ाई दर्ज करें",
          "length": "लंबाई",
          "meter": "मीटर",
          "foot": "फुट",
          "width": "चौड़ाई",
          "OR": "या",
          "enter_area": "फ़ील्ड का क्षेत्रफल दर्ज करें",
          "area": "क्षेत्र",
          "sq_meter": "वर्ग_मीटर",
          "sq_foot": "वर्गफुट",
          "acre": "एकड़",
          "gunta": "गुंटा",
          "enter_plant_to_plant_distance":
              "पौधे से पौधे की दूरी दर्ज करें (मिमी)",
          "p_to_p_distance": "पौधे से पौधे की दूरी",
          "calulate": "आवश्यक पौधों की संख्या की गणना करें",
          "please_enter_required_data": "कृपया आवश्यक डेटा दर्ज करें",
          "enter_valid_p_to_p_distance": "कृपया पौधे से पौधे की दूरी दर्ज करें",
          "approx_sapling_count": "अनुमानित अपेक्षित पौध संख्या",
          "suggested": "सुझाव दिया",
          "to": "को",
          "warning_cnt":
              "*यह केवल अनुमानित गणना है, वास्तविक आवश्यकता कई अन्य कारकों के कारण भिन्न हो सकती है। कृपया इसे संज्ञान में लें!",

          // disease prediction
          "disease_prediction": "रोग की भविष्यवाणी",
          "tomato": "टमाटर",
          "brinjal": "बैंगन",
          "chili": "मिर्च",
          "apple": "सेब",
          "bell_pepper": "शिमला मिर्च",
          "cheery": "चेरी",
          "corn": "भुट्टा",
          "grape": "अंगूर",
          "peach": "आड़ू",
          "potato": "आलू",
          "rice": "चावल",
          "tap_to_select_image": "कोई छवि चुनने के लिए टैप करें",
          "crop_details": "फसल विवरण",
          "unknown": "अज्ञात",

          // disease variables
          "disease": "बीमारी",
          "confidence": "आत्मविश्वास",
          "crop": "फसल",
          "dis_name": "रोग का नाम",

          // individual diseases

          // apple
          "apple_0": "सेब की पपड़ी",
          "apple_1": "सेब का काला सड़न",
          "apple_2": "सेब देवदार सेब जंग",
          "apple_3": "सेब स्वस्थ",

          // Bell Pepper
          "BellPepper_0": "शिमला मिर्च स्वास्थ्यवर्धक",
          "BellPepper_1": "बेल_पेपर बैक्टीरियल स्पॉट",

          // cheery
          "cherry_0": "चेरी ख़स्ता फफूंदी",
          "cherry_1": "चेरी स्वस्थ",

          // corn
          "corn_0": "मक्का (मक्का) उत्तरी पत्ती झुलसा",
          "corn_1": "मक्का (मक्का) सामान्य जंग",
          "corn_2": "मक्का (मक्का) ग्रे पत्ती धब्बा",
          "corn_3": "मक्का (मक्का) स्वस्थ",

          // grape
          "grape_0": "अंगूर का काला सड़न",
          "grape_1": "अंगूर एस्का​(काला खसरा)",
          "grape_2": "अंगूर स्वस्थ",
          "grape_3": "अंगूर की पत्ती का झुलसना (इसारियोप्सिस पत्ती का धब्बा)",

          // peach
          "peach_0": "आड़ू बैक्टीरियल स्पॉट",
          "peach_1": "आड़ू स्वस्थ",

          // potato
          "potato_0": "आलू का अगेती झुलसा रोग",
          "potato_1": "आलू स्वास्थ्यवर्धक",
          "potato_2": "आलू का देर से झुलसना",

          // rice
          "rice_0": "चावल स्वस्थ",
          "rice_1": "चावल का भूरा धब्बा",
          "rice_2": "चावल हिस्पा",
          "rice_3": "चावल की पत्ती का विस्फोट",

          // tomato
          "tomato_0": "टमाटर जीवाणु स्पॉट",
          "tomato_1": "टमाटर का अगेती झुलसा रोग",
          "tomato_2": "टमाटर का देर से झुलसना",
          "tomato_3": "टमाटर की पत्ती का साँचा",
          "tomato_4": "टमाटर स्वस्थ",
          "tomato_5": "टमाटर मोज़ेक वायरस",
          "tomato_6": "टमाटर सेप्टोरिया लीफ स्पॉट",
          "tomato_7": "टमाटर लक्ष्य स्थान",
          "tomato_8": "टमाटर दो-धब्बेदार स्पाइडर-माइट",
          "tomato_9": "टमाटर की पीली पत्ती मोड़ने वाला वायरस",

          // brinjal
          "brinjal_0": "स्वस्थ पत्ता",
          "brinjal_1": "कीट-कीट रोग",
          "brinjal_2": "पत्ती धब्बा रोग",
          "brinjal_3": "मोज़ेक वायरस रोग",
          "brinjal_4": "छोटी पत्ती रोग",
          "brinjal_5": "सफेद फफूंदी रोग",

          // chili
          "0": "स्वस्थ",
          "1": "पत्ती का मुड़ना",
          "2": "पत्ती का स्थान",
          "3": "सफेद मक्खी",
          "4": "पीले",

          // user model
          "uid": "यूआईडी",
          "name": "नाम",
          "phone": "फ़ोन",
          "street": "गली",
          "village": "गाँव",
          "taluka": "तालुका",
          "district": "ज़िला",
          "zip": "ज़िप",
          "state": "राज्य",

          // videos
          "informational_videos": "सूचनात्मक वीडियो",
          "error1": "एपीआई से डेटा प्राप्त करने में त्रुटि",

          // chatbot
          "chatbot": "चैट बॉट",
          "ask_question": "प्रश्न पूछो",

          // otp page
          "otp_msg": "आपके फ़ोन नंबर पर भेजा गया छह अंकों का कोड दर्ज करें",
          "otp_not_got": "कोई कोड नहीं मिला?",

          // enter user details
          "enter_details": "व्यक्ति विवरण दर्ज करें",

          "something_wrong": "कुछ गलत हो गया",

          // fertilizer recomd
          "fertilizer_recom": "उर्वरक की सिफ़ारिश",
          "soil_type": "मिट्टी के प्रकार",
          // fertilizer crop types
          "Jawar(Sorghum)": "ज्वार",
          "Barley(JAV)": "जौ",

          "nitrogen": "नाइट्रोजन",
          "potassium": "पोटैशियम",
          "phosphorous": "फ़ास्फ़रोस",
          "calculate": "गणना",

          "profile": "प्रोफ़ाइल",
          "snapshot_error": "स्नैपशॉट डेटा त्रुटि",
        },
        // Marathi Language
        'mar_IN': {
          // main app
          "language": "भाषा",
          "indra": "इंद्र",
          "airavat": "ऐरावत",
          'title': "टीम इंद्र ऐप",
          "login": "लॉग इन करा",
          "otp_verification": "ओटीपी पडताळणी",
          "otp_instruction":
              "सत्यापन कोड मिळविण्यासाठी कृपया मोबाइल नंबर प्रविष्ट करा",
          "phone_number": "फोन नंबर",
          "continue": "पुढे सरका",

          // test
          "hello": "हॅलो वर्ल्ड!",
          "how_are_you?": "तू कसा आहेस ?",
          "heyy": "अहो!",

          // area calculator
          "area_calculator": "क्षेत्र कॅल्क्युलेटर",
          "enter_length": "फील्डची लांबी प्रविष्ट करा",
          "enter_width": "फील्डची रुंदी प्रविष्ट करा",
          "length": "लांबी",
          "meter": "मीटर",
          "foot": "फुट",
          "width": "रुंदी",
          "OR": "किंवा",
          "enter_area": "क्षेत्राचे क्षेत्रफळ घाला",
          "area": "क्षेत्र",
          "sq_meter": "वर्ग मीटर",
          "sq_foot": "वर्ग फुट",
          "acre": "एकर",
          "gunta": "गुंठा",
          "enter_plant_to_plant_distance":
              "पौध्यापासून पौध्यापर्यंत अंतर दर्ज करा (मिमी)",
          "p_to_p_distance": "पौध्यापासून पौध्यापर्यंत अंतर",
          "calulate": "आवश्यक रोपांची संख्या मोजा",
          "please_enter_required_data": "कृपया आवश्यक डेटा द्या",
          "enter_valid_p_to_p_distance":
              "कृपया पौध्यापासून पौध्यापर्यंत अंतर द्या",
          "approx_sapling_count": "अंदाजे आवश्यक रोपांची संख्या",
          "suggested": "सूचवलेले",
          "to": "ते",
          "warning_cnt":
              "*हे केवळ अंदाजे गणना आहे, वास्तविक आवश्यकता अनेक इतर घटकांमुळे भिन्न असू शकते. कृपया हे लक्षात घ्या!",
          // disease prediction
          "disease_prediction": "रोगाचा अंदाज",
          "tomato": "टोमॅटो",
          "brinjal": "वांगी",
          "chili": "मिरची",
          "apple": "सफरचंद",
          "bell_pepper": "शिमला मिरची",
          "cheery": "चेरी",
          "corn": "भुट्टा",
          "grape": "द्राक्ष",
          "peach": "आडू",
          "potato": "बटाटा",
          "rice": "तांदूळ",
          "tap_to_select_image": "कोणतीही प्रतिमा निवडण्यासाठी टॅप करा",
          "crop_details": "पीक तपशील",
          "unknown": "अज्ञात",
          // disease variables
          "disease": "रोग",
          "confidence": "आत्मविश्वास",
          "crop": "पीक",
          "dis_name": "रोगाचे नाव",

          // individual diseases

          // apple
          "apple_0": "ऍपल  स्कॅब",
          "apple_1": "ऍपल ब्लॅक रॉट",
          "apple_2": "ऍपल सीडर ऍपल गंज",
          "apple_3": "सफरचंद निरोगी",

          // Bell Pepper
          "BellPepper_0": "बेल_मिरपूड हेल्दी",
          "BellPepper_1": "बेल_मिरपूड जिवाणू स्पॉट",

          // cheery
          "cherry_0": "चेरी पावडर मिल्ड्यू",
          "cherry_1": "चेरी निरोगी",

          // corn
          "corn_0": "कॉर्न (मका) उत्तरी पानांचा तुषार",
          "corn_1": "कॉर्न (मका) सामान्य गंज",
          "corn_2": "कॉर्न (मका) करड्या पानांचे डाग",
          "corn_3": "कॉर्न (मका) निरोगी",

          // grape
          "grape_0": "द्राक्ष ब्लॅक रॉट",
          "grape_1": "ग्रेप एस्का (काळा गोवर)",
          "grape_2": "ग्रेप एस्का (काळा गोवर)",
          "grape_3": "द्राक्षाच्या पानांचा तुषार (इसारिओप्सिस लीफ स्पॉट)",

          // peach
          "peach_0": "पीच बॅक्टेरियल स्पॉट",
          "peach_1": "पीच हेल्दी",

          // potato
          "potato_0": "बटाटा लवकर अनिष्ट परिणाम",
          "potato_1": "बटाटा निरोगी",
          "potato_2": "बटाटा उशीरा अनिष्ट परिणाम",

          // rice
          "rice_0": "तांदूळ आरोग्यदायी",
          "rice_1": "तांदूळ तपकिरी स्पॉट",
          "rice_2": "तांदूळ हिस्पा",
          "rice_3": "भाताच्या पानांचा स्फोट",

          // tomato
          "tomato_0": "टोमॅटो जिवाणू स्पॉट",
          "tomato_1": "टोमॅटो अर्ली ब्लाइट",
          "tomato_2": "टोमॅटो लेट ब्लाइट",
          "tomato_3": "टोमॅटो लीफ मोल्ड",
          "tomato_4": "टोमॅटो हेल्दी",
          "tomato_5": "टोमॅटो मोझॅक व्हायरस",
          "tomato_6": "टोमॅटो सेप्टोरिया लीफ स्पॉट",
          "tomato_7": "टोमॅटो टार्गेट स्पॉट",
          "tomato_8": "टोमॅटो दोन-स्पॉटेड स्पायडर-माइट",
          "tomato_9": "टोमॅटो यलो लीफ कर्ल व्हायरस",

          // brinjal
          "brinjal_0": "निरोगी पान",
          "brinjal_1": "कीटक कीटक रोग",
          "brinjal_2": "लीफ स्पॉट रोग",
          "brinjal_3": "मोजॅक व्हायरस रोग",
          "brinjal_4": "लहान पानांचे रोग",
          "brinjal_5": "पांढरा साचा रोग",

          // chili
          "0": "निरोगी",
          "1": "लीफ कर्ल",
          "2": "पानांची जागा",
          "3": "पांढरी माशी",
          "4": "पिवळसर",

          // user model
          "uid": "यूआईडी",
          "name": "नाव",
          "phone": "फोन",
          "street": "रस्ता",
          "village": "गाव",
          "taluka": "तालुका",
          "district": "जिल्हा",
          "zip": "झिप",
          "state": "राज्य",

          // videos
          "informational_videos": "माहितीपूर्ण व्हिडिओ",
          "error1": "API वरून डेटा मिळविण्यात त्रुटी",

          // chatbot
          "chatbot": "Chat Bot",
          "ask_question": "प्रश्न विचारा",

          // otp page
          "otp_msg": "तुमच्या फोन नंबरवर पाठवलेला सहा अंकी कोड टाका",
          "otp_not_got": "कोड मिळाला नाही?",

          //enter user details
          "enter_details": "व्यक्तीचे तपशील प्रविष्ट करा",

          //
          "something_wrong": "काहीतरी चूक झाली",

          //fertilizer recommd
          "fertilizer_recom": "खताची शिफारस",
          "soil_type": "मातीचा प्रकार",

          // fertilizer crop types
          "Jawar(Sorghum)": "जावर",
          "Barley(JAV)": "बार्ली",

          "nitrogen": "नाइट्रोजन",
          "potassium": "पोटैशियम",
          "phosphorous": "फ़ास्फ़रोस",
          "calculate": "गणना करा",

          "profile": "प्रोफ़ाइल",
          "snapshot_error": "स्नैपशॉट डेटा त्रुटि",
        },
      };
}
