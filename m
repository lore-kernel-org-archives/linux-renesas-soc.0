Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:40955 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754538AbeBBSWS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Feb 2018 13:22:18 -0500
Received: by mail-lf0-f65.google.com with SMTP id h92so32800520lfi.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Feb 2018 10:22:17 -0800 (PST)
Subject: [PATCH 01/11] soc: renesas: identify R-Car V3H
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
References: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Message-ID: <1e3dd4b4-4775-ab05-ac66-7b61a881a673@cogentembedded.com>
Date: Fri, 2 Feb 2018 21:22:14 +0300
MIME-Version: 1.0
In-Reply-To: <46fca582-220d-e5a7-62cd-2fc77a29846b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add support for identifying the R-Car V3H (R8A77980) SoC.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/soc/renesas/renesas-soc.c |    8 ++++++++
 1 file changed, 8 insertions(+)

Index: renesas/drivers/soc/renesas/renesas-soc.c
===================================================================
--- renesas.orig/drivers/soc/renesas/renesas-soc.c
+++ renesas/drivers/soc/renesas/renesas-soc.c
@@ -149,6 +149,11 @@ static const struct renesas_soc soc_rcar
 	.id	= 0x54,
 };
 
+static const struct renesas_soc soc_rcar_v3h __initconst __maybe_unused = {
+	.family	= &fam_rcar_gen3,
+	.id	= 0x56,
+};
+
 static const struct renesas_soc soc_rcar_d3 __initconst __maybe_unused = {
 	.family	= &fam_rcar_gen3,
 	.id	= 0x58,
@@ -212,6 +217,9 @@ static const struct of_device_id renesas
 #ifdef CONFIG_ARCH_R8A77970
 	{ .compatible = "renesas,r8a77970",	.data = &soc_rcar_v3m },
 #endif
+#ifdef CONFIG_ARCH_R8A77980
+	{ .compatible = "renesas,r8a77980",	.data = &soc_rcar_v3h },
+#endif
 #ifdef CONFIG_ARCH_R8A77995
 	{ .compatible = "renesas,r8a77995",	.data = &soc_rcar_d3 },
 #endif
