//+------------------------------------------------------------------+
//|                                               AccountLimited.mq4 |
//|                                                     @nobclarinet |
//|                                 https://madokasu-fx.blogspot.com |
//+------------------------------------------------------------------+
#property copyright "@nobclarinet"
#property link      "https://madokasu-fx.blogspot.com"
#property version   "1.00"
#property strict

#include <Array2Hex.mqh>
#include <DoEncode.mqh>

//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
   return(CheckAccount() ? INIT_SUCCEEDED : INIT_FAILED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CheckAccount()
  {
//---
   string admin_password ="something password";
   string testee = DoEncode(admin_password, IntegerToString(AccountNumber()));
   int license_file = FileOpen("License.csv", FILE_CSV, ',');
   // ホントはFileOpenの実行結果もハンドリングするべき
   bool flg = false;
   while(!FileIsEnding(license_file))
     {
      string account_no = FileReadString(license_file);
      if(StringCompare(account_no, testee) == 0)
        {
         Print(AccountNumber(), " はEAの使用が許可されています");
         flg = true;
         break;
        }
     }
   FileClose(license_file);
   if(flg == false)
     {
      Print("残念ながら ", AccountNumber(), " はEAの使用が許可されていません");
     }

//---
   return flg;
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---

  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---

  }
//+------------------------------------------------------------------+
