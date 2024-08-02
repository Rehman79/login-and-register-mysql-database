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

$sql = "SELECT * FROM `users` WHERE `email` = ? AND `password` = ?";
$stmt = mysqli_prepare($db, $sql);
mysqli_stmt_bind_param($stmt, "ss", $email, $password);

$arr = [];
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);

if (mysqli_num_rows($result) > 0) {
    $arr["success"] = "true";
    $arr["message"] = "User exists. Going to log in.";
} else {
    $arr["success"] = "false";
    $arr["message"] = "Invalid email or password.";
}

print(json_encode($arr));
mysqli_stmt_close($stmt);
mysqli_close($db);
?>
