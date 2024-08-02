<?php
$db = mysqli_connect('localhost', 'root', '', 'fluttconn');
if (!$db) {
    echo "Database connection Failed";
    exit;
}

if (isset($_POST['email']) && isset($_POST['password'])) {
    $email = $_POST['email'];
    $password = $_POST['password'];
} else {
    $arr["success"] = "false";
    $arr["message"] = "Missing email or password";
    print(json_encode($arr));
    exit;
}

$sql = "INSERT INTO `users` (`email`, `password`) VALUES (?, ?)";
$stmt = mysqli_prepare($db, $sql);
mysqli_stmt_bind_param($stmt, "ss", $email, $password);

$arr = [];
if (mysqli_stmt_execute($stmt)) {
    $arr["success"] = "true";
    $arr["message"] = "Saved..";
} else {
    $arr["success"] = "false";
    $arr["message"] = "Failed";
    $arr["message"] = mysqli_error($db);
}

print(json_encode($arr));
mysqli_stmt_close($stmt);
mysqli_close($db);
?>
