import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["name"];

  connect() {
    console.log("Volunteers Controller ...");
    // var citynames = new Bloodhound({
    //   datumTokenizer: Bloodhound.tokenizers.obj.whitespace('name'),
    //   queryTokenizer: Bloodhound.tokenizers.whitespace,
    //   prefetch: {
    //     url: 'assets/citynames.json',
    //     filter: function(list) {
    //       return $.map(list, function(cityname) {
    //         return { name: cityname }; });
    //     }
    //   }
    // });
    //
    // debugger;

    // citynames.initialize();
    // $('.tginput').tagsinput({
    //   typeaheadjs: {
    //     name: 'citynames',
    //     displayKey: 'name',
    //     valueKey: 'name',
    //     source: ["Karachi", "Lahore", "Islamabad"]
    //   }
    // });

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
