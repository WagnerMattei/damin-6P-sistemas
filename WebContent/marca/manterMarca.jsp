<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.poo2.entity.Marca" %>
<%@ page import="br.edu.udc.sistemas.poo2.session.SessionMarca" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../css/styles.css">
	<title>Consultar Marca</title>
	<script type="text/javascript" src="../scripts/marca.js"></script>
<%
	Marca marca = new Marca();
	String action = request.getParameter("newAction");
	if (action != null) {
		try {
			marca.setId(Integer.parseInt(request.getParameter("id")));
		} catch(Exception e) { 
		}
		marca.setDescricao(request.getParameter("descricao"));
		SessionMarca sessionMarca = new SessionMarca();
		if (action.equals("save")) {
			sessionMarca.save(marca);
		} else if (action.equals("remove")) {
			sessionMarca.remove(marca);
			marca = new Marca();
		} else if (action.equals("detail")) {
			marca = (Marca) sessionMarca.findByPrimaryKey(Integer.parseInt(request.getParameter("id")));
			if (marca == null) {
				marca = new Marca();
			}
		}
	}

%>
</head>
<body onload="showMessage();">
	<div class="titulo">Manter Marca</div>
	<div class="divFields">
		<!-- 
			Formulário é um elemento não visual que engloba os inputs passivos
			de serem enviados ao servidor.
			Para input, select ou text-area ser enviado ao servidor ele deve:
			- Estar dentro do form que for executar o submit
			- Possuir setada a propriedade name
			- Não estar DISABLED
		 -->
		<form id="form" name="form" method="post" action="">
			<input type="hidden" id="newAction" name="newAction">
			<input type="hidden" id="entityName" name="entityName" value="Marca"/>	
			<div class="divLabel">Código:</div>
			<div class="divField"><input value="<%=(marca.getId() != null) ? marca.getId() : "" %>" class="inputText" type="text" id="id" name="id" readOnly/></div>
			<div class="divLabel">Descrição:</div>
			<div class="divField"><input value="<%=(marca.getDescricao() != null) ? marca.getDescricao() : "" %>" class="inputText" type="text" id="descricao" name="descricao" style="width:320px;" /></div>
		</form>
		<div class="divButtons">
			<input type="button" class="button" id="btx" value="Salvar" onclick="save();" />
			<input type="button" class="button" value="Limpar" onclick="cleanDetail();" />
			<input type="button" class="button" value="Excluir" onclick="remove();" />
			<input type="button" class="button" value="Voltar" onclick="goFind();" />
		</div>
	</div>
</body>
</html>