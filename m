Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-hk2apc01on0120.outbound.protection.outlook.com ([104.47.124.120]:8656
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932269AbcI3NdE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 09:33:04 -0400
From: Jithin T Raj <jithin.t@tataelxsi.co.in>
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
CC: "laurent.pinchart@ideasonboard.com"
        <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: RGB-LVDS BRIDGE SUPPORT RCAR
Date: Fri, 30 Sep 2016 13:32:59 +0000
Message-ID: <SG2PR0401MB12965B169E57BCADE443A65CD8C10@SG2PR0401MB1296.apcprd04.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,
=A0 This is my diff file,



diff --git a/a/r8a7794-alt.dts b/b/r8a7779-marzen.dts
index 383ad79..b795da6 100644
--- a/a/r8a7794-alt.dts
+++ b/b/r8a7779-marzen.dts
@@ -1,7 +1,8 @@
=A0/*
- * Device Tree Source for the Alt board
+ * Device Tree Source for the Marzen board
=A0 *
- * Copyright (C) 2014 Renesas Electronics Corporation
+ * Copyright (C) 2013 Renesas Solutions Corp.
+ * Copyright (C) 2013 Simon Horman
=A0 *
=A0 * This file is licensed under the terms of the GNU General Public Licen=
se
=A0 * version 2.=A0 This program is licensed "as is" without any warranty o=
f any
@@ -9,29 +10,64 @@
=A0 */
=A0
=A0/dts-v1/;
-#include "r8a7794.dtsi"
+#include "r8a7779.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
:




i just done this command "git diff a/r8a7794-alt.dts b/r8a7779-marzen.dts "
i have kept "r8a7794-alt.dts" in "a" and=A0"r8a7779-marzen.dts" in "b"

sorry if it is not good





=20
Best Regards
 Jithin T Raj
=20
=20
   =
