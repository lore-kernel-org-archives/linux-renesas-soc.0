Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:43645 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727337AbeH3W4R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 18:56:17 -0400
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Jiri Slaby <jslaby@suse.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 0/2] serial: sh-sci: Fix earlycon on Renesas ARM platforms
Date: Thu, 30 Aug 2018 18:52:37 +0000
Message-ID: <TY1PR01MB1562E58C07A892AC7CF7438B8A080@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20180830125404.21192-1-geert+renesas@glider.be>
In-Reply-To: <20180830125404.21192-1-geert+renesas@glider.be>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Thursday, August 30, 2018, Geert Uytterhoeven wrote:
> Earlycon for RZ/A2 (which is a new platform) will be fixed later in a
> separate patch.

I assume something like this:
(which works for me)


diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
index ab3f6e91853d..426241da2e44 100644
--- a/drivers/tty/serial/sh-sci.c
+++ b/drivers/tty/serial/sh-sci.c
@@ -3414,6 +3414,12 @@ static int __init scif_early_console_setup(struct ea=
rlycon_device *device,
 {
        return early_console_setup(device, PORT_SCIF);
 }
+static int __init rzscifa_early_console_setup(struct earlycon_device *devi=
ce,
+                                         const char *opt)
+{
+       port_cfg.regtype =3D SCIx_RZ_SCIFA_REGTYPE;
+       return early_console_setup(device, PORT_SCIF);
+}
 static int __init scifa_early_console_setup(struct earlycon_device *device=
,
                                          const char *opt)
 {
@@ -3432,6 +3438,7 @@ static int __init hscif_early_console_setup(struct ea=
rlycon_device *device,
=20
 OF_EARLYCON_DECLARE(sci, "renesas,sci", sci_early_console_setup);
 OF_EARLYCON_DECLARE(scif, "renesas,scif", scif_early_console_setup);
+OF_EARLYCON_DECLARE(scif, "renesas,scif-r7s9210", rzscifa_early_console_se=
tup);
 OF_EARLYCON_DECLARE(scifa, "renesas,scifa", scifa_early_console_setup);
 OF_EARLYCON_DECLARE(scifb, "renesas,scifb", scifb_early_console_setup);
 OF_EARLYCON_DECLARE(hscif, "renesas,hscif", hscif_early_console_setup);


Chris
