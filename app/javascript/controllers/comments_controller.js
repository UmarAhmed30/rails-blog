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
    const editButtonID = event.params["edit"];

    const form = document.getElementById(formID);
    form.classList.toggle("d-none");
    form.classList.toggle("mt-5");

    const commentBody = document.getElementById(commentBodyID);
    commentBody.classList.toggle("d-none");

    const editButton = document.getElementById(editButtonID);
    this.toggleEditButton(editButton);
  }

  toggleEditButton(editButton) {
    if (editButton.innerText = "Edit") {
      editButton.innerText = "Cancel";
      this.toggleEditButtonClass(editButton);
    } else {
      editButton.innerText = "Edit";
      this.toggleEditButtonClass(editButton);
    }
  }

  toggleEditButtonClass(editButton) {
    editButton.classList.toggle("btn-warning");
    editButton.classList.toggle("btn-secondary");
    console.log("Hello");
  }
}
