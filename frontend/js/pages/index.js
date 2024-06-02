fetch("../components/login.html")
.then((response) => response.text())
.then((html) => {
  document.querySelector("body").insertAdjacentHTML("beforeend", html);
})
.catch((error) => console.error("Error loading flogin:", error));

// <!-- Footer include -->
fetch("../components/footer.html")
.then((response) => response.text())
.then((html) => {
  document.querySelector("body").insertAdjacentHTML("beforeend", html);
})
.catch((error) => console.error("Error loading footer:", error));