// Entry point for the build script in your package.json
import Rails from "@rails/ujs";
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";
import jquery from "jquery";

Rails.start();

window.jQuery = jquery;
window.$ = jquery;

window.bootstrap = bootstrap;
