import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static get targets() {
        return [ "scrollContainer", "image", "indicator" ]
      }
      initialize() {
        this.observer = new IntersectionObserver(this.onIntersectionObserved.bind(this), {
          root: this.scrollContainerTarget,
          threshold: 0.5
        })
        this.imageTargets.forEach(image => {
          this.observer.observe(image)
        })
      }
      onIntersectionObserved(entries) {
        entries.forEach(entry => {
          if (entry.intersectionRatio > 0.5) {
            const intersectingIndex = this.imageTargets.indexOf(entry.target)
            this.indicatorTargets[intersectingIndex].classList.add("bg-blue-900")
          }
          else { 
            const intersectingIndex = this.imageTargets.indexOf(entry.target)
            this.indicatorTargets[intersectingIndex].classList.remove("bg-blue-900")
          }
        })
      }
      scrollTo() {
        const imageId = event.target.dataset.imageId
        const imageElement = document.getElementById(imageId)
        const imageCoordinates = imageElement.getBoundingClientRect()
        this.scrollContainerTarget.scrollTo({ left: (this.scrollContainerTarget.scrollLeft + imageCoordinates.left), top: false, behavior: "smooth" })
      }
}
