// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require moment
//= require bootstrap
//= require daterangepicker
//= require jquery-ui/autocomplete

$(document).ready(function() {
  $('.role').hide();
  $('#Role').change(function () {
    $('.role').hide();
    $('#'+$(this).val()).show();
  })
  $(".remove").click(function() {
      if (confirm($(this).data("confirm")))
      {$('#schedule'+ this.id.toString()).hide();
      $.ajax({
          url: '/remove_schedule',
          type: 'GET',
          data: { id: this.id },
          dataType: 'json'
        });}
  })
  $('#doc_names').autocomplete({
    source: $('#doc_names').data('autocomplete-source'),
    change: function(event,ui) {
          if (ui.item===null) {
                console.log('hi')
                $('#doc_names').val('')
                $('#schedule_doctor_id').val('')
                $('#doc_names').focus()
          }
        },
    select: function(event, ui) {
          $('#doc_names').val(ui.item.label)
          $('#schedule_doctor_id').val(ui.item.value)
          return false;
      }
    })

  $('input[class="daterange"]').daterangepicker({});
  $('input[class="daterange"]').val('');
  $('input[class="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
    $('input[class="daterange"]').val('');
  });

  $('.schedule-slot').hide();
  $('.schedule-slot#1').show();
  var slot_no = 2;
  $(".add-schedule").click(function() {
    $('.schedule-slot#'+slot_no).show();
    console.log(slot_no)
    if(slot_no == 5) {
      $(".add-schedule").hide();
    }
    slot_no++
  })
})
