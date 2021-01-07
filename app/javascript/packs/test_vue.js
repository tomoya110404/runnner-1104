

import Vue from 'vue'
// packs配下にcomponentsディレクトリを作成し、その中にcomponentを格納している
import ShowUser from './components/ShowUser.vue'

// ボタン要素をgetElementsByClassNameで配列として取得
const btnModals = document.getElementsByClassName('btn-modal')

// for文で各ボタン要素を取り出し
for(let btnModal of btnModals) {
  // 取り出したボタン要素に対し、addEventListenerでボタンクリックされた時にvueインスタンスを生成させる
  btnModal.addEventListener('click', () => {
    new Vue({
      el: '#showUser',
      render: h => h(
        ShowUser, {
          // componentにpropsでuser_idを渡している
          props: {
            userId: Number(btnModal.getAttribute('data-user_id'))
          } 
        }
      )
    })
  })
}