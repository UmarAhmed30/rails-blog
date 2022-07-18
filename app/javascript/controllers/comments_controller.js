import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  initialize() {
    console.log("Initializing Controller");
  }
  connect() {
    console.log("Connecting to Controller");
  }
  toggleForm(event) {
    console.log("Edit button clicked");
    event.preventDefault();
    event.stopPropagation();
    const formID = event.params["form"];
    const commentBodyID = event.params["body"];

    const form = document.getElementById(formID);
    form.classList.toggle("d-none");
    form.classList.toggle("mt-5");

    const commentBody = document.getElementById(commentBodyID);
    commentBody.classList.toggle("d-none");
  }
}
