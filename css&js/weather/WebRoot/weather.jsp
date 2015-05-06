<!doctype html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8">
		<title>实时天气</title>
		<meta name="keywords" content="天气">	
		<link type="text/css" rel="stylesheet" href="css/animate.min.css" />
		<style type="text/css">
			*{margin:0;padding:0;}
			body{font-size:12px;font-family:"微软雅黑";color:#666;background: #fff url('images/east-ep-a01-2372910.jpg') no-repeat top center;}
			/*change start*/
			.change{width:300px;height:50px;margin:50px auto;font-size:20px;color:#fff;}
			/*change end*/
			/*weather start*/
			.weather{width:1000px;height:200px;margin: 0 auto;}
			.weather .w_list{width:200px;height:200px;float:left;color:#fff;}
			.weather .w_list h2,p{text-align:center;line-height:24px}
			.weather .w_list h2{font-size:18px;font-weight:600;}
      /*weather end*/
		</style>
  </head>
	<body>
		<!--change start-->
		<div class="change">
			请选择所在城市：
			<select>
				<option>--请选择城市--</option>
				<option value="1670">湖南（长沙）</option>
				<option value="2046">浙江（长兴）</option>
				<option value="1344">陕西（西安）</option>
				<option value="2000">江苏（常熟）</option>
				<option value="923" >山东（朝城）</option>
			</select>
		</div>
		<!--change end-->
		<!--weather start-->
		<div class="weather">
			<div class="w_list" id = "tdweather"></div>
			<div class="w_list" id = "tdweather1"></div>
			<div class="w_list" id = "tdweather2"></div>
			<div class="w_list" id = "tdweather3"></div>
			<div class="w_list" id = "tdweather4"></div>
		</div>
		<!--weather end-->
	<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			var code = "1919";
			$.ajax({
				type:"post",
				url:"data.jsp",
				data:{"code":code},
				success:function(data){
					var json = eval("("+data+")");
					alert(json);
					var proyince = json[0];
					var city = json[1];
					var time = json[2];
					var dataMessage = json[4];
					var sunMessage = json[5];
					var tday = json[6];
					var wd = json[7];
					var fx = json[8];
					var twendu = json[9];
					var agif = json[10];
					var wgif = json[11];
					var firstday = json[12];
					var firstdu = json[13];
					var firstfeng = json[14];
					var firstg1 = json[15];
					var firstg2 = json[16];
					var html = "<div class='w_list'>";
					 html+="<p>"+proyince+"</p>";
					 html+="<p>"+city+"</p>";
					 html+="<p>"+time+"</p>";
					 html+="<p><img src='images/weather/4a1c4d2294.png' width='110px' height='110px' alt='阴天' /></p>";
					 html+="</div>";
					$("#tdweather").html(html);
					
				}
			});
			
		});
	</script>	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</body>
</html>