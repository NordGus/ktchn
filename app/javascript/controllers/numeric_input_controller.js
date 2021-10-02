import { Controller } from "@hotwired/stimulus";

class NumericInputController extends Controller {
    static targets = ['field']

    connect() {
        this.value = Number(this.fieldTarget.value)
    }

    increment(event) {
        this.value += this._getStep(event.currentTarget)

        this._refreshValue()
    }

    decrement(event) {
        this.value -= this._getStep(event.currentTarget)

        this._refreshValue()
    }

    _getStep(elem) {
        return Number(elem.dataset['step'])
    }

    _refreshValue() {
        this.fieldTarget.value = this.value
    }
}

export default NumericInputController