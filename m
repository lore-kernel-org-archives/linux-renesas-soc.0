Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:61924 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751186AbdH2S45 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Aug 2017 14:56:57 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: The RZ/A1 pin controller driver will be broken for 4.13
Date: Tue, 29 Aug 2017 18:56:53 +0000
Message-ID: <SG2PR06MB1165ADDEBA8097EA034C27D28A9F0@SG2PR06MB1165.apcprd06.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Just FYI,

After pulling Geert's new renesas-drivers-2017-08-29-v4.13-rc7, I tried=20
testing RZ/A1 and it hangs during boot.

Basically...

[  110.329579] pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-0=
-0 with 6 pins
[  112.970056] pinctrl-rza1 fcfe3000.pin-controller: Parsed gpiochip gpio-1=
-1 with 16 pins
(hangs here forever)


After some debug, I found that this commit broke the new=20
drivers/pinctrl/pinctrl-rza1.c driver.

 108d23e322a2 ("gpiolib: request the gpio before querying its direction")

Looks like it was added for -rc5.

If I revert that one patch, RZ/A1 boots fine.

Since we're at -rc7, I probably won't have time to fix it before the=20
release.

Poor RZ/A1 pinctrl driver...it took so long to get into mainline, and=20
then it only worked for 1 release.

:(


Chris
