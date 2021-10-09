import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["recipe", "frame", "contentMeta"]
    static values = { isActiveClass: String, recipeContainerClass: String }

    connect() {
        this.recipesConfig = {
            isActiveClass: this.isActiveClassValue,
            containerClass: this.recipeContainerClassValue,
            activeId: -1
        }
    }

    setActiveRecipe(event) {
        if (event.currentTarget.id === this.frameTarget.id) {
            const id = this.contentMetaTarget.dataset['id'] || -1

            this._setAsActive(Number(id))
        }
    }

    _setAsActive(id) {
        let found = false

        for (const recipe of this.recipeTargets) {
            const recipeId = Number(recipe.dataset['id'])

            if (recipeId === this.recipesConfig.activeId) {
                this._recipeContainer(recipe)
                    .classList
                    .toggle(this.recipesConfig.isActiveClass, false)
            }
            if (recipeId === id) {
                this._recipeContainer(recipe)
                    .classList
                    .toggle(this.recipesConfig.isActiveClass, true)
                found = true
            }
        }

        this.recipesConfig.activeId = found ? id : -1
    }

    _recipeContainer(recipe) {
        return recipe.getElementsByClassName(this.recipesConfig.containerClass)[0]
    }
}