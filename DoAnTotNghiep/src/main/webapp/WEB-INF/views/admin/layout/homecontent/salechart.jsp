<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>

<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Thống Kê Doanh Thu</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Tổng Doanh Thu</h4>
            <div>
                <form id="statsForm">
                    <label for="startDate">Start Date:</label>
                    <input type="date" id="startDate" name="startDate">
                    <label for="endDate">End Date:</label>
                    <input type="date" id="endDate" name="endDate">
                    <button type="submit">Get Stats</button>
                </form>
            </div>
            <div id="campaign-v2" class="mt-2" style="height:283px; width:100%;">
                <canvas id="revenueChart"></canvas>
            </div>
            <ul class="list-style-none mb-0">
                <li>
                    <i class="fas fa-circle text-primary font-10 mr-2"></i>
                    <span class="text-muted">Direct Sales</span>
                    <span id="directSales" class="text-dark float-right font-weight-medium">0</span>
                </li>
                <li class="mt-3">
                    <i class="fas fa-circle text-danger font-10 mr-2"></i>
                    <span class="text-muted">Referral Sales</span>
                    <span id="referralSales" class="text-dark float-right font-weight-medium">$0</span>
                </li>
                <li class="mt-3">
                    <i class="fas fa-circle text-cyan font-10 mr-2"></i>
                    <span class="text-muted">Affiliate Sales</span>
                    <span id="affiliateSales" class="text-dark float-right font-weight-medium">$0</span>
                </li>
            </ul>
        </div>
    </div>

    <script>
    document.getElementById('statsForm').addEventListener('submit', function(event) {
        event.preventDefault();
        fetchStats();
    });

    function fetchStats() {
        const startDate = document.getElementById('startDate').value;
        const endDate = document.getElementById('endDate').value;

        fetch(`/api/orders/stats?startDate=${startDate}&endDate=${endDate}`)
            .then(response => response.json())
            .then(data => {
                updateChart(data);
                document.getElementById('directSales').textContent = `$${data.directSales.toFixed(2)}`;
                document.getElementById('referralSales').textContent = `$${data.referralSales.toFixed(2)}`;
                document.getElementById('affiliateSales').textContent = `$${data.affiliateSales.toFixed(2)}`;
            });
    }

    function updateChart(data) {
        const ctx = document.getElementById('revenueChart').getContext('2d');
        new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Direct Sales', 'Referral Sales', 'Affiliate Sales'],
                datasets: [{
                    label: 'Revenue',
                    data: [data.directSales, data.referralSales, data.affiliateSales],
                    backgroundColor: [
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(75, 192, 192, 0.2)'
                    ],
                    borderColor: [
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 99, 132, 1)',
                        'rgba(75, 192, 192, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }

    </script>
</body>
</html>
