<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>前台登录</title>
	<style>
		html{font-family:sans-serif;-ms-text-size-adjust:100%;-webkit-text-size-adjust:100%}
		body{margin:0}
		article,aside,details,figcaption,figure,footer,header,hgroup,main,nav,section,summary{display:block}
		audio,canvas,progress,video{display:inline-block;vertical-align:baseline}audio:not([controls]){display:none;height:0}[hidden],template{display:none}a{background:transparent}a:active,a:hover{outline:0}abbr[title]{border-bottom:1px dotted}b,strong{font-weight:bold}dfn{font-style:italic}h1{font-size:2em;margin:0.67em 0}mark{background:#ff0;color:#000}small{font-size:80%}sub,sup{font-size:75%;line-height:0;position:relative;vertical-align:baseline}sup{top:-0.5em}sub{bottom:-0.25em}img{border:0}svg:not(:root){overflow:hidden}figure{margin:1em 40px}hr{-moz-box-sizing:content-box;box-sizing:content-box;height:0}pre{overflow:auto}code,kbd,pre,samp{font-family:monospace, monospace;font-size:1em}button,input,optgroup,select,textarea{color:inherit;font:inherit;margin:0}button{overflow:visible}button,select{text-transform:none}button,html input[type="button"],input[type="reset"],input[type="submit"]{-webkit-appearance:button;cursor:pointer}button[disabled],html input[disabled]{cursor:default}button::-moz-focus-inner,input::-moz-focus-inner{border:0;padding:0}input{line-height:normal}input[type="checkbox"],input[type="radio"]{-moz-box-sizing:border-box;box-sizing:border-box;padding:0}input[type="number"]::-webkit-inner-spin-button,input[type="number"]::-webkit-outer-spin-button{height:auto}input[type="search"]{-webkit-appearance:textfield;-moz-box-sizing:content-box;box-sizing:content-box}input[type="search"]::-webkit-search-cancel-button,input[type="search"]::-webkit-search-decoration{-webkit-appearance:none}fieldset{border:1px solid #c0c0c0;margin:0 2px;padding:0.35em 0.625em 0.75em}legend{border:0;padding:0}textarea{overflow:auto}optgroup{font-weight:bold}table{border-collapse:collapse;border-spacing:0}td,th{padding:0}
	</style>
	<style>
		@import url("login-css.css");
		.gradient, .login, .outer {
			background: -moz-radial-gradient(#8dddff, #0566a9);
			background: -webkit-radial-gradient(#8dddff, #0566a9);
			background: radial-gradient(#8dddff, #0566a9);
			background-size: 360px 600px;
			background-position: center -90%;
		}

		.login {
			display: inline-block;
			width: 180px;
			height: 300px;
			padding: 30px 25px;
			margin: -180px -115px;
			position: absolute;
			top: 50%;
			left: 50%;
			text-align: left;
			font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Geneva, Verdana, sans-serif;
			border: 1px solid #5c5c5c;
			border-radius: 5px;
			box-shadow: rgba(0, 0, 0, 0.25) 0 2px 4px 1px, rgba(0, 0, 0, 0.25) 0 2px 55px 3px;
		}
		.login:before {
			content: "";
			width: 100%;
			height: .1em;
			position: absolute;
			top: 0px;
			left: 0;
			background: radial-gradient(ellipse at center, rgba(255, 255, 255, 0.97) 0%, rgba(255, 255, 255, 0.16) 70%);
			background-size: 100% 150%;
			background-position: center center;
		}

		.login .photo {
			width: 88px;
			height: 88px;
			overflow: hidden;
			position: relative;
			margin: 0 auto;
			margin-top: 10%;
			border-radius: 50%;
			border: 2px solid rgba(0, 0, 0, 0.7);
			box-shadow: 0 -2px 0px 2px rgba(255, 255, 255, 0.15), 0 2px 2px 2px rgba(0, 0, 0, 0.15), 0 -4px 20px 0px rgba(255, 255, 255, 0.4), 0 0px 140px 0px rgba(0, 120, 120, 0.8), 0 -45px 90px 0px rgba(255, 255, 255, 0.3), 0 4px 39px 0px rgba(0, 0, 0, 0.4);
		}
		.login .photo:before {
			content: '';
			width: 90px;
			height: 90px;
			background: url("css/profile-512_4.jpg");
			background-size: 100%;
			position: absolute;
			border-radius: 50%;
		}

		.login .name {
			width: 100%;
			line-height: 1;
			text-align: center;
			font-size: 0.89em;
			color: white;
			text-shadow: 1px 1px 1px rgba(0, 0, 0, 0.3);
			transition: all 300ms ease;
			position: absolute;
			left: 0;
			margin-top: 34px;
		}

		input {
			box-sizing: border-box;
			width: 100%;
			margin-top: 15px;
			padding: 5px 2px;
			font-size: 0.8em;
			border: 1px solid rgba(0, 0, 0, 0.3);
			border-radius: 3px;
			-moz-box-shadow: rgba(0, 0, 0, 0.15) 0 1px 2px 0 inset, rgba(0, 0, 100, 0.3) 0 1px 0 0;
			-webkit-box-shadow: rgba(0, 0, 0, 0.15) 0 1px 2px 0 inset, rgba(0, 0, 100, 0.3) 0 1px 0 0;
			box-shadow: rgba(0, 0, 0, 0.15) 0 1px 2px 0 inset, rgba(0, 0, 100, 0.3) 0 1px 0 0;
		}
		input:focus {
			outline: 0;
			border: 1px solid #77a7c0;
			-moz-box-shadow: rgba(20, 113, 184, 0.5) 0 0 3px 1px, rgba(20, 113, 184, 0.5) 0 0 2px 1px inset;
			-webkit-box-shadow: rgba(20, 113, 184, 0.5) 0 0 3px 1px, rgba(20, 113, 184, 0.5) 0 0 2px 1px inset;
			box-shadow: rgba(20, 113, 184, 0.5) 0 0 3px 1px, rgba(20, 113, 184, 0.5) 0 0 2px 1px inset;
		}
		input::input-placeholder {
			color: rgba(20, 20, 20, 0.5);
		}

		.username-wrap {
			position: relative;
		}

		.username-wrap:after {
			content: "\f18e";
			display: inline-block;
			font-smoothing: antialiased;
			font-family: 'FontAwesome';
			position: absolute;
			right: 5px;
			top: 5px;
			color: rgba(40, 51, 53, 0.4);
			font-size: 1.25em;
		}

		.username {
			margin-bottom: 10px;
			margin-top: 30px;
			transition: all 300ms ease;
			display: block;
			opacity: 1;
		}

		.hidden {
			opacity: 0;
			transition: all 300ms ease;
			visibility: hidden;
		}

		.inner, .outer, .spine, .shadow {
			position: absolute;
			width: 100%;
		}

		.inner:after, .outer:after {
			content: '\f023';
			top: 33%;
			left: 42%;
			font-size: 1em;
			line-height: 1.7em;
			padding: .125em;
			width: 2em;
			height: 2em;
			border-radius: 50%;
			border: 1px solid white;
			position: absolute;
			font-smoothing: antialiased;
			font-family: 'FontAwesome';
			box-sizing: border-box;
		}

		.inner:after {
			content: "\f09c";
		}

		.inner {
			background-color: #283335;
			text-shadow: 0 -2px 4px rgba(0, 0, 0, 0.2);
			height: 100%;
			background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0) 0%, rgba(0, 0, 0, 0.2) 100%);
		}

		.spine {
			top: .25em;
			background: #282d2d;
			height: .25em;
			transform: rotateX(90deg);
			transform-origin: center top;
		}

		.outer {
			height: 100%;
			background-position: center -117%;
			transform: translateZ(0.25rem);
			text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
		}

		.pw-box {
			height: 80px;
			width: 228px;
			background: rba(0, 0, 0, 0.9);
			position: absolute;
			left: 1px;
			padding: 10px;
			transition: all .55s ease;
			box-shadow: inset 0px -60px 70px rgba(0, 0, 0, 0.9);
			box-sizing: border-box;
			perspective: 320;
		}
		.pw-active .pw-box {
			background: rgba(0, 0, 0, 0.2);
			box-shadow: inset 0px 5px 10px rgba(0, 0, 0, 0.2);
		}
		.pw-box .flap {
			position: absolute;
			color: white;
			text-align: center;
			pointer-events: none;
			z-index: 100;
			background-color: rgba(255, 0, 0, 0.3);
			width: 100%;
			height: 100%;
			position: absolute;
			display: block;
			top: 0;
			left: 0;
			transition: all 0.6s cubic-bezier(0.2, 0.7, 0.1, 1.1);
			transform-origin: center bottom;
			transform-style: preserve-3d;
		}
		.pw-active .pw-box .flap {
			transform: rotateX(-110deg);
		}

		body {
			text-align: center;
			-moz-background-size: cover;
			-o-background-size: cover;
			-webkit-background-size: cover;
			background-size: cover;
			background-color: #dcdcdc;
			background: url(data:image/png;base64,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);
		}

	</style>

	<script src="js/prefixfree.min.js"></script>

	<script src="js/modernizr.js"></script>

</head>

<body>
	<div style="text-align:center;clear:both">
		<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
		<script src="/follow.js" type="text/javascript"></script>
	</div>
	<div class="login" >
		<div class="photo"></div>
		<p class="name hidden" id="name">Hans Engebretsen</p>
		<div class="username-wrap">
		<input type="username" class="username" placeholder="Type name & hit enter" id="username-input" /></div>
		<div class="pw-box">
			<span class="flap">
				<div class="inner"></div>
				<div class="spine"></div>
				<div class="outer"></div>
			</span>
			<span class="shadow"></span>
			<input type="password" class="password" placeholder="Password" />
		</div>
	</div>
	<script src='js/jquery.js'></script>

	<script src="js/index.js"></script>

</body>

</html>