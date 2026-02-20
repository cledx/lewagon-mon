import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    

    connect() {
        console.log("New Trainer JS Loaded");
        const dialogueBox = document.getElementById("dialogue"); 
    }
}