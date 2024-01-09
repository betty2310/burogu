// app/javascript/controllers/tabs_controller.js
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["tab", "content"]

    connect() {
        this.showTab(0) // Show the first tab by default
        console.log("Hello, Stimulus!", this.element)
    }

    switchTab(event) {
        event.preventDefault()
        const index = this.tabTargets.indexOf(event.currentTarget)
        this.showTab(index)
    }

    showTab(index) {
        this.tabTargets.forEach((tab, idx) => {
            tab.classList.toggle("font-bold", index === idx)
            tab.classList.toggle("bg-gray-200", index === idx)
            tab.classList.toggle("text-gray-600", index === idx)
        })
        this.contentTargets.forEach((content, idx) => {
            content.classList.toggle("hidden", index !== idx)
        })
    }
}
