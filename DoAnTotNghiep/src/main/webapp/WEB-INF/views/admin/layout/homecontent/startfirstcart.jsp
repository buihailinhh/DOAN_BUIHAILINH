<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!-- Start First Cards -->
<!-- *************************************************************** -->
					<h1 class="h3 mb-6"><strong>Bảng</strong> Thống kê</h1>

 <div class="card-group">
    <div class="card border-right">
        <div class="card-body">
            <div class="d-flex d-lg-flex d-md-block align-items-center">
                <div>
                    <div class="d-inline-flex align-items-center">
                        <h2 class="text-dark mb-1 font-weight-medium">${visitors }</h2>
                        <span
                            class="badge bg-primary font-12 text-white font-weight-medium badge-pill ml-2 d-lg-block d-md-none">+18.33%</span>
                    </div>
                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Khách Hàng</h6>
                </div>
                <div class="ml-auto mt-md-3 mt-lg-0">
                    <span class="opacity-7 text-muted"><i data-feather="user-plus"></i></span>
                </div>
            </div>
        </div>
    </div>
    <div class="card border-right">
        <div class="card-body">
            <div class="d-flex d-lg-flex d-md-block align-items-center">
                <div>
                    <h2 class="text-dark mb-1 w-100 text-truncate font-weight-medium"><sup
                            class="set-doller"></sup>${totalSales }</h2>
                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Tổng Doanh Thu
                    </h6>
                </div>
                <div class="ml-auto mt-md-3 mt-lg-0">
<span class="opacity-7 text-muted">
   VND
</span>
                </div>
            </div>
        </div>
    </div>
    
    
   
</div> 
<div class="card-group">
    <div class="card border-right">
        <div class="card-body">
            <div class="d-flex d-lg-flex d-md-block align-items-center">
                <div>
                    <div class="d-inline-flex align-items-center">
                        <h2 class="text-dark mb-1 font-weight-medium" id="total-products">${totalProducts }</h2>
                    </div>
                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Tổng Số Sản Phẩm Đã Bán</h6>
                </div>
                <div class="ml-auto mt-md-3 mt-lg-0">
                    <span class="opacity-7 text-muted"><i data-feather="box"></i></span>
                </div>
            </div>
        </div>
    </div>
    <div class="card border-right">
        <div class="card-body">
            <div class="d-flex d-lg-flex d-md-block align-items-center">
                <div>
                    <h2 class="text-dark mb-1 w-100 text-truncate font-weight-medium" >${orders }</h2>
                    <h6 class="text-muted font-weight-normal mb-0 w-100 text-truncate">Tổng Số Đơn Hàng</h6>
                </div>
                <div class="ml-auto mt-md-3 mt-lg-0">
                    <span class="opacity-7 text-muted"><i data-feather="shopping-cart"></i></span>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- *************************************************************** -->
<!-- End First Cards -->