import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

document.addEventListener('DOMContentLoaded', () => {
  Vue.component('open-modal',{
    template : `
      <div id="overlay" v-on:click="clickEvent">
          <div id="content">
            <p><slot></slot></p>
            <button v-on:click="clickEvent">close</button>
          </div>
      </div>
      `,
    methods :{
      clickEvent: function(){
        this.$emit('from-child')
       }
    }
  })
  
  new Vue({
    el: '#app',
    data: {
      showContent: false
    },
    methods:{
      openModal: function(){
        this.showContent = true
      },    
      closeModal: function(){
        this.showContent = false
      },
    }
  })
})