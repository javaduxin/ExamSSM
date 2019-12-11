layui.use(['form','layer','laydate','table','laytpl'],function(){
    var form = layui.form,
        layer = parent.layer === undefined ? layui.layer : top.layer,
        $ = layui.jquery,
        laydate = layui.laydate,
        laytpl = layui.laytpl,
        table = layui.table;

    //考试结果列表
    var tableIns = table.render({
        elem: '#newsList',
        url : '/queryResult',
        cellMinWidth : 95,
        page : true,
        height : "full-125",
        limit : 20,
        limits : [10,15,20,25],
        //id : "newsListTable",
        cols : [[
            {type: "checkbox", fixed:"left", width:50},
            {field: 'user', title: '用户ID', width:60, align:"center",templet:function(d){
                    return d.user.id;
            }},
            {field: 'user', title: '姓名', align:'center',templet:function(d){
                    return d.user.uname;
            }},
            {field: 'menu', title: '试卷名称',  align:'center',templet:function(d){
                    return d.menu.title;
                }},
            {field: 'menu', title: 'mid', align:'center',hide:true,templet:function(d){
                    return d.menu.id;
            }},
            {field: 'result', title: '分数', align:'center'},
            /*{field: 'newsTop', title: '是否置顶', align:'center', templet:function(d){
                return '<input type="checkbox" name="newsTop" lay-filter="newsTop" lay-skin="switch" lay-text="是|否" '+d.newsTop+'>'
            }},*/
            {field: 'time', title: '考试时间', align:'center', minWidth:110},
            {field: 'info', title: '结果', align:'center',hide:true},

            {title: '操作', width:170, templet:'#newsListBar',fixed:"right",align:"center"}
        ]]
    });

    //是否置顶
    form.on('switch(newsTop)', function(data){
        var index = layer.msg('修改中，请稍候',{icon: 16,time:false,shade:0.8});
        setTimeout(function(){
            layer.close(index);
            if(data.elem.checked){
                layer.msg("置顶成功！");
            }else{
                layer.msg("取消置顶成功！");
            }
        },500);
    })

    //搜索【此功能需要后台配合，所以暂时没有动态效果演示】
    $(".search_btn").on("click",function(){
        if($(".searchVal").val() != ''){
            table.reload("newsListTable",{
                page: {
                    curr: 1 //重新从第 1 页开始
                },
                where: {
                    key: $(".searchVal").val()  //搜索的关键字
                }
            })
        }else{
            layer.msg("请输入搜索的内容");
        }
    });

    //添加文章
    function addNews(edit){
        var index = layui.layer.open({
            title : "添加文章",
            type : 2,
            content : "examAdd.html",
            success : function(layero, index){
                var body = layui.layer.getChildFrame('body', index);
                if(edit){
                    body.find(".newsName").val(edit.newsName);
                    body.find(".abstract").val(edit.abstract);
                    body.find(".thumbImg").attr("src",edit.newsImg);
                    body.find("#news_content").val(edit.content);
                    body.find(".newsStatus select").val(edit.newsStatus);
                    body.find(".openness input[name='openness'][title='"+edit.newsLook+"']").prop("checked","checked");
                    body.find(".newsTop input[name='newsTop']").prop("checked",edit.newsTop);
                    form.render();
                }
                setTimeout(function(){
                    layui.layer.tips('点击此处返回文章列表', '.layui-layer-setwin .layui-layer-close', {
                        tips: 3
                    });
                },500)
            }
        })
        layui.layer.full(index);
        //改变窗口大小时，重置弹窗的宽高，防止超出可视区域（如F12调出debug的操作）
        $(window).on("resize",function(){
            layui.layer.full(index);
        })
    }
    $(".addNews_btn").click(function(){
        addNews();
    })

    //批量删除
    $(".delAll_btn").click(function(){
        var checkStatus = table.checkStatus('newsListTable'),
            data = checkStatus.data,
            newsId = [];
        if(data.length > 0) {
            for (var i in data) {
                newsId.push(data[i].newsId);
            }
            layer.confirm('确定删除选中的文章？', {icon: 3, title: '提示信息'}, function (index) {
                // $.get("删除文章接口",{
                //     newsId : newsId  //将需要删除的newsId作为参数传入
                // },function(data){
                tableIns.reload();
                layer.close(index);
                // })
            })
        }else{
            layer.msg("请选择需要删除的文章");
        }
    })

    //列表操作
    table.on('tool(newsList)', function(obj){
        var layEvent = obj.event,
            data = obj.data;

        if(layEvent === 'edit'){ //编辑
            addNews(data);
        } else if(layEvent === 'del'){ //删除
            layer.confirm('确定删除此文章？',{icon:3, title:'提示信息'},function(index){
                // $.get("删除文章接口",{
                //     newsId : data.newsId  //将需要删除的newsId作为参数传入
                // },function(data){
                    tableIns.reload();
                    layer.close(index);
                // })
            });
        } else if(layEvent === 'look'){ //预览
            var data1 = obj.data;



            //获取考试结果
            var info=data1.info;
            //结果数组
            var infos=[];
            for(var i=0;i<info.length;i++){
                infos[i]=info.substring(i,i+1);
            }
            //正确答案
            var answer=[];

            //加载正确答案
            $.ajax({
                url:"/queryExamAnswer?mid="+data1.menu.id,
                success:function (data){
                    for(var i=0;i<data.length;i++){
                        answer[i]=data[i].answer;
                    }

                    var html='<div class="layui-btn-container">';

                    for(var i=0;i<infos.length;i++){

                        if(answer[i]=="A"&&infos[i]=="1"){
                            html+='<button type="button" class="layui-btn">'+infos[i]+'</button> ';
                        } else if(answer[i]=="B"&&infos[i]=="2"){
                            html+='<button type="button" class="layui-btn">'+infos[i]+'</button> ';
                        } else if(answer[i]=="C"&&infos[i]=="3"){
                            html+='<button type="button" class="layui-btn">'+infos[i]+'</button> ';
                        } else if(answer[i]=="D"&&infos[i]=="4"){
                            html+='<button type="button" class="layui-btn">'+infos[i]+'</button> ';
                        }else{
                            html+='<button type="button"  class="layui-btn layui-btn-danger">'+infos[i]+'</button> ';
                        }
                    }
                    html+= '</div>';
                    layer.open({
                        area: ['60%', '40%'],
                        title:"考试结果",
                        content:html
                    })
                }
            })






        }
    });

})