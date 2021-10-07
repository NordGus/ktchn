import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['hidden']

    freshHidden(event) {
        console.log(this.hiddenTarget)
    }
}