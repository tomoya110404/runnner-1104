function comment() {
  
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const itemId = submit.getAttribute("data_id")
    const formData = new FormData(document.getElementById("form"));
    const XHR = new XMLHttpRequest();
    XHR.open("POST", `/articles/${itemId}/comments`, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      if (XHR.status != 200) {
        alert(`Error ${XHR.status}: ${XHR.statusText}`);
        return null;
      }
      const item = XHR.response.comment;
      const user = XHR.response.user;
      const list = document.getElementById("list");
      const formText = document.getElementById("text");
      const HTML = `
      <li class="talk-Rtxt", id="talk-hukidashi-left">
          <div>
            <p class="talk-name">@${user.nickname}@さん</p>
          </div>
        <div class="lower-messages">
          <div class="lower-message-text">
            <p class="talk-text" >${item.comment}</p>
          </div>  
          <div class="lower-message-delete", id="pull-down">
          </div>  
        </div>  
      </li>  `;
      list.insertAdjacentHTML("beforeend", HTML);
      formText.value = "";
    };
   
  });  
}
window.addEventListener("load", comment);