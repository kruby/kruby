$(document).ready ->
  
  # Her holdes der øje med hver href [Vis] over hele siden og når de klikkes.
  $("*[href^=\\/hours\\/years_show\\/]").click ->
    $.get $(this).attr("href"), $(this), null, "script"
    false

  $("*[href^=\\/hours\\/years_show_all\\/]").click ->
    $.get $(this).attr("href"), $(this), null, "script"
    false

$ ->
	console.log 'fisk'