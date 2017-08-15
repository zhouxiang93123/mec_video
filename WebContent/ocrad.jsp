<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
	<style type="text/css">
	div.center {text-align:center; }
	input.fixedwidth {width:160px;}
	
	</style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
    <!--页面标题-->
    <title>图像识别</title>
    <!--引入bootstrap样式--> 
    
    <link href="https://cdn.bootcss.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" rel="stylesheet">    
    <link href="https://cdn.bootcss.com/flat-ui/2.3.0/css/flat-ui.min.css" rel="stylesheet">

</head>
<body style="background-color: #fff;">
    <iframe name="uploadfrm" id="uploadfrm" style="display: none;"></iframe>  
    <form name="formHead" method="post" action="" id="formHead" enctype="multipart/form-data" target="uploadfrm">  
  
        <div>  
            <div>  
                <input type="file" name="file_head" id="file_head" onchange="javascript:setImagePreview();" />  
            </div>  
            <div>  
                <div id="DivUp" style="display: none">  
                    <input type="submit" data-inline="true" id="BtnUp" value="确认上传" data-mini="true" />  
                </div>  
            </div>  
        </div>  
    </form>  
    <div data-role="fieldcontain">  
        <div id="localImag">  
            <img id="preview" width="-1" height="-1" style="display: none" />  
        </div>  
    </div>  
          
  
    <script type="text/javascript">  
        function setImagePreview() {  
            var preview, img_txt, localImag, file_head = document.getElementById("file_head"),  
            picture = file_head.value;  
            if (!picture.match(/.jpg|.gif|.png|.bmp/i)) return alert("您上传的图片格式不正确，请重新选择！");
            if (preview = document.getElementById("preview"), file_head.files && file_head.files[0]) preview.style.display = "block",  
                preview.style.width = "400px",  
                preview.style.height = "400px",  
                preview.src = window.navigator.userAgent.indexOf("Chrome") >= 1 || window.navigator.userAgent.indexOf("Safari") >= 1 ? window.webkitURL.createObjectURL(file_head.files[0]) : window.URL.createObjectURL(file_head.files[0]);  
            else {  
                file_head.select(),  
                file_head.blur(),  
                img_txt = document.selection.createRange().text,  
                localImag = document.getElementById("localImag"),  
                localImag.style.width = "400px",  
                localImag.style.height = "400px";  
                try {  
                    localImag.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)",  
                    localImag.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = img_txt  
                } catch(f) {  
                    return alert("您上传的图片格式不正确，请重新选择！");
                }  
                preview.style.display = "none",  
                document.selection.empty()  
            }  
            return document.getElementById("DivUp").style.display = "block";
        }  
    </script>  

<!--引入jquery脚本-->
<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/tether/1.4.0/js/tether.min.js"></script>
<!--引入bootstrap脚本-->
<script src="https://cdn.bootcss.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"></script>
<!-- 引入flatUI -->
<script src="https://cdn.bootcss.com/flat-ui/2.3.0/js/flat-ui.js"></script>
<script src="<%=basePath%>signIn/ocrad.js"></script>
</body>
</html>