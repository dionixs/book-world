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
import './pages/_book';
import './pages/_review';
