//= require jquery
//= require jquery_ujs
//= require popper
//= require bootstrap
//= require_tree .

if($('.article .article__meta_buttons').length) {
    $('.article').mousedown(function () {
        var x = document.getElementById(this.id);
        $( '.article__meta_buttons', x ).addClass( "active")
    });

    $('.article').mouseleave(function () {
        var x = document.getElementById(this.id);
        $( '.article__meta_buttons', x ).removeClass("active")
    });
}



$('#aside__toggle').click(function () {
    $('.heartlike__aside').toggleClass('toggled');
});