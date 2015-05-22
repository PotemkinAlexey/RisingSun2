<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<head>

    <!-- Meta information -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">

    <!-- Title-->
    <title>RISING SUN | Admin panel</title>

    <!-- Favicons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="${pageContext.request.contextPath}/resources/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="${pageContext.request.contextPath}/resources/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="${pageContext.request.contextPath}/resources/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed"
          href="${pageContext.request.contextPath}/resources/assets/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/assets/ico/favicon.ico">

    <!-- CSS Stylesheet-->
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/assets/css/bootstrap/bootstrap-themes.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style.css"/>

    <!-- Styleswitch if  you don't chang theme , you can delete -->
    <link type="text/css" rel="alternate stylesheet" media="screen" title="style1"
          href="${pageContext.request.contextPath}/resources/assets/css/styleTheme1.css"/>
    <link type="text/css" rel="alternate stylesheet" media="screen" title="style2"
          href="${pageContext.request.contextPath}/resources/assets/css/styleTheme2.css"/>
    <link type="text/css" rel="alternate stylesheet" media="screen" title="style3"
          href="${pageContext.request.contextPath}/resources/assets/css/styleTheme3.css"/>
    <link type="text/css" rel="alternate stylesheet" media="screen" title="style4"
          href="${pageContext.request.contextPath}/resources/assets/css/styleTheme4.css"/>


</head>
<body  class="leftMenu nav-collapse in">
<div id="wrapper">
    <%@ include file="../pages/admin/template.jsp" %>

    <div id="main">

        <ol class="breadcrumb">
            <li><a href="#">ARTICLES</a></li>
            <li><a href="#"> EDIT ARTICLES</a></li>
            <li class="active">ARTICLES</li>
        </ol>
        <!-- //breadcrumb-->

        <div id="content">

            <div class="row">

                <div class="col-lg-12">

                    <section class="panel">
                        <header class="panel-heading">
                            <h2><strong>Table</strong> ARTICLES </h2>
                        </header>

                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover" data-provide="data-table">
                                    <thead>
                                    <tr>
                                        <th  class="text-center">No.</th>
                                        <th  class="text-center">Title article</th>
                                        <th  class="text-center"> Name page </th>
                                        <th class="text-center" > Date create </th>
                                        <th  class="text-center"> Image </th>
                                        <th  class="text-center"> Author </th>
                                        <th class="text-center"> Archive </th>
                                        <th width="10%"> Action </th>
                                    </tr>
                                    </thead>
                                    <tbody align="center">
                                    <c:forEach items="${articles}" var="article">
                                        <tr>
                                            <td>${article[0].id}</td>
                                            <td valign="middle">${article[0].title}</td>
                                            <td valign="middle">${article[0].namePage}</td>
                                            <td valign="middle">${article[0].dateCreate}</td>

                                            <td valign="middle">
                                            <c:if test="${!empty article[0].image}">
                                                <span class="label bg-success">FULL IMAGE</span>
                                            </c:if>

                                            <c:if test="${empty article[0].image}">
                                                <span class="label bg-danger">EMPTY IMAGE</span>
                                            </c:if>
                                            </td>

                                            <td valign="middle">${article[1].name}</td>

                                            <td valign="middle">
                                                <c:if test="${article[0].archive==false}">
                                                    <span class="label bg-success">ACTIVE</span>
                                                </c:if>
                                                <c:if test="${article[0].archive==true}">
                                                    <span class="label bg-danger">ARCHIVE</span>
                                                </c:if>
                                            </td>

                                            <td>
                                        <span class="tooltip-area">
                                            <a href="/editarticle/${article[0].id}" class="btn btn-default btn-sm" title="Edit"><i class="fa fa-pencil"></i></a>
                                             <sec:authorize access="hasAnyRole('Admin','Editor')">
                                                <a href="/deletearticle/${article[0].id}" data-confirm="Are you sure you want to delete?" class="btn btn-default btn-sm"><i class="fa fa-trash-o"></i></a>
                                                <a href="/addfirstPage/${article[0].id}" data-target="#md-normal" class="btn btn-theme btn-sm"  data-toggle="modal"><i class="fa fa-pencil"></i></a>
                                            </sec:authorize>
                                        </span>
                                            </td>


                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
                </div>

            </div>
            <!-- //content > row-->

        </div>
        <!-- //content-->


    </div>
    <!-- //main-->


        <div id="md-normal" class="modal fade">
            <form id="addfirst" name="addfirst" method="post" action="addToFirstPage">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times"></i></button>
                <h4 class="modal-title">Please confirm add to first page</h4>
            </div>
            <!-- //modal-header-->
            <div class="modal-body">
                <div class="cp-slider-wrapper" data-color="green"  data-max="100" data-range="min" data-value="40">
                    <input type="hidden" name="cp-slider-2" />
                    <nav>
                        <a href="#" class="cp-prev"><i class="fa fa-chevron-left"></i></a>
                        <a href="#" class="cp-next"><i class="fa fa-chevron-right"></i></a>
                    </nav>
                </div>
            </div>
            <!-- //modal-body-->
            <div class="modal-footer">
                <button type="button " data-dismiss="modal" class="btn btn-inverse">Cancel</button>
                <button type="submit" class="btn btn-theme">Add</button>
            </div>
            </form>
        </div>


    <%@ include file="../pages/admin/templatefoot.jsp" %>

</div>


