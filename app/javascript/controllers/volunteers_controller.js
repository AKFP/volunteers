import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["name"];

  connect() {
    console.log("Volunteers Controller ....");
    this.emailMask($("#volunteer_email"))

  }

  previewImage(elmt){
    $(".default_image").hide()
    $("#image_placeholder").show()
    $("#image_placeholder").attr("src", window.URL.createObjectURL(elmt.target.files[0]))
  }

  emailMask(selector){
    var im = new Inputmask({
      mask: "*{1,20}[.*{1,20}][.*{1,20}][.*{1,20}]@*{1,20}[.*{2,6}][.*{1,2}]",
      greedy: false,
      onBeforePaste: function (pastedValue, opts) {
        pastedValue = pastedValue.toLowerCase();
        return pastedValue.replace("mailto:", "");
      },
      definitions: {
        '*': {
          validator: "[0-9A-Za-z!#$%&'*+/=?^_`{|}~\-]",
          casing: "lower"
        }
      }
    });
    im.mask(selector)
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
