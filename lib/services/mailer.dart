import 'package:liquidsoft_components/dao.dart';
import 'package:liquidsoft_components/services/liquidHTTPCaller.dart';

class Mailer {
  LiquidHTTPCaller _httpCaller = LiquidHTTPCaller();

  sendMail(String contactEmail, String contactName, String subject, String message) async {
    _httpCaller.postData(Dao.inst.apiBase + '/SendGrid/', {
      "personalizations": [
        {
          "to": [
            {
              'email': contactEmail,
              'name': contactName,
            }
          ],
          "cc": [
            {
              'email': "chris@liquidsoft.io",
              'name': "Customer Service",
            }
          ],
          "subject": subject,
        }
      ],
      "from": {
        "email": "mailer@liquidsoft.io",
        'name': "Customer Service",
      },
      "reply_to": {
        "email": "chris@liquidsoft.io",
        'name': "Customer Service",
      },
      "content": [
        {
          "type": "text/html",
          "value": message,
        }
      ]
    });
  }
}
