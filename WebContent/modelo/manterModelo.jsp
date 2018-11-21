
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="br.edu.udc.sistemas.poo2.entity.Modelo" %>
<%@ page import="br.edu.udc.sistemas.poo2.entity.Marca" %>
<%@ page import="br.edu.udc.sistemas.poo2.session.SessionModelo" %>
<%@ page import="br.edu.udc.sistemas.poo2.session.SessionMarca" %>
<%@page import="java.util.List" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../css/styles.css">
	<title>Consultar Marca</title>
	<script type="text/javascript" src="../scripts/modelo.js"></script>
<%
	Modelo modelo = new Modelo();
	Marca marca =new Marca();
	String action = request.getParameter("newAction");
	if (action != null) {
		try {
			modelo.setId(Integer.parseInt(request.getParameter("id")));
		} catch(Exception e) { 
		}
		modelo.setDescricao(request.getParameter("descricao"));
		SessionMarca sessionMarca = new SessionMarca();
		marca.setDescricao(request.getParameter("marca"));
		Object obj[]=sessionMarca.find(marca);
		marca=(Marca) obj[0];
		modelo.setMarca(marca);
		
    
     	
		SessionModelo sessionModelo = new SessionModelo();
		if (action.equals("save")) {
			sessionModelo.save(modelo);
		} else if (action.equals("remove")) {
			sessionModelo.remove(modelo);
			modelo = new Modelo();
		} else if (action.equals("detail")) {
			modelo = (Modelo) sessionModelo.findByPrimaryKey(Integer.parseInt(request.getParameter("id")));
			if (modelo == null) {
				modelo = new Modelo();
			}
		}
	}

%>
</head>
<body onload="showMessage();">
	<div class="titulo">Manter Modelo</div>
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
			<input type="hidden" id="entityName" name="entityName" value="Modelo"/>	
			<div class="divLabel">Código:</div>
			<div class="divField"><input value="<%=(modelo.getId() != null) ? modelo.getId() : "" %>" class="inputText" type="text" id="id" name="id" readOnly/></div>
			<div class="divLabel">Descrição:</div>
			<div class="divField"><input value="<%=(modelo.getDescricao() != null) ? modelo.getDescricao() : "" %>" class="inputText" type="text" id="descricao" name="descricao" style="width:320px;" /></div>
			<div class="divLabel">Marca:</div>
			<div class="divField"> <select id="marca" name="marca"  > 
                        <%
                        	SessionMarca sm= new SessionMarca();
                            Object[] lista = sm.find(null);
                            Marca m;
                            
                            for ( int i=0; i<lista.length; i++ ) {
                                m = (Marca) lista[i];                         
                                %>
                              <option value=<%=m.getDescricao() %>><%=m.getDescricao() %> </option>	
                              <% 					
                            }
                        %> 
			                
			</select>
		    </div>
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