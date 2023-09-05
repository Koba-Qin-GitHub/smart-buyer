'use strict';

// API_KEY
const mouser_apiKey = gon.mouser_apiKey




// データ取得のイベント(単語入力  → 検索) 
window.onload = function () {                                              // ページが完全に読み込まれた直後に実行
  document.getElementById('search_form').onsubmit = function(event) { 
    event.preventDefault();
    const search_word = document.getElementById('search_form').word.value;

    ajaxRequest(search_word);

};}




// Mouser_データ取得(非同期通信)
function ajaxRequest(search_word) {
  $.ajax({
    url: "https://api.mouser.com/api/v1/search/partnumber?apiKey=" + mouser_apiKey,
    crossDomain: true,
    method: 'post',
    headers: {
      'accept': 'application/json'
    },
    contentType: 'application/json',
    data: JSON.stringify({
      'SearchByPartRequest': {
        'mouserPartNumber': search_word,
        'partSearchOptions': ''
      }
    })
  }).done(function(response) {

    const result_NumberOfResult = response.SearchResults.NumberOfResult;

    console.log(response);
    console.log(result_NumberOfResult);
    
    // Mouser_APIでの「検索結果数」のよる条件分岐
    if(result_NumberOfResult === 0) {
      window.alert('「正式品番」として検索しましたが、ヒットしませんでした。');
    } else if(result_NumberOfResult === 1) {
      response_item_info(response);
  } else {
      window.alert('複数ヒットしました。完全一致の「正式品番」を入力してください');
  }


  }).fail(function(){
    // JSONのレスポンスが来なかった時の処理
    window.alert('通信エラーのため、検索することができませんでした。');

  });
}


// 検索ヒットが１件のみの場合
function response_item_info (res) {
  const result_PartNumber = res.SearchResults.Parts[0].ManufacturerPartNumber;
  const result_Stock = res.SearchResults.Parts[0].FactoryStock;
  const result_image = res.SearchResults.Parts[0].ImagePath;
  const result_Manufacturer = res.SearchResults.Parts[0].Manufacturer;
  const result_price = res.SearchResults.Parts[0].PriceBreaks[0].Price;
  const result_ItemUrl = res.SearchResults.Parts[0].ProductDetailUrl;

  document.getElementById('result_PartNumber').textContent = `正式品番：${result_PartNumber}`; 
  document.getElementById('result_Stock').textContent = `在庫数量：${result_Stock}個`; 
  // document.getElementById('result_image').textContent = `商品画像：${result_image}`; 
  document.getElementById('result_image').src = result_image; 
  document.getElementById('result_Manufacturer').textContent = `メーカー：${result_Manufacturer}`; 
  document.getElementById('result_price').textContent = `単価：${result_price}〜`; 
  document.getElementById('result_ItemUrl').textContent = `${result_ItemUrl}`; 
  document.getElementById('result_ItemUrl').setAttribute('href', result_ItemUrl);

}

// 検索ヒットが２件以上の場合
