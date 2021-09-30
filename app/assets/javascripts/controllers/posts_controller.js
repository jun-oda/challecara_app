import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["comment"]

  reset(){
    this.commentTarget.value = ""
  }
}