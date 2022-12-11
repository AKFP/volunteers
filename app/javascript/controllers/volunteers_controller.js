import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["name"];

  connect() {
    console.log("Volunteers Controller ....");
  }

  updateStatus() {
    let status = null
    status  = $("#status").val()

    const element = this.nameTarget
    $.ajax({
      url: `/admin/volunteers/${element.value}/update_status`,
      type: 'POST',
      data: {authenticity_token: $('[name="csrf-token"]')[0].content, status: status},
      success: function(result) {
        $("#statusModal").modal("hide");
      }
    });
  }
}
