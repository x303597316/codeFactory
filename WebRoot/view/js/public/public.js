function showOpen(url,width,height){
	var ran=parseInt(Math.random()*100);url+="&ran="+ran;
	var vsn=navigator.appVersion;	
	var mm=vsn.indexOf("MSIE 6.0");
	if(mm!=-1){height=height;}
	var swidth=screen.availWidth;	
	var sheight=screen.availHeight;
	var shape="width="+width;		
	shape=shape+",height="+height;
	shape=shape+",resizable=yes";	
	shape=shape+",left="+(swidth-width)/2;	
	//shape=shape+",left=0px";	
	shape=shape+",menubar=no";		
	shape=shape+",top="+(sheight-height)/2;
	//shape=shape+",top=0px";
	shape=shape+",scrollbars=yes";	
	shape=shape+",status=yes";
	shape=shape+",location=no";		
	window.open(url,ran,shape);	
}
function showOpen_Ex(url,width,height){
	var ran=parseInt(Math.random()*100);url+="&ran="+ran;
	var vsn=navigator.appVersion;	
	var mm=vsn.indexOf("MSIE 6.0");
	if(mm!=-1){height=height;}
	var swidth=screen.availWidth;	
	var sheight=screen.availHeight;
	var shape="width="+width;		
	shape=shape+",height="+height;
	shape=shape+",resizable=yes";	
	//shape=shape+",left="+(swidth-width)/2;	
	shape=shape+",left=0px";	
	shape=shape+",menubar=no";		
	//shape=shape+",top="+(sheight-height)/2;
	shape=shape+",top=0px";
	shape=shape+",scrollbars=yes";	
	shape=shape+",status=yes";
	shape=shape+",location=no";		
	window.open(url,ran,shape);	
}
function showOpenFull(url){
	var ran=parseInt(Math.random()*100);url+="&ran="+ran;
	var swidth=screen.availWidth-10;	
	var sheight=screen.availHeight-60;
	var shape="width="+swidth;
	shape=shape+",height="+sheight;
	shape=shape+",left=0px,top=0px";
	shape=shape+",menubar=no,location=no";	
	shape=shape+",scrollbars=yes";
	shape=shape+",resizable=yes";		
	shape=shape+",status=yes";
	window.open(url,ran,shape);	
}
//通过
function newProcessInst(url){
	var w = screen.availWidth-10;
	var h = screen.availHeight-35;
	var flag=showOpen_Ex(url,w,h);
}
function showDialog(url,width,height){
	var ran=parseInt(Math.random()*100);url+="&ran="+ran;	
	var vsn=navigator.appVersion;	var mm=vsn.indexOf("MSIE 6.0");
	if(mm!=-1){height=height+55;}
	var shape="status:yes";			shape+=";dialogWidth:"+width+"px";
	shape+=";help:no";				shape+=";dialogHeight:"+height+"px";	
	shape+=";resizable:no";			shape+=";center:yes";		
	return window.showModalDialog(url,window,shape);
}
function showModeless(url,width,height){
	var ran=parseInt(Math.random()*100);url+="&ran="+ran;
	var vsn=navigator.appVersion;	var mm=vsn.indexOf("MSIE 6.0");
	if(mm!=-1){height=height+55;}
	var shape="status:yes";			shape+=";dialogWidth:"+width+"px";
	shape+=";help:no";				shape+=";dialogHeight:"+height+"px";	
	shape+=";resizable:no";			shape+=";center:yes";
	return window.showModelessDialog(url,window,shape);
}
function doTrOver(obj){
	obj.style.backgroundColor="lavender";
}
function doTrOut(obj){
	obj.style.backgroundColor="";	
}
function doCheckAll(chkAllName,chkIdName){
	var chkAll=document.all(chkAllName);
	var chk=document.all(chkIdName);
	if(chkAll==null||chk==null) return;
	else if(chk.length==null) chk.checked=chkAll.checked;
	else for(var i=0;i<chk.length;i++)
	chk[i].checked=chkAll.checked;
}
function getDate(itemId){
	var ctrlobj=document.all(itemId);ctrlobj.select();	
	var owidth=ctrlobj.offsetWidth;	var oheight=ctrlobj.offsetHeight;	
	var swidth=screen.availWidth;	var sheight=screen.availHeight;
	var esx=event.screenX;			var esy=event.screenY;	
	var eox=event.offsetX;			var eoy=event.offsetY;
	var showx=esx-eox-owidth-2;		var showy=esy-eoy+18;	
	var awidth=214;					var aheight=240;
	var bottom=sheight-showy+18;	if(bottom<aheight){ showy=esy-eoy-aheight-2;}
	var url="date.jsp?ran="+Math.random();//location=url;
	var shape="dialogWidth:"+awidth+"px";
	shape+=";dialogHeight:"+aheight+"px";
	shape+=";dialogLeft:"+showx+"px";
	shape+=";dialogTop:"+showy+"px";
	shape+=";status:no;help:no";	
	var retval = window.showModalDialog(url,ctrlobj,shape);
	if( retval != null ){retval=retval.substring(0,10);		
		ctrlobj.value = retval;ctrlobj.select();
	}
}
function setCheckboxBoolean(chkName,flag){
	var chks=document.getElementsByTagName("input");
	for(var i=0;i<chks.length;i++){
		if(chks[i].name!=chkName) continue;
		chks[i].checked=flag;
	}
}
function getCheckedCountByName(chkName){
	var count=0;var chks=document.getElementsByTagName("input");
	for(var i=0;i<chks.length;i++){
		if(chks[i].name!=chkName) continue;
		if(chks[i].checked) count++;
	}return count;
}
function getDate(itemId){
	var ctrlobj=document.all(itemId);ctrlobj.select();	
	var owidth=ctrlobj.offsetWidth;	var oheight=ctrlobj.offsetHeight;	
	var swidth=screen.availWidth;	var sheight=screen.availHeight;
	var esx=event.screenX;			var esy=event.screenY;	
	var eox=event.offsetX;			var eoy=event.offsetY;
	var showx=esx-eox-owidth-2;		var showy=esy-eoy+18;
	var awidth=214;					var aheight=220;
	var bottom=sheight-showy+18;	if(bottom<aheight){ showy=esy-eoy-aheight-2;}
	var url="js/date.jsp?ran="+Math.random();//location=url;
	var shape="dialogWidth:"+awidth+"px";
	shape+=";dialogHeight:"+aheight+"px";
	shape+=";dialogLeft:"+showx+"px";
	shape+=";dialogTop:"+showy+"px";
	shape+=";status:no;help:no";	
	var retval = window.showModalDialog(url,ctrlobj,shape);
	if( retval != null ){retval=retval.substring(0,10);		
		ctrlobj.value = retval;ctrlobj.select();
	}
}
function chooseUser(objId,objName,multiple){
	var url="sysorguser.do?command=select_userId";
	url+="&objId="+objId;
	url+="&objName="+objName;
	url+="&multiple="+multiple;
	showOpen(url,850,450);	
}

