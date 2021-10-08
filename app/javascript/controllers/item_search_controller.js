import { Controller } from "@hotwired/stimulus"
import { post } from "@rails/request.js"

export default class extends Controller {
    static targets = ['hidden', 'search', 'results', 'loader']

    connect() {
        this.searchMinSize = 1
    }

    searchItems(event) {
        const search = event.currentTarget.value

        if (search.length <= this.searchMinSize) {
            this._hideElement(this.resultsTarget)
            this._hideElement(this.loaderTarget)
            return
        }

        this._hideElement(this.resultsTarget)
        this._showElement(this.loaderTarget)

        post(`/inventory/items/search`, {
            body: { item: { search: search } },
            contentType: 'application/json',
            responseKind: 'turbo-stream'
        }).then(_ => {
            this._hideElement(this.loaderTarget)
            this._showElement(this.resultsTarget)
        })
    }

    selectItem(event) {
        event.preventDefault()

        const { id, name } = event.currentTarget.dataset

        this._setHidden(id, name)
        this._setSearch(name)

        this.resultsTarget.innerHTML = ''
        this._hideElement(this.resultsTarget)
    }

    prepareItem(_event) {
        if (this.searchTarget.value !== this.hiddenTarget.dataset['itemName']) {
            this._setHidden('', '')
        }
    }

    _hideElement(element) {
        element.classList.toggle('is-hidden', true)
    }

    _showElement(element) {
        element.classList.toggle('is-hidden', false)
    }

    _setHidden(id, name) {
        this.hiddenTarget.value = id
        this.hiddenTarget.dataset['itemName'] = name
    }

    _setSearch(name) {
        this.searchTarget.value = name
    }
}