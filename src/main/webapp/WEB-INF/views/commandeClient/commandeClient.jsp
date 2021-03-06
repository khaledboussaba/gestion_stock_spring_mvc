<%@ include file="/WEB-INF/views/includes/includes.jsp" %>
<!DOCTYPE html>
<html lang="fr">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Gestion du stock</title>

<!-- Custom fonts for this template-->
<link
	href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="<%=request.getContextPath()%>/resources/css/sb-admin-2.min.css"
	rel="stylesheet">

</head>

<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Sidebar -->
		<%@ include file="/WEB-INF/views/menu_left/leftMenu.jsp"%>
		<!-- End of Sidebar -->
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Topbar -->
				<%@ include file="/WEB-INF/views/menu_top/topMenu.jsp"%>

				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-4 text-gray-800"><fmt:message code="common.client.commande"/></h1>

				</div>
				<!-- /.container-fluid -->
					<!-- ********************** Data Table Commande Client *********************** -->
				<div class="row">
					<div class="col-lg-12">
					  <ol class="breadcrumb">
					    <li class="breadcrumb-item"><a href='<c:url value="/commandeClient/nouveau" />'><i class="fa fa-plus">&nbsp;<fmt:message code="common.ajouter"/></i></a></li>
					    <li class="breadcrumb-item"><a href="#"><i class="fa fa-upload">&nbsp;<fmt:message code="common.exporter"/></i></a></li>
					    <li class="breadcrumb-item"><a href="#"><i class="fa fa-download">&nbsp;<fmt:message code="common.importer"/></i></a></li>
					  </ol>
				</div>
			</div>
			
			<div class="card shadow mb-4">
			
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"><fmt:message code="commande.client.liste" /></h6>
            </div>
            <div class="card-body" style="margin: 10px;">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th><fmt:message code="commande.code" /></th>
                      <th><fmt:message code="commande.date" /></th>
                      <th><fmt:message code="commande.client" /></th>
                      <th><fmt:message code="commande.total" /></th>
                      <th><fmt:message code="commande.actions" /></th>
                    </tr>
                  </thead>
                  
                  <tbody>
                  	
                  	<c:forEach items="${commandesClient }" var="cde">
                  		<tr>
                  			<td>${cde.getCodeCommande() }</td>
                  			<td>${cde.getDateCommande() }</td>
                  			<td>${cde.getClient().getNom() }&nbsp;${cde.getClient().getPrenom() }</td>
                  			<td>${cde.getTotalCommande() }</td>
                  			<td>
                  				<textarea id="json${cde.getIdCommandeClient() }" style="display: none;">${cde.getLigneCommandeJson() }</textarea>
		                      	<a href="javascript:void(0);" onclick="updateDetailsCommande(${cde.getIdCommandeClient() });"><i class="fa fa-th-list">&nbsp;<fmt:message code="common.details"/></i></a>
		                      	&nbsp;|&nbsp;
                  				<c:url value="/commandeClient/modifier/${cde.getIdCommandeClient() }" var="urlModif"></c:url>
		                      	<a href="${urlModif }"><i class="fa fa-edit">&nbsp;<fmt:message code="common.modifier"/></i></a>
		                      	&nbsp;|&nbsp;
		                      	<a href="javascript:void(0);" data-toggle="modal" data-target="#modalCommande${cde.getIdCommandeClient() }"><i class="fa fa-trash-alt">&nbsp;<fmt:message code="common.supprimer"/></i></a>
		                      
		                      
		                      <div class="modal fade" id="modalCommande${cde.getIdCommandeClient() }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								  <div class="modal-dialog" role="document">
								    <div class="modal-content">
								      <div class="modal-header">
								        <h5 class="modal-title" id="exampleModalLabel"><fmt:message code="common.confirm.suppression"/></h5>
								        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
								          <span aria-hidden="true">&times;</span>
								        </button>
								      </div>
								      <div class="modal-body">
								      	<fmt:message code="common.confirm.suppression.msg"/>&nbsp;<label>${cde.getCodeCommande() } ?</label>
								      </div>
								      <div class="modal-footer">
								      	<c:url value="/commandeClient/supprimer/${cde.getIdCommandeClient() }" var="urlSuppression"></c:url>
								        <a href="${urlSuppression }" class="btn btn-danger"><i class="fa fa-trash-alt"></i>&nbsp;<fmt:message code="common.supprimer"/></a>
								        <button type="button" class="btn btn-secondary" data-dismiss="modal"><i class="fa fa-undo"></i>&nbsp;<fmt:message code="common.annuler"/></button>
								      </div>
								    </div>
								  </div>
							</div>
                  			</td>
                  		</tr>
                  	</c:forEach>
                  	
                  </tbody>
                </table>
              </div>
            </div>
	
			</div>
			
			
			<!-- D�tails de la commande -->
			<div class="card shadow mb-4">
			
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary"><fmt:message code="commande.client.detail" /></h6>
            </div>
            <div class="card-body" style="margin: 10px;">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th><fmt:message code="common.article" /></th>
                      <th><fmt:message code="common.qte" /></th>
                      <th><fmt:message code="article.prix.unitaire.ttc" /></th>
                      <th><fmt:message code="commande.total" /></th>
                    </tr>
                  </thead>
                  
                  <tbody id="detailCommande">
                  	              	
                  </tbody>
                </table>
              </div>
            </div>
				
				
			</div>
		
				<!-- ********************************************* -->
				
		
				<!-- /.container-fluid -->

			
			</div>
			<!-- End of Main Content -->

			<!-- Footer -->
			<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
			<!-- End of Footer -->

		</div>
		<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<%@ include file="/WEB-INF/views/logout/logout.jsp"%>
	
	

	<!-- Bootstrap core JavaScript-->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="<%=request.getContextPath()%>/resources/js/sb-admin-2.min.js"></script>
	
	<!-- My Custom Javascript files -->
	<script src="<%=request.getContextPath()%>/resources/javascript/commandeClient.js"></script>

</body>

</html>
