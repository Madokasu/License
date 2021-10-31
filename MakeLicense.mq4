//+------------------------------------------------------------------+
//|                                                  MakeLicense.mq4 |
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
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
  {
//---
// ここに書いてもいいし、mqhにグローバル変数として書いてもいいし
   string admin_password ="something password";

   int raw_file = FileOpen("RawAllowAccounts.csv", FILE_CSV, ',');
   int license_file = FileOpen("License.csv", FILE_CSV | FILE_ANSI | FILE_WRITE, ',');

   while(!FileIsEnding(raw_file))
     {
      string account_no = FileReadString(raw_file);
      FileWrite(license_file, DoEncode(admin_password, account_no));
     }
   FileClose(license_file);
   FileClose(raw_file);
  }
//+------------------------------------------------------------------+
