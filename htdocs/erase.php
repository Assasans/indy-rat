<html>
<head>
<title>Handler</title>
<link rel="stylesheet" href="css/main.css" />
</head>
<body>
<a href="index.php">Back to main menu</a><br />
<hr />
<?php
define("_dir", "files");
cleanDir(_dir);
function cleanDir($dir) {
	$files = glob($dir."/*");
	$c = count($files);
	if(!file_exists($dir) and !is_dir($dir)) {
		mkdir(_dir);
	}
	if(count($files) > 0) {
		foreach($files as $file) {      
			if(file_exists($file)) {
				file_put_contents($file, "erased");
				//unlink($file);
				echo("Erased (reallocated): <br />
					&emsp;File: $file<br />
					&emsp;In dir: $dir<br />
					<br />"
				);
			}   
		}
	}
	clearstatcache();
}
?>
</body>
</html>
