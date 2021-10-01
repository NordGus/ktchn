// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "@hotwired/stimulus"

class CollectionController extends Controller {
    static targets = ["item"]

    connect() {
        this.isActiveClass = this.data.get('isActiveClass')
        this.containerClass = this.data.get('containerClass')
        this.activeId = -1
    }

    activate(event) {
        const id = event.target.dataset['resourceId']
        const prev = this._getItem(this.activeId)
        const current = this._getItem(id)

        if (prev) this._toggleActive(prev, true)
        this._toggleActive(current)

        this.activeId = id
    }

    deactivate(_event) {
        const active = this._getItem(this.activeId)

        if (active) this._toggleActive(active, true)

        this.activeId = -1
    }

    _toggleActive(elem, unselect = false) {
        const container = elem.getElementsByClassName(this.containerClass)[0]

        if (unselect) container.classList.remove(this.isActiveClass)
        else container.classList.toggle(this.isActiveClass, true)
    }

    _getItem(resourceId) {
        try {
            return this.itemTargets[this._indexOfItem(0, this.itemTargets.length - 1, resourceId)]
        } catch {
            return undefined
        }
    }

    _indexOfItem(left, right, id) {
        if (right >= left) {
            let mid = left + Math.floor((right - left) / 2)
            let middle = this.itemTargets[mid].dataset['resourceId']

            if (middle === id) return mid
            if (middle > id) return this._indexOfItem(left, mid - 1, id)
            return this._indexOfItem(mid + 1, right, id)
        }

        return -1
    }
}

export default CollectionController