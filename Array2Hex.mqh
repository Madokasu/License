//+------------------------------------------------------------------+
//| ucharデータ配列の全要素から、文字列(16進数表示)を作成
//|------------------------------------------------------------------|
string ArrayToHex(uchar &arr[], int count=-1)
  {
   string res = "";
//--- arr配列サイズ確認
   if(count < 0 || count > ArraySize(arr))
     {
      count = ArraySize(arr);
     }

//--- arr配列のデータから文字列(16進数表示)を作成
   for(int i=0; i < count; i++)
     {
      res += StringFormat("%.2X",arr[i]);
     }

   return(res);
  }

//+------------------------------------------------------------------+