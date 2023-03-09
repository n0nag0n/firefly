<!doctype html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- Bootstrap CSS -->
	<link href="/css/bootstrap.min.css" rel="stylesheet">

	<title>firefly</title>
</head>
<body class="bg-light">
<div class="container bg-white p-3">
	<div class="starter-template mt-3">

		<h1>Welcome to Firefly 1.0.0!</h1>
		<p class="lead">Firefly is a developer box where you can switch PHP versions easily.</p>

		<p class="fst-italic">Current PHP Version: <?=phpversion()?></p>

		<h3>Preconfigured Hosts</h3>
		<p>
			please edit your local hosts file to use this! <br><br>
			<strong>PHP 8.2: </strong><a href="http://firefly82.com">http://firefly82.com</a>: <a href="http://firefly82.com/info.php">info.php</a><br>
			<strong>PHP 8.1: </strong><a href="http://firefly81.com">http://firefly81.com</a>: <a href="http://firefly81.com/info.php">info.php</a><br>
			<strong>PHP 8.0: </strong><a href="http://firefly80.com">http://firefly80.com</a>: <a href="http://firefly80.com/info.php">info.php</a><br>
			<strong>PHP 7.4: </strong><a href="http://firefly74.com">http://firefly74.com</a>: <a href="http://firefly74.com/info.php">info.php</a><br>
			<strong>PHP 7.3: </strong><a href="http://firefly73.com">http://firefly73.com</a>: <a href="http://firefly73.com/info.php">info.php</a><br>
			<strong>PHP 7.2: </strong><a href="http://firefly72.com">http://firefly72.com</a>: <a href="http://firefly72.com/info.php">info.php</a><br>
			<strong>PHP 7.1: </strong> <a href="http://firefly71.com">http://firefly71.com</a>: <a href="http://firefly71.com/info.php">info.php</a><br>
			<strong>PHP 7.0: </strong> <a href="http://firefly70.com">http://firefly70.com</a>: <a href="http://firefly70.com/info.php">info.php</a><br>
			<strong>PHP 5.6: </strong> <a href="http://firefly56.com">http://firefly56.com</a>: <a href="http://firefly56.com/info.php">info.php</a><br>
		</p>

		<h3>Database Access</h3>
		<p>Database access via a UI is provided by <a href="https://adminer.org" target="_blank">Adminer</a>.</p>

		<p><a href="/adminer.php" target="_blank">Database Access</a></p>

		<h3>Beanstalkd Access</h3>
		<p>Beanstalkd tube access via a UI is provided by <a href="https://github.com/ptrofimov/beanstalk_console" target="_blank">beanstalk_console</a>.</p>

		<p><a href="/beanstalkd" target="_blank">Beanstalkd Access</a></p>

		<h3>Custom Hosts</h3>
		<p>
			You can use our provisioning templates (directory: provisioning) to add your custom projects
		</p>

		<h3>Docs</h3>
		<p>
			See README file in <a href="https://github.com/n0nag0n/firefly" target="_blank">https://github.com/n0nag0n/firefly</a>
		</p>
	</div>

</div>
</body>
</html>
