import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["collection", "mainContent"]
    static values = { isActiveClass: String, recipeContainerClass: String }

    connect() {
        this.collectionConfig = {
            isActiveClass: this.isActiveClassValue,
            containerClass: this.recipeContainerClassValue,
            metaContainerSelector: '#meta-container',
            activeId: -1
        }
    }

    _getRecipe(id) {
        if (id <= -1) return undefined;

        const i = this._indexOfItem(0, this.collectionTargets.length - 1, id)

        return this.collectionTargets[i]
    }

    _indexOfItem(left, right, id) {
        if (right >= left) {
            const mid = left + Math.floor((right - left) / 2)
            const middle = Number(this.collectionTargets[mid].dataset['id'])

            if (middle === id) return mid
            if (middle > id) return this._indexOfItem(left, mid - 1, id)
            return this._indexOfItem(mid + 1, right, id)
        }

        return -1
    }

    setActiveRecipe(event) {
        if (event.target.id === this.mainContentTarget.id) {
            const meta = event.target.querySelector(this.collectionConfig.metaContainerSelector)
            const id = !!meta ? Number(meta.dataset['id']) : -1

            this.__setAsActive(id)
        }
    }

    __setAsActive(id) {
        const previous = this._getRecipe(this.collectionConfig.activeId)
        const current = this._getRecipe(id)

        this.collectionConfig.activeId = id

        if (previous)
            this.__getRecipeContainer(previous).classList.remove(this.collectionConfig.isActiveClass)
        if (current)
            this.__getRecipeContainer(current).classList.toggle(this.collectionConfig.isActiveClass, true)
    }

    __getRecipeContainer(recipeFrame) {
        return recipeFrame.getElementsByClassName(this.collectionConfig.containerClass)[0]
    }
}