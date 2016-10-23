

$(document).ready(function(){
	
	$('.search-close').click(function(){
			
			$('.search-wrapper').fadeOut();
			
			$('.nav').fadeIn();
			$('.search-button .sea').fadeIn();
		})
		
		$('.search-button .sea').click(function(){
			
			$('.search-wrapper').fadeIn();
			$('.nav').fadeOut();
			$('.search-button .sea').fadeOut();
		
		})

		$(window).scroll(function() {
		var bodyH = $(document).scrollTop();
		
		 if (bodyH>600) {
			
			$(".headerfix").slideDown('fast');
			$(".logo-1").animate({'left':'0px'},300);
			
	} else {
		  $(".logo-1").animate({'left':'-195px'},10);
		  $(".headerfix").hide();
			
		}
		});	
		
		$(".headerfix").hover(function(){
				$(".header-bom1").css('opacity','1');
			},function(){
				$(".header-bom1").css('opacity','0.9');	
				
				})
		
		
	

	$('.nav li a').hover(function(){
		$('span',this).stop().css('height','1px');
		$('span',this).animate({
			left:'0',
			width:'100%',
			right:'0'
		},200);
	},function(){
		$('span',this).stop().animate({
			left:'50%',
			width:'0'
		},200);
	});

	
	
	
	//var $t, leftX, newWidth;

	//$('.header_list .nav').append('<div class="block"></div>');
	//var $block = $('.block');

	//$block.width($(".current").width()).css('left', $('.current a').position().left).data('rightLeft', $block.position().left).data('rightWidth', $block.width());

//	$('.header_list .nav li').find('a').hover(function() {
	//	$t = $(this);
		//leftX = $t.position().left;
		//newWidth = $t.parent().width();

	//	$block.stop().animate({
		//	left: leftX,
		//	width: newWidth
		//},300);
	//}, function() {
		//$block.stop().animate({
		//	left: $block.data('rightLeft'),
			//width: $block.data('rightWidth')
		//},300)
//	})
	
	
	
	
//-------------------banner

	var num=$('.banner_span span').length;
	var i_mun=0;
	var timer_banner=null;

	$('.banner_ul li:gt(0)').hide();//页面加载隐藏所有的li 除了第一个
	
//底下小图标点击切换
	$('.banner_span span').click(function(){
		$(this).addClass('banner_span_one')
			   .siblings('span').removeClass('banner_span_one');
		var i_mun1=$('.banner_span span').index(this);
		$('.banner_ul li').eq(i_mun1).fadeIn('slow') .siblings('li').fadeOut('slow');

		i_mun=i_mun1;
		
		
		
		
		
		
		
		
	});
	
//左边箭头点击时切换
	$('.banner_left').click(function(){
		if(i_mun==0){
			i_mun=num
		}
		//大图切换
		$('.banner_ul li').eq(i_mun-1).fadeIn('slow') .siblings('li').fadeOut('slow');
		//小图切换
		$('.banner_span span').eq(i_mun-1).addClass('banner_span_one') .siblings('span').removeClass('banner_span_one');

		i_mun--
	});


//右边箭头点击时切换
	$('.banner_right').click(function(){
		move_banner()
		
	});

	
	//自动播放函数
	function bannerMoveks(){
		timer_banner=setInterval(function(){
			move_banner()
		},4000)
	};
	bannerMoveks();//开始自动播放

	

	
	//鼠标移动到banner_main上时停止播放,离开时开启定时器
	$('.banner_main').hover(function(){
		clearInterval(timer_banner);
	},function(){
		bannerMoveks();
	});
	
	
	

//banner 右边点击执行函数
   function move_banner(){
			if(i_mun==num-1){
				i_mun=-1
			}
			//大图切换
			$('.banner_ul li').eq(i_mun+1).fadeIn('slow')
									   .siblings('li').fadeOut('slow');
			//小图切换
			$('.banner_span span').eq(i_mun+1).addClass('banner_span_one')
					   .siblings('span').removeClass('banner_span_one');
		
			
			
			
			
			i_mun++
		
		}
		
$(window).scroll(function() {
		var bodyH = $(document).scrollTop();
		
		 if (bodyH>700) {
			$(".posibox").fadeIn(300);
	} else {
			$(".posibox").fadeOut(300);
		}
		});
	


//---------------------------end首页


//投资型首页






//投资型和回报型首页banner
	$('.itembtn_a1').animate({'left':'200px','opacity':'1'},1000)
	$('.itembtn_a2').animate({'right':'200px','opacity':'1'},1000)






})















