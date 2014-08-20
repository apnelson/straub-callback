// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.foundation
//= require turbolinks
//= require foundation
//= require_tree .
$(function() {
  $(document).foundation();
});

var ready
ready = function ()  {
    $('.datatable').dataTable()
    setupDetailClick();
    $('.datatable').on('page.dt search.dt order.dt draw.dt', function () {
      setupDetailClick();
    })
}

$(document).ready(ready);
$(document).on('page:load', ready);

function setupDetailClick() {
  $('tr.mcb-row').on('click', function () {
    $this = $(this)
    $.ajax({
          url: '/marvin_callbacks/' + $this.attr('mcb'),
          success: function (d,s,x) {
            $('#detail-modal').html(d + '<a class="close-reveal-modal">&#215;</a>').foundation('reveal', 'open');
          },
          dataType: 'html'
    });

  })
}
