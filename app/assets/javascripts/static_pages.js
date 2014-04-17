$(document).ready(function() {
    $("#import_videos").click(show_import);
});

function show_import() {
    //Show new pop-up allowing users to input a csv file
    $("#import_videos_form").css("position", "fixed");
    $("#import_videos_form").toggle();    
    return false;
}
