import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Dashboard Controller ....");
  }

  updateRegistrationCount(event){
    const element = event.target
    $(".msg").html(element.dataset.text)
    $(".count-placeholder").html(element.dataset.count)
    this.updateLink(element)
  }

  updateLink(el){
    $('.lnk_count').removeClass('text-success text-muted')
    $('.lnk_count').addClass('text-muted')

    $(el).removeClass('text-muted')
    $(el).addClass('text-success')
  }


}