//+------------------------------------------------------------------+
//|                                                     DoEncode.mqh |
//|                                                     @nobclarinet |
//|                                 https://madokasu-fx.blogspot.com |
//+------------------------------------------------------------------+
#property copyright "@nobclarinet"
#property link      "https://madokasu-fx.blogspot.com"
#property strict

string DoEncode(string key, string target)
  {
   uchar array_key[];
   StringToCharArray(key, array_key);

   uchar array_src[];
   uchar array_dst[];
   StringToCharArray(target, array_src);
   int res = CryptEncode(CRYPT_DES, array_src, array_key, array_dst);
   return ArrayToHex(array_dst);
  }
