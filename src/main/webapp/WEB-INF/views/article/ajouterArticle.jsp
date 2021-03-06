<%@ include file="/WEB-INF/views/includes/includes.jsp"%>
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
					<h1 class="h3 mb-4 text-gray-800"><fmt:message code="article.nouveau" /></h1>
				
				</div>
				<!-- /.container-fluid -->

			<!-- ********************** Form add Article *********************** -->
				<div class="row" style="margin: 10px;">
					<div class="col-lg-12">
						<div class="panel panel-primary">
							<div class="panel-heading">
								
							</div>
							<div class="panel-body">
							<c:url value="/article/enregistrer" var="urlEnregistrer" />
								<f:form modelAttribute="article" action="${urlEnregistrer }" method="post" >
								<f:hidden path="idArticle"/>
									<div class="form-group">
										<label><fmt:message code="article.code"/></label>
										<f:input path="codeArticle" class="form-control" placeholder="Code article" />
									</div>
									<div class="form-group">
										<label><fmt:message code="article.description"/></label>
										<f:input path="description" class="form-control" placeholder="Description" />
									</div>
									
									<div class="form-group">
										<label><fmt:message code="article.prix.unitaire.ht"/></label>
										<f:input id="prixUnitaireHT" path="prixUnitaire" class="form-control" placeholder="Prix unitaire HT" />
									</div>
									
									<div class="form-group">
										<label><fmt:message code="article.tva"/></label>
										<f:input id="tauxTva" path="tauxTva" class="form-control" placeholder="Taux TVA" />
									</div>
									
									<div class="form-group">
										<label><fmt:message code="article.prix.unitaire.ttc"/></label>
										<f:input id="prixUnitaireTTC" path="prixUnitaireTTC" class="form-control" placeholder="Prix unitaire TTC" />
									</div>
									
									<div class="form-group">
										<label><fmt:message code="article.categorie"/></label>
										<f:select path="categorie.idCategorie" items="${categories }" itemLabel="codeCategorie" itemValue="idCategorie" class="form-control"></f:select>
									</div>
    			
									<div class="panel-footer">
										<button type="submit" class="btn btn-primary"><i class="fa fa-save">&nbsp;<fmt:message code="common.enregistrer"/></i></button>
										<a href='<c:url value="/article/" />' class="btn btn-secondary"><i class="fa fa-undo">&nbsp;<fmt:message code="common.annuler"/></i></a>
									</div>
								</f:form>
							</div>
						</div>
					</div>
				</div>
					

			<!-- ********************************************* -->

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
	<script src="<%=request.getContextPath()%>/resources/js/sb-admin-2.min.js"></script>
	
	<!-- My Custom Javascript files -->
	<script src="<%=request.getContextPath()%>/resources/javascript/article.js"></script>

</body>

</html>
