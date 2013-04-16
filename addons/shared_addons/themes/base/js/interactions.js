$(document).ready(function() { 

	//Get collapsed height:
	var collapsedHeight = $('.event_content').css('maxHeight');

	/* var currentHeight = $('.event_content').scrollHeight;*/

	/*
    $('.event_content').each(function(){
      var $this = $(this);
      $this.data('natural', $this[0].scrollHeight);
    });

    // Now, set-up the handler for the toggle buttons
    $('#btn_show_content').bind('click', function(){
      var $story = $(this).parent().siblings('.story').eq(0),
          duration = 250; // animation duration

      // I use a class 'expanded' as a flag to know what state it is in,
      // and to make style changes, as required.  
      if ($story.hasClass('expanded')) {
        // If it is already expanded, then collapse it using the css figure as
        // collected above and remove the expanded class
        $story.animate({'maxHeight': collapsedHeight}, duration);
        $story.removeClass('expanded');
      }
      else {
        // If it is not expanded now, then animate the max-height to the natural
        // height as stored in data, then add the 'expanded' class
        $story.animate({'maxHeight': $story.data('natural')}, duration);
        $story.addClass('expanded');
      }
    });
    */
    
    
	$('.btn_show_content').toggle(
    	function () {  
    	
    		console.log("Button pressed");

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
	    	$(this).val("-");  //change button to minus
	    
	    
	    },
	    function () { 
    
   		console.log("Button pressed");

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
	    
    	$(this).val("+"); 
    }
);});