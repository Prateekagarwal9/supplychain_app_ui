$(document).ready(function(){
    $(".generate").click(function(){
        $.ajax({
            type: "get",
            url: "/all/",
            contentType: 'application/json',
            success: function(data){
                $('#generateuniqueid').val(data['output']);
            },
            error: function(){
                alert("error");
            }
        });
    });
    $('#datafactorysources').on('change', function() {
    var a = ["BQ", "Oracle", "SAP", "SalesForce"];
    if (a.indexOf(this.value) > -1)
    {
        a.splice(a.indexOf(this.value, 1));
    }
    for(var i = 0; i < a.length; i++)
    {
        $("#"+a[i]+"_show").find('input:text').val('');
        $("#"+a[i]+"_show").hide();
    }
     $("#"+this.value+"_show").show();
    });
});