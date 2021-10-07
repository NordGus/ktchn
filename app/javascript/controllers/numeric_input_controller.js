import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['field']
    static values = { min: Number, max: Number, fractionDigits: Number }

    increment(event) {
        const newValue = this._value + this._getStep(event.currentTarget)

        if (newValue > this._max) return

        this._refreshValue(newValue)
    }

    decrement(event) {
        const newValue = this._value - this._getStep(event.currentTarget)

        if (newValue < this._min) return

        this._refreshValue(newValue)
    }

    _getStep(elem) {
        return Number(elem.dataset['step'])
    }

    _refreshValue(value) {
        this.fieldTarget.value = value.toFixed(this.fractionDigitsValue)
    }

    get _value() {
        return Number(this.fieldTarget.value)
    }

    get _min() {
        return Number(this.minValue)
    }

    get _max() {
        return Number(this.maxValue)
    }
}