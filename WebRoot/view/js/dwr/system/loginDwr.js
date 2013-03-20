document.write("<script src='dwr/interface/loginDwr.js'></script>");
function loginDwr_userLogin(and){
    var temp;DWREngine.setAsync(false);
    loginDwr.userLogin(and,function(data){temp=data});
    DWREngine.setAsync(true);return temp;
}
 