function chooseUser2(objId,objName,multiple,type){
	var url="sysorguser.do?command=select_userId";
	url+="&objId="+objId;
	url+="&objName="+objName;
	url+="&multiple="+multiple;
	url+="&type="+type;
	showOpen(url,850,450);	
}
function getOpenerObject(){//取打开窗口的父窗体 
	var obj=opener; 
	if(obj==null) obj=parent.opener;	
	if(obj==null) obj=window.dialogArguments;	
	if(obj==null) obj=parent.window.dialogArguments;
	return obj;
}
function setLocation(url){//刷新 
	url+="&ran="+parseInt(Math.random()*1000);
	var a=document.createElement("a");
	document.body.appendChild(a);
	a.href=url;a.click();
}
function getNowDate(){
	return getNowTime().substring(0,10);
}
function getNowTime(){
	var dd = new Date();			
	var day=dd.getDay();			var year=dd.getYear();
	var month=dd.getMonth()+1;		if(month<10) 	month="0"+month;
	var date=dd.getDate();			if(date<10) 	date="0"+date;
	var hours=dd.getHours();		if(hours<10) 	hours="0"+hours;
	var minutes=dd.getMinutes();	if(minutes<10) 	minutes="0"+minutes;
	var seconds=dd.getSeconds();	if(seconds<10) 	seconds="0"+seconds;	
	var nowTime=year+"-"+month+"-"+date+" ";
	nowTime+=hours+":"+minutes+":"+seconds;
	return nowTime;
}