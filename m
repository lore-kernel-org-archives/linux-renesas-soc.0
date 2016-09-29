Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-hk2apc01on0126.outbound.protection.outlook.com ([104.47.124.126]:20236
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750752AbcI2EO2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2016 00:14:28 -0400
From: Jithin T Raj <jithin.t@tataelxsi.co.in>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: LVDS Support in R-Car E2(ALT) Board
Date: Thu, 29 Sep 2016 04:14:16 +0000
Message-ID: <SG2PR0401MB12961FCFA0E7D9A29DB6276BD8CE0@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert and others,
=A0=A0=A0=A0 I have successfully applied the patch and build R-car M2 Kerne=
l for Koelsch Board..now it support LVDS..Thank you all especially Geert an=
d Laurent..now i tried the same source tree(v4.7.5) to build for R-Car E2(A=
LT)Board to make LVDS up..but i am getting the following error during makin=
g .dtb file



ubuntu@teltvm2468l:~/jithin_new/linux-4.7.5$ make -j4 r8a7794-alt.dtb
=A0 DTC=A0=A0=A0=A0 arch/arm/boot/dts/r8a7794-alt.dtb
Error: arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi:39.1-16 Label or path=
 lvds_connector not found
FATAL ERROR: Syntax error parsing input tree
make[1]: *** [arch/arm/boot/dts/r8a7794-alt.dtb] Error 1
make: *** [r8a7794-alt.dtb] Error 2
ubuntu@teltvm2468l:~/jithin_new/linux-4.7.5$=20



I have included the "#include "r8a77xx-aa104xd12-panel.dtsi" in r8a7794-alt=
.dts

my source tree is v4.7.5 stable edition



=20
Best Regards
 Jithin T Raj
=20
   =
