$(window).resize(function() {
});

$(document).ready(function() { 
	
	//uncomment to disable temporarily html5 form validation
/*
	$( "input" ).each(
    function()
    {
        var $input  =   $( this ).attr( "required",false );
        // certain input types shouldn't be changed
        var typesToIgnore   =   /(button|checkbox|file|hidden|image|radio|submit)/i;
        var inputType   = $input.attr( "type" );
        if( inputType.search( typesToIgnore ) > -1 )
            return true;// skip to the next iteration
        // change the input type by temporarily detaching it from the DOM
        $temporaryMarker    =   $( "<b />" ).insertBefore( $input );
        $input
            .detach()
            .attr( "type","text" )
            .insertAfter( $temporaryMarker );
        $temporaryMarker.remove();
    }
    );
*/
	//end of html5 form validation disabling.
	
	
	//when clicking newsletter open box:
    $('#newsletter_label').click(function() {
    	//when clicking newsletter button, toggle newsletter box 
    	width_retrieved=$(window).width();
		if(width_retrieved<641){
		 	//if New width<641 : if we are in mobile layout toogle box
		 	$('#newsletter_menu_box').toggle();
		}; 	
    });
    
	$('.btn_show_content').toggle(
    	function () {  
    		var current_content = $(this).parent().children('.event_content');
    		var currentHeight=$(current_content)[0].scrollHeight;
    		    	
	    	$(this).parent().children('.event_content').animate({height:currentHeight,maxHeight:currentHeight},500);
	    	/*
	    	.animate({
		    	height:'390px'
	    	},500);
	    	*/
	    	
	    	/*
	    	$(current_content).animate({
		    	height:currentHeight
	    	},500);
	    	*/
	    	
	    	//replace image
	    	//var src = $(this).attr("src").match(/[^\.]+/) + "collapse.png";
	    	//this.src = src;
	    	if (document.location.hostname == "localhost"){
	    		this.src = 'http://localhost:8888/designcms/addons/shared_addons/themes/base/img/collapse.png';
	    		this.id = "collapse_button";
	    		this.title = "Show less";
	    		this.alt = "Show less";
	    	}else{
		    	this.src = 'http://'+document.location.hostname+'/addons/shared_addons/themes/base/img/collapse.png';
	    		this.id = "collapse_button";
	    		this.title = "Show less";
	    		this.alt = "Show less";
	    	}
            //$(this).attr("src", src);
	    	//$(this).val("-");  //change button to minus
	    
	    
	    },
	    function () { 
        	var current_content = $(this).parent().children('.event_content');
        	$(this).parent().children('.event_content').animate({
		    	height:'70px',
		    	maxHeight :'70px'
	    	},500);

	    /*	
    	$(current_content).animate({
		    	height:'70px',
		    	maxHeight :'70px'
	    	},500);
	    */
	    
	    	//replace image
	    	//this.src = '/addons/shared_addons/themes/base/img/expand.png';
	    	//var src = $(this).attr("src").match(/[^\.]+/) + "expand.png";
	    	//this.src = src;
	    	if (document.location.hostname == "localhost"){
	    		this.src = 'http://localhost:8888/designcms/addons/shared_addons/themes/base/img/expand.png';
	    		this.id = "expand_button";
	    		this.title = "Show more";
	    		this.alt = "Show more";
	    	}else{
		    	this.src = 'http://'+document.location.hostname+'/addons/shared_addons/themes/base/img/expand.png';
	    		this.id = "expand_button";
	    		this.title = "Show more";
	    		this.alt = "Show more";
	    	}

            
            //var src = $(this).attr("src").match(/[^\.]+/) + "expand.png";
            //$(this).attr("src", src);
	    	//$(this).val("+"); 
    }
);});