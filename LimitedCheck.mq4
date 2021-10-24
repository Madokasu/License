//+------------------------------------------------------------------+
//|                                                 LimitedCheck.mq4 |
//|                                                     @nobclarinet |
//|                                 https://madokasu-fx.blogspot.com |
//+------------------------------------------------------------------+
#property copyright "@nobclarinet"
#property link      "https://madokasu-fx.blogspot.com"
#property version   "1.00"
#property strict

// グローバル変数は嫌いです
string URL = "https://github.com/Madokasu/License/blob/main/accounts.csv";
string comment_base = "";

int OnInit()
  {
   string testee = IntegerToString(AccountNumber());
   int allowed = isAllowedAccount(testee);
   if(allowed < 0)
     {
      Print("残念ながら、", testee, "は許可されていません。", "理由コード:", allowed);
      comment_base = testee + "は許可されていません";
      return INIT_FAILED;
     }
   comment_base = testee + "の使用許可を確認しました";
   return INIT_SUCCEEDED;
  }

void OnTick()
  {
   Comment(comment_base);
  }

int isAllowedAccount(string testee)
  {

   int WebR;
   int timeout = 5000;
   string cookie = NULL,headers;
   char post[], ReceivedData[];
   string str;

   StringToCharArray(str, post);
   WebR = WebRequest("GET", URL, cookie, NULL, timeout, post, 0, ReceivedData, headers);
   if(!WebR)
     {
      Print("Web request failed");
      return -2;
     }
   string receivedText = CharArrayToString(ReceivedData);
   return StringFind(receivedText, testee + ",");
  }
//+------------------------------------------------------------------+
