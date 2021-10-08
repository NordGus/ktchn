import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ["tab", "content"]

    connect() {
        this.currentTabIndex = this.tabTargets.findIndex(tab => !tab.classList.contains('is-hidden'))
        this.currentContentIndex = this.contentTargets.findIndex(tab => !tab.classList.contains('is-hidden'))
    }

    showTab(event) {
        event.preventDefault()

        const tab = event.currentTarget
        const contentName = tab.dataset['contentName']

        const nextTabIndex = this.tabTargets.findIndex(tab => tab.dataset['contentName'] === contentName)
        const nextContentIndex = this.contentTargets.findIndex(content => content.dataset['name'] === contentName)

        this.tabTargets[this.currentTabIndex].classList.toggle('is-active', false)
        this.contentTargets[this.currentContentIndex].classList.toggle('is-hidden', true)

        this.tabTargets[nextTabIndex].classList.toggle('is-active', true)
        this.contentTargets[nextContentIndex].classList.toggle('is-hidden', false)

        this.currentTabIndex = nextTabIndex
        this.currentContentIndex = nextContentIndex
    }
}