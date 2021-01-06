import 'package:flutter/material.dart';

enum Environment { PRODUCTION, TEST, DEV }

// Base URL
const currentEnvironment = Environment.DEV;

get endpoint => currentEnvironment == Environment.PRODUCTION
    ? 'https://api.mottrieu.com/public-api/v1'
    : 'https://api.mottrieu.com/public-api/v1';

// initial waiting time (second)
int initWaitTime = 2;

// App primary color
const Color primaryColor = Color.fromRGBO(114, 208, 245, 1);

// Text color
const Color textColor = Color.fromRGBO(10, 100, 100, 1);

// Splashscreen logo path
const startupLogo = 'images/startup.gif';

// language flag
const vi = 'images/vi.png';
const en = 'images/en.png';

// Use this photo if user don't have avatar
const noPhoto = 'images/noPhoto.jpeg';

// reCaptcha api and secret
const reCaptchaApiKey = '6Lf5HBoaAAAAAKn4s0PZcBWMlYKBlb-bZLxr7BxL';
const reCaptchaSecretKey = '6Lf5HBoaAAAAAPdm5b493o5JJr4ualNthdPgv-ba';
