// Entry point for the build script in your package.json
import {Turbo} from "@hotwired/turbo-rails"

Turbo.session.drive = false
// import "./controllers"
// import ahoy from "ahoy.js"
import * as bootstrap from "bootstrap"
import "trix"
import "@rails/actiontext"

// Components
import "./components/_trix-editor-overrides"
import './components/_select'

// Pages
// import './pages/_review';

document.addEventListener("DOMContentLoaded", function () {
  const anchors = document.querySelectorAll("a[href^='#']");

  anchors.forEach(function (anchor) {
    const targetId = anchor.getAttribute("href");

    if (targetId.length > 1) {
      const targetElement = document.querySelector(targetId);

      if (targetElement) {
        targetElement.classList.add("anchor-offset");
      }
    }
  });
});

// Отображаем кнопку при прокрутке страницы на 200 пикселей
window.onscroll = function () {
  if (document.body.scrollTop > 200 || document.documentElement.scrollTop > 200) {
    document.querySelector(".scroll-to-top-btn").style.display = "block";
  } else {
    document.querySelector(".scroll-to-top-btn").style.display = "none";
  }
};

// Прокручиваем страницу наверх при клике на кнопку
document.querySelector(".scroll-to-top-btn").addEventListener("click", function () {
  window.scrollTo({
    top: 0,
    behavior: "smooth"
  });
});