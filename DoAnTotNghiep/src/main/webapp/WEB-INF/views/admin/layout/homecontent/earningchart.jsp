<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- <!-- Start Location and Earnings Charts Section -->
<div class="row">
    <div class="col-md-12 col-lg-12">
	<div class="form-date">
	<div class="col-12">
	<form action="/manager/home-admin">
		<div class="form-control">
			<label for="select-month">Tháng</label>
			<select id="select-month" name="month-chart">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
		</div>
		<div class="form-control">
			<label for="select-year">Năm</label>
			<select id="select-year" name="year-chart">
				<option value="2020">2020</option>
				<option value="2021">2021</option>
				<option value="2022">2022</option>
				<option value="2023">2023</option>
				<option value="2024">2024</option>
				<option value="2025">2025</option>
				<option value="2026">2026</option>
				<option value="2027">2027</option>
				<option value="2028">2028</option>
				<option value="2029">2029</option>
				<option value="2030">2030</option>
			</select>
		</div>
		<button class="btn" style="background-color: blue; color: white;" id="btn-load-chart">Tải</button>
	</form>
	</div>
	</div>
        <div class="card">
            <div class="card-body">
                <div class="d-flex align-items-start">
                    <h4 class="card-title mb-0">Thống Kê Thu Nhập</h4>
                    <div class="ml-auto">
                        <div class="dropdown sub-dropdown">
                            <button class="btn btn-link text-muted dropdown-toggle" type="button"
                                id="dd1" data-toggle="dropdown" aria-haspopup="true"
                                aria-expanded="false">
                                <i data-feather="more-vertical"></i>
                            </button>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dd1">
                                <a class="dropdown-item" href="#">Insert</a>
                                <a class="dropdown-item" href="#">Update</a>
                                <a class="dropdown-item" href="#">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="pl-4 mb-5">
                    <!-- <div class="stat ct-charts position-relative" style="height: 315px;"></div> -->
                    <canvas id="myChart" class="position-relative" style="height: 315px;"></canvas>
                </div>
                <ul class="list-inline text-center mt-4 mb-0">
                    <li class="list-inline-item text-muted font-italic">Earnings for this month</li>
                </ul>
            </div>
        </div>
    </div>

</div> -->

<script>
const xValues = [50,60,70,80,90,100,110,120,130,140,150,50,60,70,80,90,100,110,120,130,140,150,50,60,70,80,90,100,110,120,130,140,150];
const yValues = [7,8,8,9,9,9,10,11,14,14,15,7,8,8,9,9,9,10,11,14,14,15,7,8,8,9,9,9,10,11,14,14,15];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{
      fill: false,
      lineTension: 0,
      backgroundColor: "rgba(0,0,255,1.0)",
      borderColor: "rgba(0,0,255,0.1)",
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    scales: {
      yAxes: [{ticks: {min: 6, max:16}}],
    }
  }
});
</script>
