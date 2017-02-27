/**
 * 
 */
function UploadSpecialRecommendPic() {  
    $.ajaxFileUpload({  
        url : '/GZZSServer/s_util/uploadSpecialRecommendPic.action',  
        secureuri : false,  
        fileElementId : 'specialrecommendfile',  
        dataType : 'json',  
        success : function(d, status) {  
            var data = eval('(' + d + ')');  
            alert(data.msg);  
            if (data.flag == 1) {  
                $("#SpecialTopicPicShow").attr("src", data.path);  
                $("#specialRecommendPic").val(data.picName);  
            }  
        },  
        error : function(data, status, e) {  
            alert(e);  
        }  
    });  
}