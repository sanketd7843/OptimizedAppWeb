@extends('voyager::master')

@section('content')
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<style>
    .col-md-3{
        background-color: white;
        border-radius : 5px;
        margin: 3%;
        padding:20px;
    }
</style>
    <div class="page-content">
        
         <div class="analytics-container">
                     

        <div class="row">
        
        <div class="col-md-6">
            <center>  
        <div class="col-md-3" class="card">
            <h3>App <br/>Users</h3>
            <h4>{{ file_get_contents('http://levelupfoundation.in/exam_app/appucount') }}</h4>
        </div>
        <div class="col-md-3" class="card">
            <h3>User Categories</h3>
            <h4>{{ file_get_contents('http://levelupfoundation.in/exam_app/ucategories') }}</h4>
        </div>
        <div class="col-md-3" class="card">
            <h3>Files <br/><br/></h3>
            <h4>{{ file_get_contents('http://levelupfoundation.in/exam_app/ufiles') }}</h4>
        </div>
        <div class="col-md-3" class="card">
            <h3>Videos</h3>
            <h4>{{ file_get_contents('http://levelupfoundation.in/exam_app/uvideos') }}</h4>
        </div>
        <div class="col-md-3" class="card">
            <h3>Pdf's</h3>
            <h4>{{ file_get_contents('http://levelupfoundation.in/exam_app/updfs') }}</h4>
        </div>
        <div class="col-md-3" class="card">
            <h3>Payments</h3>
            <h4>{{ file_get_contents('http://levelupfoundation.in/exam_app/upayments') }}</h4>
        </div>
        </center> 
        </div> 
        <div class="col-md-4">
            <canvas id="myChart" height="245vh"></canvas>
        </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <iframe src="" iframe width="100%" height="100%" id="loc"></iframe>
            </div>
        </div>
        </div>
</div>
    <script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'pie',
    data: {
        labels: ['App Users', 'User Categories', 'Files', 'Videos', 'Pdfs', 'Payments'],
        datasets: [{
            label: '# of Votes',
            data: [{{ file_get_contents('http://levelupfoundation.in/exam_app/appucount') }}, {{ file_get_contents('http://levelupfoundation.in/exam_app/ucategories') }}, {{ file_get_contents('http://levelupfoundation.in/exam_app/ufiles') }}, {{ file_get_contents('http://levelupfoundation.in/exam_app/uvideos') }}, {{ file_get_contents('http://levelupfoundation.in/exam_app/updfs') }}, {{ file_get_contents('http://levelupfoundation.in/exam_app/upayments') }}],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});

var HttpClient = function() {
    this.get = function(aUrl, aCallback) {
        var anHttpRequest = new XMLHttpRequest();
        anHttpRequest.onreadystatechange = function() { 
            if (anHttpRequest.readyState == 4 && anHttpRequest.status == 200)
                aCallback(anHttpRequest.responseText);
        }

        anHttpRequest.open( "GET", aUrl, true );            
        anHttpRequest.send( null );
    }
}
var client = new HttpClient();
client.get('https://ipinfo.io/json', function(response) {
    var x = JSON.parse(response);
    console.log(x);
    var site = "https://www.openstreetmap.org/search?query="+x["city"];
    document.getElementById('loc').src = site;
});
</script>
@stop
