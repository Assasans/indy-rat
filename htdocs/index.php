<html>
<head>
<title>Control panel</title>
<link rel="stylesheet" href="css/main.css" />
</head>
<body>
<?php
function passForm() {
	echo("Enter password: 
		<form action='' method='post'>
			<input type='password' name='pass' value='' /><br />
			<button>Next</button>
		</form>"
		);
}
if(isset($_POST['pass'])) {
	$pass = $_POST['pass'];
	if(password_verify($pass, '$2y$10$jaoSFfuIieshXvEZCJyKXu8dSI5TMhQSfM/QKIJhYmdkKZfTowvua')) {
		include('main.data');
	} else passForm();
} else passForm();
?>
</body>
</html>
