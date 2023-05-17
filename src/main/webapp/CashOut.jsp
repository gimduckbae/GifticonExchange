<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>iamport</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.js"
	integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E="
	crossorigin="anonymous"></script>
</head>

<link rel="stylesheet" type="text/css" href="./CashOut_css/CashOut.css">
<body>

	<form action="./actions/CashOut_action.jsp" method="post">
		<div class="wrap">
			<div class="header"></div>
		</div>
		<div class="formcontainer">
			<div class="form-group">
				<label><Span>출금계좌번호:</Span></label> <input type="text"
					class="form-control" placeholder="출금계좌번호" name="account">
			</div>
			<div class="form-group">
				<label for="wAccountPassword">출금계좌비밀번호:</label> <input
					type="password" class="form-control" placeholder="출금계좌비밀번호"
					id="wAccountPassword" name="pw">
			</div>
		</div>
		
		<div class="container mt-5">
			<div class="d-flex flex-column">
				<div class="input-group mb-3">
					<input type="number" min="10000" step="1000" id="amount"
						name="withdraw"
						class="form-control border-bottom border-secondary"
						placeholder="충전할 금액을 입력해 주세요."
						style="border: none; border-radius: 0;">
				</div>
				<div class="d-flex flex-row mb-3">
					<button class="btn btn-light ms-1 me-1 border border-secondary"
						id="amount" onclick="plus1()" type="button" style="width: 50%;">+1만원</button>
					<button class="btn btn-light ms-1 me-1 border border-secondary"
						type="button" id="amount" onclick="plus5()" style="width: 50%;">+5만원</button>
					<button class="btn btn-light ms-1 me-1 border border-secondary"
						type="button" id="amount" onclick="plus10()" style="width: 50%;">+10만원</button>
					<button class="btn btn-light ms-1 me-1 border border-secondary"
						type="button" id="amount" onclick="plus50()" style="width: 50%;">+50만원</button>
				</div>
				<button class="btn btn-primary" type="submit" name="withdraw">출금신청하기</button>
			</div>
		</div>
	</form>
<!-- 토스페이먼츠 JSP 결제 샘플 소스코드  -->
<!DOCTYPE html>
<html lang="kr">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>토스페이먼츠 샘플페이지</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
  <script src="https://js.tosspayments.com/v1/payment"></script>
  <style>
    @import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

    body {
      font-family: 'Noto Sans KR', sans-serif;
    }

    .mb2 {
      margin-bottom: 25px;
    }

    .gray {
      color: rgb(78, 89, 104);
      font-size: 13px;
    }

    .red {
      color: rgb(240, 68, 82);
      font-size: 13px;
    }

    .box_section {
      background-color: white;
      border-radius: 10px;
      box-shadow: 0 10px 20px rgb(0 0 0 / 1%), 0 6px 6px rgb(0 0 0 / 6%);
    }

  </style>
</head>

<body class="bg-light">
  <div class="container">
    <div class="row">
      <div class="col-md-3"></div>

      <div class="col-md-6">

        <h2 style=" margin-top:10px;  padding:20px 0px 10px 0px">
          <img width="45px" src="https://static.toss.im/3d-emojis/u1F60E-apng.png">
          Tosspayments 결제 데모
        </h2>

        <div id="info" class="box_section" style=" margin-top:30px; padding:20px 10px 10px 10px">
          <div class="card-body">
            <div class="gray">
              <ul>
                <li>연동 진행하며 궁금한 점은 Tosspayments Discord 채널로 문의주세요
                  <a href="https://discord.com/invite/VdkfJnknD9" target="_blank"><span
                      class="badge bg-primary">link</span></h5>
                </li>
              </ul>
              </a>
            </div>
          </div> <!-- .card-body -->
        </div> <!-- #info -->

        <div id="requestPayment_form" class="box_section"
          style="padding: 40px 30px 50px 30px; margin-top:30px; margin-bottom:50px">

          <label class="form-label" for="paymentType">결제수단 <span class="red">필수</span></label>
          <select id="paymentType" class="form-select form-control-lg mb2">
            <option value="카드" selected>카드</option>
            <option value="계좌이체">계좌이체</option>
            <option value="가상계좌">가상계좌</option>
            <option value="휴대폰">휴대폰</option>

            <option value="토스페이">토스페이</option>
          </select>

          <div class="mb2">
            <label class="form-label" for="amount">주문번호 <span class="gray">(orderId) </span> <span
                class="red">필수</span></label>
            <input id="orderId" class="form-control form-control-lg" type="text">
          </div>

          <div class="mb2">
            <label class="form-label" for="amount">물품명 <span class="gray">(orderName) </span><span
                class="red">필수</span></label>
            <input id="orderName" class="form-control form-control-lg" type="text" value="토스 티셔츠">
          </div>

          <div class="mb2">
            <label class="form-label" for="amount">금액 <span class="gray">(amount) <span class="red">필수</span></label>
            <input id="amount" class="form-control form-control-lg" type="text" value="15000"> <!-- 금액 내 천단위 콤마 X -->
          </div>

          <div class="mb2">
            <label class="form-label" for="amount">구매자명 <span class="gray">(customerName)</span></label>
            <input id="customerName" class="form-control form-control-lg" type="text" value="김토스">
          </div>

          <div class="d-grid gap-2">
            <button id="requestPayment" type="button" class="btn btn-lg btn-primary">결제하기</button>
          </div>

        </div> <!-- #requestPayment_form -->

        <div class="col-md-3"></div>
      </div>
    </div>
