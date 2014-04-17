$(document).ready(function() {
    var link_string = $("#links").val();
    link_string = link_string.slice(1,-1);
    links = link_string.split(',');
    num_links = links.length;
    $("#total_num").html(""+num_links);
    requestInfo(0);
});
function requestInfo(link_no) {
    if (link_no != num_links) {
	$("#current_num").html(""+link_no);
	$.ajax({
	    url : "/populate_videos_confirmation",
	    data : {
		'link' : links[link_no]
	    },
	    success : function(data, status,xhr) {
		generateFormLine(data);
	    },
	    complete : function(xhr, status) {		
		requestInfo(link_no+1);
	    },	    
	    type : 'get'
	});   
    } else {
	$("#fetch_status").html("Done fetching video information");
    }
}

function generateFormLine(data) {
    var new_tr = $("<tr>");

    fields = ["video_id", "subject", "course", "title"];
    var id = data["video_id"]
    if (! id) {
	return;
    }
    for (i=0; i<fields.length; i++) {
	var field = fields[i];
	var new_td = generate_td(id, field, data[field]);
	new_tr.append(new_td);
    }

    $("#list_table").append(new_tr);    
}

function generate_td(id, name, value) {
    var name_prefix = "videos["+id+"]"
    var td = $("<td>");
    var input = $('<input type="text" name="'+name_prefix+name+'" value="'+value+'"/>')
    td.append(input);
    return td;

}