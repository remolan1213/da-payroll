fetch("../components/header.html")
  .then((response) => response.text())
  .then((text) => {
    document.querySelector("body").insertAdjacentHTML("afterbegin", text);
  });
fetch("../components/input-worker.html")
  .then((response) => response.text())
  .then((text) => {
    document.querySelector("body").insertAdjacentHTML("afterbegin", text);
  });

fetch("../components/footer.html")
  .then((response) => response.text())
  .then((html) => {
    document.querySelector("body").insertAdjacentHTML("beforeend", html);
  });
