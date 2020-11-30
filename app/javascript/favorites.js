function favorites() {
  const article = document.getElementById("fsubmit");

   article.addEventListener("click", (e) => {
      e.preventDefault();
      const articleId = article.getAttribute("data_id");
      const formData = new FormData(document.getElementById("form_f"));
      const XHR = new XMLHttpRequest();
      XHR.open("POST", `/articles/${articleId}/favorites`, true);
      XHR.responseType = "json";
      XHR.send(formData);
      XHR.onload = () => {
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }

        const item = XHR.response.article;
        const favorite = XHR.response.favorite;
        if (favorite) {
          article.setAttribute("style", "color: gold;, background-color: :gold");
        } else if (favorite == null){
          article.removeAttribute("style", "color: gold;, background-color: :gold");
        }
          
      };
    });
}
window.addEventListener("load", favorites);