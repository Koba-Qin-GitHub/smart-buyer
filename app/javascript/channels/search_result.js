
// API_KEY
const mouser_apiKey = gon.mouser_apiKey




// データ取得のイベント(単語入力  → 検索) 
window.onload = function () {                                              // ページが完全に読み込まれた直後に実行
  document.getElementById('search_form').onsubmit = function(event) {      // クリックされた時に発動
    event.preventDefault();
    const search_word = document.getElementById('search_word').value;
    // console.log("OK")

    // 各処理へ分岐
    ajaxRequest(search_word);
    post(search_word);

};}


//itemsテーブルを保存するための非同期通信
function post (search_word){
    const form = document.getElementById("search_form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/items", true);
    XHR.responseType = "json";
    XHR.send(formData);                             // JavaScript より リクエスト送信
    // console.log("非同期通信OK");

    XHR.onload = () => {
      console.log(XHR.response.item.id);
      const item_id = XHR.response.item.id;
      const url = document.getElementById("favorite_new").href + "items/" + item_id + "/favorites";
      console.log(url);
      document.getElementById('favorite_new').setAttribute('href', url);
      document.getElementById('favorite_delete').setAttribute('href', url);
      
      
    };
    
  // });
};






// Mouser_APIからのデータ取得(非同期通信)
function ajaxRequest(search_word) {
  $.ajax({
    url: 'https://api.mouser.com/api/v1/search/partnumber?apiKey=' + mouser_apiKey ,
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

  // 非同期通信が成功した時
  }).done(function(response) {
    const result = response.SearchResults.NumberOfResult;
    // console.log(response);
    // console.log(mouser_apiKey);
    // console.log(result_NumberOfResult);
    // console.log("Mouser_OK");
    
    // Mouser_APIでの「検索結果数」のよる条件分岐
    if(result === 0) {
      window.alert('「正式品番」として検索しましたが、ヒットしませんでした。');
    } else if(result === 1) {
      response_item_info(response);
    } else {
        window.alert('複数ヒットしました。完全一致の「正式品番」を入力してください');
    }


  // 非同期通信が失敗した時
  }).fail(function(){
    window.alert('通信エラーのため、検索することができませんでした。');

  });
}


// 検索ヒットが１件の場合
function response_item_info (res) {
  const result_PartNumber = res.SearchResults.Parts[0].ManufacturerPartNumber;
  const result_Stock = res.SearchResults.Parts[0].FactoryStock;
  const result_image = res.SearchResults.Parts[0].ImagePath;
  const result_Manufacturer = res.SearchResults.Parts[0].Manufacturer;
  const result_price = res.SearchResults.Parts[0].PriceBreaks[0].Price;
  const result_ItemUrl = res.SearchResults.Parts[0].ProductDetailUrl;

  document.getElementById('result_PartNumber').textContent = `正式品番：${result_PartNumber}`; 
  document.getElementById('result_Stock').textContent = `在庫数量：${result_Stock}個`; 
  document.getElementById('result_image').src = result_image; 
  document.getElementById('result_Manufacturer').textContent = `メーカー：${result_Manufacturer}`; 
  document.getElementById('result_price').textContent = `単価：${result_price}〜`; 
  document.getElementById('result_ItemUrl').textContent = `${result_ItemUrl}`; 
  document.getElementById('result_ItemUrl').setAttribute('href', result_ItemUrl);

}

// 検索ヒットが２件以上の場合
