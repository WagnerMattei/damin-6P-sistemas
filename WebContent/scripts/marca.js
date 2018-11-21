function goNew() {
	window.location.href = "./manterMarca.jsp";
}

function goFind() {
	window.location.href = "./consultarMarca.jsp";
}

function cleanFind() {
	window.location.href = "./consultarMarca.jsp";
}

function cleanDetail() {
	window.location.href = "./ManterMarca.jsp";
}

function save() {
	document.getElementById('newAction').value = 'save';
	document.getElementById('form').action = "./manterMarca.jsp";
	document.getElementById('form').submit();
}

function detail(id) {
	document.getElementById('id').value = id;
	document.getElementById('newAction').value = 'detail';
	document.getElementById('form').action = "./manterMarca.jsp";
	document.getElementById('form').submit();
} 

function remove() {
	if (confirm('Deseja Excluir?')) {
		document.getElementById('newAction').value = 'remove';
		document.getElementById('form').action = "./manterMarca.jsp";
		document.getElementById('form').submit();
	}
}

function removeList(id) {
	if (confirm('Deseja Excluir?')) {
		document.getElementById('id').value = id;
		document.getElementById('newAction').value = 'removeList';
		document.getElementById('form').action = "./consultarMarca.jsp";
		document.getElementById('form').submit();
	}
}

function find() {
	document.getElementById('newAction').value = 'find';
	document.getElementById('form').action = "./consultarMarca.jsp";
	document.getElementById('form').submit();
}
