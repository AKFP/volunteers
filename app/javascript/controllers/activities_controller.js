import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    console.log("Activities Controller ....");
  }

  hover_trash_icon(){
    // console.log("Called");
  }

  delete_picture(evt){
    evt.preventDefault();
    var elmt = evt.currentTarget;
    var url = $(elmt).attr("href");

    $.ajax({
      type: 'DELETE',
      url: url,
      data: {authenticity_token: $('[name="csrf-token"]')[0].content},
    });

  }
}