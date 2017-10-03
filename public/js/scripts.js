var s = Snap('svg');
var text = 'Some Long Texts'
var len = text.length;
var array = [];
for (var x = 0; x < len; x++) {
  var t = text[x]
  array.push(t);
}
var txt = s.text(50, 50, array)
$('tspan').css({
  'font-size': 50,
  fill: 'none',
  stroke: 'red',
  'stroke-dasharray': 300,
  'stroke-dashoffset': 300
})

$('tspan').each(function(index) {
  $(this).stop(true, true).delay(800 * index).animate({
    'stroke-dashoffset': 0,
  }, 800, function() {
    $(this).css('fill', 'red')
  })
})
