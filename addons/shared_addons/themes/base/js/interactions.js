$(window).resize(function() {
	//Responsive menu for mobile devices: 
	var nb = $('#navbtn');
  	var n = $('.event_right_menu');

    if(nb.is(':hidden') && n.is(':hidden') && $(window).width() > 644) {
	      // if the navigation menu and nav button are both hidden,
	      // then the responsive nav is closed and the nav menu is still hidden.
	      // just display the nav menu which will auto-hide at <560px width and remove class.
	      $('.event_right_menu').show();
	}

	if($(this).width() < 645) {
	  // if the nav menu and nav button are both visible,
	  // then the responsive nav transitioned from open to non-responsive, then back again.
	  // re-hide the nav menu and remove the hidden class
	  $('.event_right_menu').hide();
	}

	
}); 



function initAddThis() 
{
	addthis.init()
}


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
/*
	$('.event_right_menu a,.event_right_menu h1 a,#btmnav a').on('click', function(e){
		  e.preventDefault(); // stop all hash(#) anchor links from loading
	});
*/

	//mobile layout menu button	 
	$('#navbtn').on('click', function(e){
		  e.preventDefault();
		$(".event_right_menu").toggle(350);//slideToggle(350);
	});
	//End of reponsive menu

	
	//when clicking newsletter open box:
    $('#newsletter_label').click(function() {
    	//when clicking newsletter button, toggle newsletter box 
    	width_retrieved=$(window).width();
		if(width_retrieved<641){
		 	//if New width<641 : if we are in mobile layout toogle box
		 	$('#newsletter_menu_box').toggle();
		}; 	
    });
    
	$('.btn_show_content').toggle(function () {  
    		$(".event_info").show();
	
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
    		$(".event_info").hide();
	    
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
    });
    //NEWSLETTER SIGNUP code 
    $('#signup').submit(function() {
	    $("#message").html("<p>Adding your email address...</p>");
	    $.ajax({
	        type: 'POST',
	        url: '<?php echo base_url()."newsletter/subscribe/";?>', // proper url to your "store-address.php" file
	        data: $('#signup').serialize(),
	        success: function(msg) {
	            
	            //remove "Adding your email address..." message
	            $("#message").html('');
	            
	            //get message returned
	        	var data = $.parseJSON(msg);
	        	
	        	/* $("#newsletter_name_error").title("ERROR");//data.newsletter_name); */
				if(data.subscribe_ok){
					$("#message").html("<p>"+data.subscribe_ok+"</p>"); //here no need or <p>, automatically added
					
					
					$('#newsletter_menu_box').toggle(4000);
	
				}else if(data.subscribe_error){
					$("#message").html("<span class='red_text'>"+data.subscribe_error+"</span>");
				} 						
				
	/* Using tooltips to show error messages
				if(data.newsletter_email){
			            $("#newsletter_email_error").attr('title',data.newsletter_email);
			            $("#newsletter_email_error").tipsy("show");
										}
		            else if(data.newsletter_name){
			            $("#newsletter_name_error").attr('title',data.newsletter_name);//data.newsletter_name);
			            $("#newsletter_name_error").tipsy("show");   			            
		            }
	*/
	/*    			            $("#newsletter_email_error").title(data.newsletter_email); */
	
	            //$("#newsletter_name_error").html(msg.newsletter_name);
	            
	            
	            //$("#newsletter_email_error").html(msg.newsletter_email);
	            
	            //$('#message').html(msg);
	        },
	        error:function(msg) {
	        	alert("Error in POST");
	            //$("#newsletter_name_error").html(msg.newsletter_name);
	            //$("#newsletter_email_error").html(msg.newsletter_email);
	            
	            //$('#message').html(msg);
	        },
	    });
    return false;
    });

	//Fixing placeholder for non HTML5 browsers
	if(!Modernizr.input.placeholder){
	
	    $("input").each(function(){
	    	//console.log("BROWSER NON HTML5");
		    	var inputField = $(this);
		    	if(inputField.val()=="" && inputField.attr("placeholder")!=""){
	
			    	inputField.val(inputField.attr("placeholder"));
	
			    	inputField.focus(function(){
				    	if(inputField.val()==inputField.attr("placeholder")){ inputField.val(""); }
				    });
	
				    inputField.blur(function(){
					    if(inputField.val()==""){ 
					    	inputField.val(inputField.attr("placeholder")); 
					    }
					});
				}
		});
	}
	
	//load addthis:
	initAddThis();

	addthisevent.refresh();
});