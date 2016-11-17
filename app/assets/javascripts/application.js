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
//= require jquery.turbolinks
//= require jquery_ujs
//= require_tree .
//= require moment
//= require bootstrap
//= require daterangepicker
//= require jquery-ui/autocomplete
//= require turbolinks
var data

function shiftDisplay(shift) {
  if(shift == 0){
    return "เช้า :"
  }
  else{
    return "เย็น :"
  }
}

var ready = function () {
  $('.role').hide();
  $('#Role').change(function () {
    $('.role').hide();
    $('#'+$(this).val()).show();
  })
  $('.doc').hide();
  $('.change_time').hide();
  $('#doc').show();
  $('#doc_search').change(function () {
    $('.doc').hide();
    $('#'+$(this).val()).show();
  })

  $(".remove").click(function() {
      if (confirm('ยืนยันการลบ?'))
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
                $('#appointment_doctor_id').val('')
                $('#doc_names').focus()
          }
        },
    select: function(event, ui) {
          $('#doc_names').val(ui.item.label)
          $('#schedule_doctor_id').val(ui.item.value)
          $('#appointment_doctor_id').val(ui.item.value)
          return false;
      }
    })

  $('#pat_names').autocomplete({
    source: $('#pat_names').data('autocomplete-source'),
    change: function(event,ui) {
          if (ui.item===null) {
                console.log('hi')
                $('#pat_names').val('')
                $('#appointment_patient_id').val('')
                $('#pat_names').focus()
          }
        },
    select: function(event, ui) {
          $('#pat_names').val(ui.item.label)
          $('#appointment_patient_id').val(ui.item.value)
          return false;
      }
    })

    $('#pro_names').autocomplete({
      source: $('#pro_names').data('autocomplete-source'),
      change: function(event,ui) {
            if (ui.item===null) {
                  console.log('hi')
                  $('#pro_names').val('')
                  $('#pro_names').focus()
            }
          },
      select: function(event, ui) {
            $('#pro_names').val(ui.item.label)
            return false;
        }
      })


  $('input[class="daterange"]').daterangepicker({});
  $('input[class="daterange"]').val('');
  $('input[class="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
    $('input[class="daterange"]').val('');
  });

  var slot_no = 2;
  $(".add-schedule").click(function() {
    console.log('hi')
    $('.schedule-slot#'+slot_no).show();
    console.log(slot_no)
    if(slot_no == 5) {
      $(".add-schedule").hide();
    }
    slot_no++
  })


  $(".get_avail").click(function() {
    console.log($('#pro_names').val())
    $.ajax({
        url: '/get_avail',
        type: 'GET',
        data: { pro: $('#pro_names').val() ,
                doc: $('#appointment_doctor_id').val(),},
        dataType: 'json' ,
        complete: function() {},
        success: function(data) {
              if(data.avail[0] == undefined){
                $('.change_time').hide();
                $('#appointment_date').val("ไม่มีเวลาที่ใช้ได้")
              }
              else{
              $('.change_time').show();
              $('#appointment_date').val(shiftDisplay(data.shift[0]) + data.avail[0])
              var i = 1
              $('.change_time').click(function(){
                console.log("shit")
                $('#appointment_date').val(shiftDisplay(data.shift[i]) + data.avail[i])
                i = (i+1)%data.avail.length
              })

              }


                      },
        error: function() {
                        alert("Ajax error!")
        }
      })
  })



};

$(document).ready(ready);
$(document).on('page:change', ready);