</body>
<script>
  /* =================================  API KEY 세팅 ================================== */
  let clientKey = 'test_ck_OEP59LybZ8Bdv6A1JxkV6GYo7pRe'; // [TODO] https://developers.tosspayments.com 로그인 후 API Key발급 가능
  let tossPayments = TossPayments(clientKey);


  /* =================================  결제데이터 ================================== */
  /* 각 파라미터별 세부 내용은 다음 링크 참고 https://docs.tosspayments.com/reference/js-sdk */
  let paymentData = ["공통", "카드", "가상계좌", "계좌이체", "휴대폰", "문화상품권", "도서상품권", "게임문화상품권", "토스페이"];
  let currentURL = window.location.protocol + "//" + window.location.host + window.location.pathname;

  paymentData["공통"] = {
    "amount": "",
    "orderId": "",
    "orderName": "",
    "customerName": "",
    "customerEmail": null,
    "customerMobilePhone": null,
    "successUrl": currentURL + "success.jsp",
    "failUrl": currentURL + "fail.jsp",
    "windowTarget": "iframe",
    "taxFreeAmount": null,
    "cultureExpense": false
  }

  paymentData["카드"] = {
    "cardCompany": null,
    "cardInstallmentPlan": null,
    "maxCardInstallmentPlan": null,
    "freeInstallmentPlans": null,
    "useCardPoint": false,
    "useAppCardOnly": false,
    "useInternationalCardOnly": false,
    "flowMode": "DEFAULT",
    "easyPay": null,
    "discountCode": null,
    "appScheme": null
  }

  paymentData["가상계좌"] = {
    "validHours": 72,
    "cashReceipt": {
      "type": "소득공제"
    },
    "useEscrow": false,
    "escrowProducts": null,
    "currency": "KRW"
  }

  paymentData["계좌이체"] = {
    "cashReceipt": {
      "type": "소득공제"
    },
    "useEscrow": false,
    "escrowProducts": null
  }

  paymentData["휴대폰"] = {
    "mobileCarrier": null // [NOTE] 테스트 환경에서 동작 X
  }


  /* ================== '결제' Btn Event ================== */
  document.getElementById("requestPayment").addEventListener('click', function () {
    let paymentType = document.getElementById("paymentType").value;
    let requestJson = initPaymentsData("공통",paymentType);
    
    tossPayments.requestPayment(paymentType, requestJson)
      .catch(function (error) {
        // 응답 처리 (https://docs.tosspayments.com/reference/js-sdk#응답-처리)
        if (error.code === 'USER_CANCEL') {
          // 결제 고객이 결제창을 닫았을 때 에러 처리
        } else if (error.code === 'INVALID_CARD_COMPANY') {
          // 유효하지 않은 카드 코드에 대한 에러 처리
        }
      })
  })

  /* ================== 페이지 로딩시 실행 ================== */
  document.addEventListener("DOMContentLoaded", function () {
    makeOrderId("TossPaymentsTest"); 
  });

  /* ================= 주문번호(OrderID) 자동생성 =================== */
  function makeOrderId (prefix){
    let x = Math.floor(Math.random() * 100000000);
    document.getElementById("orderId").value = prefix + x;
  }

  /* ============= [공통] + [결제수단] JSON DATA 합치기 ================= */
  function initPaymentsData(general, paymentType){
    paymentData[general].amount = document.getElementById("amount").value;
    paymentData[general].orderId = document.getElementById("orderId").value;
    paymentData[general].orderName = document.getElementById("orderName").value;
    paymentData[general].customerName = document.getElementById("customerName").value;
    
    return Object.assign(paymentData[general], paymentData[paymentType]);
  }

</script>

</html>
	

	<script>
		let count = 0;

		function plus1() {
			count += 10000;
			document.getElementById('amount').value = count;
		}

		function plus5() {
			count += 50000;
			document.getElementById('amount').value = count;
		}

		function plus10() {
			count += 100000;
			document.getElementById('amount').value = count;
		}

		function plus50() {
			count += 500000;
			document.getElementById('amount').value = count;
		}
	</script>
</body>
</html>