import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['field', 'counter', 'currentCount', 'limit']
    static values = { limit: Number }

    connect() {
        this.currentCountTarget.innerText = this._currentCount()
        this.limitTarget.innerText = this.limitValue

        if (this._hasExceededCount()) {
            this.fieldTarget.classList.toggle('is-danger', true)
            this.counterTarget.classList.toggle('is-danger', true)
        }
    }

    updateCount(_event) {
        this.currentCountTarget.innerText = this._currentCount()

        if (this._hasExceededCount()) {
            this.fieldTarget.classList.toggle('is-danger', true)
            this.counterTarget.classList.toggle('is-danger', true)
        } else {
            this.fieldTarget.classList.toggle('is-danger', false)
            this.counterTarget.classList.toggle('is-danger', false)
        }
    }

    _currentCount() {
        return this.limitValue - this.fieldTarget.value.length
    }

    _hasExceededCount() {
        return this._currentCount() < 0
    }
}