import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['field', 'counter', 'currentCount', 'limit']
    static values = { limit: Number }

    connect() {
        const length = this.fieldTarget.value.length

        this.currentCountTarget.innerText = length
        this.limitTarget.innerText = this.limitValue

        if (length > this.limitValue) {
            this.fieldTarget.classList.toggle('is-danger', true)
            this.counterTarget.classList.toggle('is-danger', true)
        }
    }

    updateCount(_event) {
        const length = this.fieldTarget.value.length

        this.currentCountTarget.innerText = length

        if (length > this.limitValue) {
            this.fieldTarget.classList.toggle('is-danger', true)
            this.counterTarget.classList.toggle('is-danger', true)
        } else {
            this.fieldTarget.classList.toggle('is-danger', false)
            this.counterTarget.classList.toggle('is-danger', false)
        }
    }
}