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
</head>
<%
	Marca marca = new Marca();
	Object listMarca[] = new Object[0];
	String action = request.getParameter("newAction");
	if (action != null) {
		try {
			marca.setId(Integer.parseInt(request.getParameter("id")));
		} catch(Exception e) { 
		}
		marca.setDescricao(request.getParameter("descricao"));
		SessionMarca sessionMarca = new SessionMarca();
		if (action.equals("find")) {
			listMarca = sessionMarca.find(marca);
		} else if (action.equals("removeList")) {
			Marca marcaRemove = new Marca();
			try {
				marcaRemove.setId(Integer.parseInt(request.getParameter("id")));
			} catch(Exception e) { 
			}
			
			sessionMarca.remove(marcaRemove);
			listMarca = sessionMarca.find(marca);
		}
	}

%>
<body>
	<div class="titulo">Consultar Marca</div>
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
			<input type="hidden" id="id" name="id">
			<input type="hidden" id="newAction" name="newAction">
			<input type="hidden" id="entityName" name="entityName" value="Marca"/>			
			<div class="divLabel">Código:</div>
			<div class="divField"><input value="<%=(marca.getId() != null) ? marca.getId() : "" %>" class="inputText" type="text" id="idMarca" name="idMarca"/></div>
			<div class="divLabel">Descrição:</div>
			<div class="divField"><input value="<%=(marca.getDescricao() != null) ? marca.getDescricao() : "" %>" class="inputText" type="text" id="descricao" name="descricao" style="width:320px;" /></div>
		</form>
		<div class="divButtons">
			<input type="button" class="button" value="Consultar" onclick="find();" />
			<input type="button" class="button" value="Limpar" onclick="cleanFind();" />
			<input type="button" class="button" value="Novo" onclick="goNew();" />
		</div>
	</div>
	<div class="divTable">
		<table class="table" cellpadding="0" cellspacing="0">
			<tr>
				<th style="width:50px;">Código</th>
				<th>Descrição</th>
				<th style="width:50px;">&nbsp;</th>
			</tr>
<%
	for(int i=0; i<listMarca.length; i++) {
		Marca marcaAux = (Marca) listMarca[i];
%>
			<tr>
				<td><%=marcaAux.getId() %></td>
				<td><%=marcaAux.getDescricao() %></td>
				<td style="text-align:center">
					<img class="image" src="../img/miniDetail.gif" onclick="detail(<%=marcaAux.getId() %>);" />
					<img class="image" src="../img/miniRemove.gif" onclick="removeList(<%=marcaAux.getId() %>);" />
				</td>
			</tr>
<%	
	}
%>
		</table>
	</div>
</body>
</html>