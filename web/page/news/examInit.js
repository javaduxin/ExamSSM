layui.use(['form','layer','jquery'],function(){
	var form = layui.form,
		layer = parent.layer === undefined ? layui.layer : top.layer,
		laypage = layui.laypage,
		$ = layui.jquery;

 	var systemParameter;
 	form.on("submit",function(data){
 		if(data.field.mids==-1){
 			layer.msg("请选择考试");
			return false;
		}
 		window.location.href = "exam.html";
 		return false;
 	})

	//获取当前登录人的姓名
	$("#myname").html(sessionStorage.getItem("uname"));
	$("#classesName").html(sessionStorage.getItem("classesName"));

	//考试信息
	var menuData=[];

	//加载考试列表
	$.ajax({
		url:"/loadExam/"+sessionStorage.getItem("uid"),
		success:function (data) {
            menuData=data;
			var html='<option value="-1">请选择</option>';
			for(var i=0;i<data.length;i++){
                html+='<option value="'+data[i].id+'">'+data[i].title+'</option>';
			}

			$("#mids").html(html);

			//重新加载表单
            form.render();
        }
	})
	//用户选择下拉列表，更改信息
    form.on('select', function(data){

		for(var i=0;i<menuData.length;i++){
			if(data.value==menuData[i].id){
				$('#scoreTime').html(menuData[i].scoreTime);
                $('#sumScore').html(menuData[i].sumScore);
                break;
			}
		}
    });



    //加载默认数据
 	if(window.sessionStorage.getItem("systemParameter")){
 		var data = JSON.parse(window.sessionStorage.getItem("systemParameter"));
 		fillData(data);
 	}else{
 		$.ajax({
			url : "../../json/systemParameter.json",
			type : "get",
			dataType : "json",
			success : function(data){
				fillData(data);
			}
		})
 	}

 	//填充数据方法
 	function fillData(data){
 		$(".version").val(data.version);      //当前版本
		$(".author").val(data.author);        //开发作者
		$(".homePage").val(data.homePage);    //网站首页
		$(".server").val(data.server);        //服务器环境
		$(".dataBase").val(data.dataBase);    //数据库版本
		$(".maxUpload").val(data.maxUpload);  //最大上传限制
		$(".userRights").val(data.userRights);//当前用户权限
		$(".cmsName").val(data.cmsName);      //模版名称
		$(".description").val(data.description);//站点描述
		$(".powerby").val(data.powerby);      //版权信息
		$(".record").val(data.record);      //网站备案号
		$(".keywords").val(data.keywords);    //默认关键字
 	}
 	
})
