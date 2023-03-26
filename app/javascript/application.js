// Entry point for the build script in your package.json
import {Turbo} from "@hotwired/turbo-rails"

Turbo.session.drive = false
// import "./controllers"
import * as bootstrap from "bootstrap"
import "trix"
import "@rails/actiontext"

// Components
import "./components/_trix-editor-overrides"
import './components/_select'

// Pages
import './pages/_review';

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
