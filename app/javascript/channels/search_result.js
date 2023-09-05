'use strict';

// API_KEY
const mouser_apiKey = gon.mouser_apiKey



// データ取得のイベント(単語入力  → 検索) 
window.onload = function () {                                           // ページが完全に読み込まれた直後に実行
  document.getElementById('search_form').onsubmit = function(event) { 
    event.preventDefault();
    const search_word = document.getElementById('search_form').word.value;

    console.log(mouser_url);

    ajaxRequest(search_word);

};}




// Mouser_データ取得(非同期通信)
function ajaxRequest(search_word) {
  $.ajax({
    url: "https://api.mouser.com/api/v1/search/partnumber?apiKey=" + mouser_apiKey,
    // url: 'https://api.mouser.com/api/v1/search/partnumber?apiKey=31e7f2b7-2345-4229-80fb-b48ba1ac23c6',
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
    // console.log(response);
    response_item_info(response);
  });
}


// 検索ヒットが１件のみの場合
function response_item_info (res) {
  const result_PartNumber = res.SearchResults.Parts[0].ManufacturerPartNumber;
  const result_Stock = res.SearchResults.Parts[0].FactoryStock;
  document.getElementById('result_PartNumber').textContent = `正式品番：${result_PartNumber}`; 
  document.getElementById('result_Stock').textContent = `在庫数量：${result_Stock}個`; 
}

// 検索ヒットが２件以上の場合
