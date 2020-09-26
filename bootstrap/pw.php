<?php
if (isset($argc)) 
{
        $fwpw = $argv[1];
        $options = ['cost' => 10];
        echo password_hash($fwpw, PASSWORD_BCRYPT, $options);
}
else {
        echo "argc and argv disabled\n";
}
?>
