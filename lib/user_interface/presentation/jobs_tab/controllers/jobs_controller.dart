import 'package:get/get.dart';
import 'package:hirevire_app/constants/persistence_keys.dart';
import 'package:hirevire_app/services/api_service.dart';
import 'package:hirevire_app/user_interface/models/job_model.dart';
import 'package:hirevire_app/utils/datetime_util.dart';
import 'package:hirevire_app/utils/persistence_handler.dart';

class JobsController extends GetxController {
  late ApiClient apiClient;

  RxBool isLoading = false.obs;
  RxString name = ''.obs;
  RxList<bool> isOpen = [true, false, false].obs;

  RxList<JobModel> jobs = <JobModel>[].obs;

  RxList<Map<String, dynamic>> suggestedJobs = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    apiClient = ApiClient();
    fetchLocalData();
    fetchJobs();
  }

  fetchLocalData() async {
    name.value = await PersistenceHandler.getString(PersistenceKeys.name);
  }

  fetchJobs() async {
    jobs.value = JobModel().fromJsonList(dummyJobs);
  }

  toggleGrowthPlan(int index, bool value) {
    isOpen[index] = value;
  }

  String getPostTime(DateTime date) {
    return DatetimeUtil.timeAgo(date);
  }
}

String dummyJobs = '''
  [
    {
      "id": "abcd123",
      "company_logo_url": "https://banner2.cleanpng.com/20190417/sxw/kisspng-microsoft-windows-portable-network-graphics-logo-t-aevinel-reino-maldito-descarga-5cb6fb279ba648.3641279715554957196376.jpg",
      "company_name": "Microsoft",
      "postedOn": "2024-06-18",
      "video_url": "https://as2.ftcdn.net/v2/jpg/05/59/13/27/1000_F_559132795_F42vuGejg9lXypySClo27RNuZGQdg0is.jpg",
      "ref_id": "123asfasf",
      "applicants": 103,
      "recruiter": "Martha Franz",
      "recruiter_designation": "Senior Product Designer",
      "transaction_date": null,
      "job_title": "Software Engineer",
      "location": "Bengaluru, India",
      "ctc": "24 - 30",
      "skills": [
        "ReactJs",
        "NodeJs",
        "MySQL",
        "Docker",
        "AWS EC2"
      ],
      "growth_plan": [
        {
          "title": "30 day Plan",
          "description": "Good to have experience & understanding cloud infrastructure like AWS. Good to have experience & understanding cloud infrastructure like AWS. \\n\\nGood to have experience & understanding cloud infrastructure like AWS"
        },
        {
          "title": "60 day Plan",
          "description": "Good to have experience & understanding cloud infrastructure like AWS. Good to have experience & understanding cloud infrastructure like AWS. \\n\\nGood to have experience & understanding cloud infrastructure like AWS"
        },
        {
          "title": "90 day Plan",
          "description": "Good to have experience & understanding cloud infrastructure like AWS. Good to have experience & understanding cloud infrastructure like AWS. \\n\\nGood to have experience & understanding cloud infrastructure like AWS"
        }
      ],
      "perks": "Good to have experience & understanding cloud infrastructure like AWS. Good to have experience & understanding cloud infrastructure like AWS. \\n\\nGood to have experience & understanding cloud infrastructure like AWS",
      "social_handles": [
        {
          "platform": "Instagram",
          "logoUrl": "",
          "url": "https://instagram.com/abcd"
        },
        {
          "platform": "LinkedIn",
          "logoUrl": "",
          "url": "https://instagram.com/abcd"
        },
        {
          "platform": "X",
          "logoUrl": "",
          "url": "https://instagram.com/abcd"
        }
      ]
    },
    {
      "id": "abcd1234",
      "company_logo_url": "https://banner2.cleanpng.com/20190417/sxw/kisspng-microsoft-windows-portable-network-graphics-logo-t-aevinel-reino-maldito-descarga-5cb6fb279ba648.3641279715554957196376.jpg",
      "company_name": "Microsoft",
      "postedOn": "2024-06-24",
      "video_url": "https://as2.ftcdn.net/v2/jpg/05/59/13/27/1000_F_559132795_F42vuGejg9lXypySClo27RNuZGQdg0is.jpg",
      "ref_id": "123asfasf",
      "applicants": 26,
      "recruiter": "Martha Franz",
      "recruiter_designation": "Senior Product Designer",
      "transaction_date": null,
      "job_title": "Senior Product Designer",
      "location": "Bengaluru, India",
      "ctc": "20 - 30",
      "skills": [
        "Figma",
        "UI/UX",
        "Canva"
      ],
      "growth_plan": [
        {
          "title": "30 day Plan",
          "description": "Good to have experience & understanding cloud infrastructure like AWS. Good to have experience & understanding cloud infrastructure like AWS. \\n\\nGood to have experience & understanding cloud infrastructure like AWS"
        },
        {
          "title": "60 day Plan",
          "description": "Good to have experience & understanding cloud infrastructure like AWS. Good to have experience & understanding cloud infrastructure like AWS. \\n\\nGood to have experience & understanding cloud infrastructure like AWS"
        },
        {
          "title": "90 day Plan",
          "description": "Good to have experience & understanding cloud infrastructure like AWS. Good to have experience & understanding cloud infrastructure like AWS. \\n\\nGood to have experience & understanding cloud infrastructure like AWS"
        }
      ],
      "perks": "Good to have experience & understanding cloud infrastructure like AWS. Good to have experience & understanding cloud infrastructure like AWS. \\n\\nGood to have experience & understanding cloud infrastructure like AWS",
      "social_handles": [
        {
          "platform": "Instagram",
          "logoUrl": "",
          "url": "https://instagram.com/abcd"
        },
        {
          "platform": "LinkedIn",
          "logoUrl": "",
          "url": "https://instagram.com/abcd"
        },
        {
          "platform": "X",
          "logoUrl": "",
          "url": "https://instagram.com/abcd"
        }
      ]
    }
  ]
  ''';
