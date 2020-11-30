function favorite() {
  const article = document.getElementById("f_btn");
  if (article.getAttribute("data-load") != null) {
    return null;
  }
  article.setAttribute("data-load", "true");
   article.addEventListener("click", () => {
      const articleId = article.getAttribute("data-id");
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/articles/${articleId}/checked`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }

        const item = XHR.response.article;
        if (item.checked === true) {
          article.setAttribute("data-check", "true");
        } else if (item.checked === false) {
          article.removeAttribute("data-check");
        }
      };
    });
}
setInterval(favorite, 1000);