//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require_tree .

if ($('.article .article__meta_buttons').length) {

    $(document).on("mousedown", ".article", function () {
        var x = document.getElementById(this.id);
        $('.article__meta_buttons', x).addClass("active")
    });

    $(document).on("mouseleave", ".article", function () {
        var x = document.getElementById(this.id);
        $('.article__meta_buttons', x).removeClass("active")
    });
}


$('#aside__toggle').click(function () {
    $('.heartlike__aside').toggleClass('toggled');
});