<!-- Jquery Library -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/jquery.ui.min.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap/bootstrap.min.js"></script>
<!-- Modernizr Library For HTML5 And CSS3 -->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/modernizr/modernizr.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/mmenu/jquery.mmenu.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/styleswitch.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/js/styleswitch.js"></script>
<!-- Library 10+ Form plugins-->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/form/form.js"></script>
<!-- Datetime plugins -->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/datetime/datetime.js"></script>
<!-- Library Chart-->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/chart/chart.js"></script>
<!-- Library  5+ plugins for bootstrap -->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/pluginsForBS/pluginsForBS.js"></script>
<!-- Library 10+ miscellaneous plugins -->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/plugins/miscellaneous/miscellaneous.js"></script>
<!-- Library Themes Customize-->
<script type="text/javascript"
        src="${pageContext.request.contextPath}/resources/assets/js/caplet.custom.js"></script>

<!-- Library datable -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/datable/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/assets/plugins/datable/dataTables.bootstrap.js"></script>
<script type="text/javascript">
    jQuery(document).ready(function() {
        $('table[data-provide="data-table"]').dataTable({
            "iDisplayLength": 5
        });
    });
</script>

<script type="text/javascript">
    function hexFromRGB(r, g, b) {
        var hex = [ r.toString( 16 ), g.toString( 16 ), b.toString( 16 ) ];
        $.each( hex, function( nr, val ) {
            if ( val.length === 1 ) {
                hex[ nr ] = "0" + val;
            }
        });
        return hex.join( "" ).toUpperCase();
    }
    $(document).ready(function () {
        $("#SliderSingle").jslider({ from: 0, to: 50, step: 1, round: 0, dimension: '' });
        $("#Slider1").jslider({ from: 1000, to: 100000, step: 500,  round: 0, dimension: "&nbsp;$" });
        $("#Slider2").jslider({ from: 5000, to: 150000, heterogeneity: ['50/50000'], step: 1000, dimension: '&nbsp;$' });
        $("#Slider3").jslider({ from: 0, to: 500, heterogeneity: ['50/100', '75/250'], scale: [0, '|', 50, '|', '100', '|', 250, '|', 500], limits: false, step: 1, dimension: '&nbsp;m<small>2</small>' });
        $("#Slider4").jslider({ from: 1, to: 30, heterogeneity: ['50/5', '75/15'], scale: [1, '|', 3, '|', '5', '|', 15, '|', 30], limits: false, step: 1, dimension: '', callback: function( value ){ console.dir( this ); } });
        $("#Slider5").jslider({ from: 480, to: 1020, step: 15, smooth: false, dimension: '', scale: ['8:00', '9:00', '10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00'], limits: false, calculate: function( value ){
            var hours = Math.floor( value / 60 );
            var mins = ( value - hours*60 );
            return (hours < 10 ? "0"+hours : hours) + ":" + ( mins == 0 ? "00" : mins );
        }})

        $('.slider-wrapper[data-color]').each(function(i) {
            var slider=$(this).find("div.jslider-bg i.v");
            slider.css({ "background-color": $.fillColor($(this)) });
        });


        $( "#ui-slider" ).slider();
        $( "#ui-slider-range" ).slider({
            range: true,
            min: 0,
            max: 500,
            values: [ 75, 300 ],
            slide: function( event, ui ) {
                $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
            }
        });
        $( "#amount" ).val( "$" + $( "#ui-slider-range" ).slider( "values", 0 ) + " - $" + $( "#ui-slider-range" ).slider( "values", 1 ) );
        $( "#ui-slider-range-min , #ui-slider-color" ).slider({
            range: "min",
            value: 37,
            min: 1,
            max: 700,
            slide: function( event, ui ) {
                $( "#amount-range-max" ).val( "$" + ui.value );
            }
        });
        $( "#amount-range-max" ).val( "$" + $( "#ui-slider-range-min" ).slider( "value" ) );
        $( "#ui-slider-color" ).slider( "value", 485 );


        $( "#red, #green, #blue" ).slider({
            orientation: "vertical",
            range: "min",
            max: 255,
            value: 127,
            slide: refreshSwatch,
            change: refreshSwatch
        });
        $( "#red" ).slider( "value", 126 );
        $( "#green" ).slider( "value", 203 );
        $( "#blue" ).slider( "value", 180 );

        function refreshSwatch() {
            var red = $( "#red" ).slider( "value" ),
                    green = $( "#green" ).slider( "value" ),
                    blue = $( "#blue" ).slider( "value" ),
                    hex = hexFromRGB( red, green, blue );
            $( "#swatch" ).css( "background-color", "#" + hex );
            $( "#swatch span.code-color" ).html("#"+hex +" <em>rgb( "+ red +","+ green +","+ blue  +" )</em>");
        }



        $('.slider-color[data-color]').each(function(i) {
            var slider=$(this).find(".ui-slider-range");
            slider.css({ "background-color": $.fillColor($(this))  });
        });

        $(".cp-slider-wrapper").each(function(i) {
            var slider=$(this), update=slider.find("input[type='hidden']"), data=slider.data();
            slider.modernSlider({
                total: data.max || 100,
                value:data.value,
                width: data.width || "100%",
                range: data.range,
                sliderOpened: data.opened,
                onSlide: function(value) {
                    update.val(value);
                }
            });
            var sliderChange=slider.find("a.ui-slider-handle");
            sliderChange.css({ "background-color":$.fillColor(slider) });
        });

    });
</script>

<script>
    $(document).ready(function() {
        $('a[data-confirm]').click(function(ev) {
            var href = $(this).attr('href');

            if (!$('#dataConfirmModal').length) {
                $('body').append('<div id="dataConfirmModal" class="modal" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true"><div class="modal-header"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button><h3 id="dataConfirmLabel">Please Confirm</h3></div><div class="modal-body"></div><div class="modal-footer"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><a class="btn btn-primary" id="dataConfirmOK">OK</a></div></div>');
            }
            $('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
            $('#dataConfirmOK').attr('href', href);
            $('#dataConfirmModal').modal({show:true});
            return false;
        });
    });
</script>

</body>
</html>
