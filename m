Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33401 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750713AbeBPUJw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 15:09:52 -0500
Received: by mail-lf0-f67.google.com with SMTP id j193so5630512lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Feb 2018 12:09:51 -0800 (PST)
To: Simon Horman <horms@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] soc: renesas: r8a77970-sysc: fix power area parents
Message-ID: <b133e895-8d5e-fbae-d15a-5cf759f09406@cogentembedded.com>
Date: Fri, 16 Feb 2018 23:09:48 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

According to the figure 9.2(b) of the R-Car Series, 3rd Generation User’s
Manual: Hardware Rev. 0.80 the A2IRn and A2SCn power areas in R8A77970 have
the A3IR area as a parent, thus the SYSC driver has those parents wrong...

Fixes: bab9b2a74fe9 ("soc: renesas: rcar-sysc: add R8A77970 support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/soc/renesas/r8a77970-sysc.c |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

Index: renesas/drivers/soc/renesas/r8a77970-sysc.c
===================================================================
--- renesas.orig/drivers/soc/renesas/r8a77970-sysc.c
+++ renesas/drivers/soc/renesas/r8a77970-sysc.c
@@ -25,12 +25,12 @@ static const struct rcar_sysc_area r8a77
 	  PD_CPU_NOCR },
 	{ "cr7",	0x240, 0, R8A77970_PD_CR7,	R8A77970_PD_ALWAYS_ON },
 	{ "a3ir",	0x180, 0, R8A77970_PD_A3IR,	R8A77970_PD_ALWAYS_ON },
-	{ "a2ir0",	0x400, 0, R8A77970_PD_A2IR0,	R8A77970_PD_ALWAYS_ON },
-	{ "a2ir1",	0x400, 1, R8A77970_PD_A2IR1,	R8A77970_PD_A2IR0 },
-	{ "a2ir2",	0x400, 2, R8A77970_PD_A2IR2,	R8A77970_PD_A2IR0 },
-	{ "a2ir3",	0x400, 3, R8A77970_PD_A2IR3,	R8A77970_PD_A2IR0 },
-	{ "a2sc0",	0x400, 4, R8A77970_PD_A2SC0,	R8A77970_PD_ALWAYS_ON },
-	{ "a2sc1",	0x400, 5, R8A77970_PD_A2SC1,	R8A77970_PD_A2SC0 },
+	{ "a2ir0",	0x400, 0, R8A77970_PD_A2IR0,	R8A77970_PD_A3IR },
+	{ "a2ir1",	0x400, 1, R8A77970_PD_A2IR1,	R8A77970_PD_A3IR },
+	{ "a2ir2",	0x400, 2, R8A77970_PD_A2IR2,	R8A77970_PD_A3IR },
+	{ "a2ir3",	0x400, 3, R8A77970_PD_A2IR3,	R8A77970_PD_A3IR },
+	{ "a2sc0",	0x400, 4, R8A77970_PD_A2SC0,	R8A77970_PD_A3IR },
+	{ "a2sc1",	0x400, 5, R8A77970_PD_A2SC1,	R8A77970_PD_A3IR },
 };
 
 const struct rcar_sysc_info r8a77970_sysc_info __initconst = {
