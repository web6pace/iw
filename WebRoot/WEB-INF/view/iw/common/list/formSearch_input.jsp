<% /* 
	列表页面，顶部的搜索框，input 默认是 type=text 的搜索，除非传入iw_type 
	共有三个参数：
	iw_label：必填，输入框前的说明文字
	iw_name：必填，输入框的name，即 <input name="" 这里的name的值
	iw_type：选填，输入框的类型，type，即 <input type="text" 这里的type的值，不配置默认是text类型。此当前支持两种类型：
				text：文本输入
				select：<select> 选择标签。使用此时，需引入状态缓存的js如：News_status.js
			  
*/ %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%

//Label 的显示的标题
String iw_label = request.getParameter("iw_label");
//<input name="" 这里的name的值
String iw_name = request.getParameter("iw_name");
//type：[text,select]
Object typeObj = request.getParameter("iw_type");
String iw_type = "text";
if(typeObj != null){
	iw_type = typeObj.toString();
}
%>
<label class="layui-form-label"><%=iw_label %></label>
<div class="layui-input-inline" style="width: 100px; float:left;">
<%
if(iw_type.equals("text")){
%>
	<input style="width:100px;" type="text" name="<%=iw_name %>" placeholder="" value='<%=request.getParameter(iw_name)==null? "":request.getParameter(iw_name)  %>' autocomplete="off" class="layui-input">
<%
}else if(iw_type.equals("select")){
%>
		<script type="text/javascript">writeSelectAllOptionFor<%=iw_name %>('<%=request.getParameter(iw_name) %>');</script>
<% } %>
</div>