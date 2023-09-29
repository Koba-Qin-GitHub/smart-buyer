


// ページが完全に読み込まれた直後に実行
window.onload = function(){

  chart_appear()
  
}


// チャート図の表示・非表示
function chart_appear(){
  
  const target = document.querySelectorAll('.charts');
  const target_open_btn = document.querySelectorAll('.chart_open_btn');
  const target_close_btn = document.querySelectorAll('.chart_close_btn');

  for (let i = 0; i < target_open_btn.length; i++){

    target_open_btn[i].addEventListener('click', () => {
      // チャートの表示切り替え
      target[i].parentNode.removeAttribute('class');
      // ボタンの切り替え
      target_open_btn[i].classList.add("hidden");
      target_close_btn[i].classList.remove("hidden");
    });

    target_close_btn[i].addEventListener('click', () => {
      // チャートの表示切り替え
      target[i].parentNode.classList.add("hidden");
      // ボタンの切り替え
      target_open_btn[i].classList.remove("hidden");
      target_close_btn[i].classList.add("hidden");
    });

  }
}



