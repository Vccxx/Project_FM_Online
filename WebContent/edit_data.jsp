<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<style type="text/css">
		body{
			background-image:url(image/secInfo.jpg);
			background-size:100% 100%;
		}
	</style>
	  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="js/jquery3.2.1.js"></script>
	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link href="./css/sectionInfo.css" rel="stylesheet" type="text/css">
	<script src="./js/sectionInfo.js"></script>
	<link href="https://cdn.bootcss.com/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
	<script src="https://cdn.bootcss.com/toastr.js/latest/js/toastr.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>输入营业参数</title>
</head>
<body>
<div class="container">
  <form class="form-horizontal">
    <fieldset>
      <div id="legend" class="">
        <legend class="">营业参数输入（不填默认为0）</legend>
      </div>
      <div class="control-group">
          <div class="controls">
          <label class="control-label" for="input01">填表日期</label>
            <input value="0" id="input_1" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
     </div>
    <div class="control-group">
          <h4>1.利润-收益</h4>
          <div class="controls">
          <label class="control-label" for="input01">投资收益</label>
            <input value="0" id="input_2" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">营业外收入</label>
            <input value="0" id="input_3" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>
	<h4>2.利润-支出</h4>
    <div class="control-group">
         
          <div class="controls">
           <label class="control-label" for="input01">营业成本</label>
            <input value="0" id="input_4“ placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">管理费用</label>
            <input value="0" id="input_5" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">营业外支出</label>
            <input value="0" id="input_6" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>
	<h4>3.现金流量-经营活动-收入</h4>
    <div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">佣金，手续费</label>
            <input value="0" id="input_7" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">
          
          <div class="controls">
          	<label class="control-label" for="input01">其余活动收入</label>
            <input value="0" id="input_8" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">
          <h4>4.现金流量-经营活动-支出</h4>
          <div class="controls">
          <label class="control-label" for="input01">利息，手续费及佣金</label>
            <input value="0" id="input_9" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">其他经营活动现金</label>
            <input value="0" id="input_10" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>
	<h4>5.现金流量-投资活动-收入</h4>
    <div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">回收的投资现金</label>
            <input value="0" id="input_11" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">投资收益</label>
            <input value="0" id="input_12" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>
<h4>6.现金流量-投资活动-支出</h4>
    <div class="control-group">
         
          <div class="controls">
           <label class="control-label" for="input01">投资支出</label>
            <input value="0" id="input_13" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>
	<h4>7.现金流量-筹资活动-收益</h4>
    <div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">吸收投资资金</label>
            <input value="0" id="input_14" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">发行债券收益</label>
            <input value="0" id="input_15" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>
        <h4>8.现金流量-筹资活动-支出</h4>
        <div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">还债支出</label>
            <input value="0" id="input_16" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">利润分配支出</label>
            <input value="0" id="input_17" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>
	<h4>9.资产负债</h4>
    <div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">坏账准备</label>
            <input value="0" id="input_18" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">短期负债</label>
            <input value="0" id="input_19" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div><div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">应付账款</label>
            <input value="0" id="input_20" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">固定资产原值</label>
            <input value="0" id="input_21" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>

    <div class="control-group">
          
          <div class="controls">
          <label class="control-label" for="input01">累计折旧</label>
            <input value="0" id="input_22" placeholder="" class="input-xlarge" type="text">
            <p class="help-block"></p>
          </div>
        </div>
   		<div class="control-group">
          <label class="control-label"></label>

          <!-- Button -->
          <div class="controls">
            <button class="btn btn-success" onclick="submit_form()">提交</button>
          </div>
        </div>
    </fieldset>
  </form>
</div>
<script type="text/javascript">
function submit_form(){
	var data = {}
	for (var i=1 ;i <= 22;i++){
		data["inp"+i] = $("#input_"+i).val()
	}
	$.post("inputParma.action",data,function(data,status){
		if(data == "success"){
			toastr.success("提交成功"); 
		}else{
			toastr.error("提交失败"); 
		}
	})
	
}
</script>
</body>
</html>