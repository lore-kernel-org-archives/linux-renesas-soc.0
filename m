Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:39647 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751448AbeCTHkF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 03:40:05 -0400
Received: by mail-pl0-f65.google.com with SMTP id k22-v6so488767pls.6
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Mar 2018 00:40:05 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: robh@kernel.org, geert+renesas@glider.be,
        sergei.shtylyov@cogentembedded.com,
        vladimir.barinov@cogentembedded.com, horms+renesas@verge.net.au,
        Magnus Damm <magnus.damm@gmail.com>
Date: Tue, 20 Mar 2018 16:40:16 +0900
Message-Id: <152153161677.8310.9675462405281337962.sendpatchset@little-apple>
Subject: [PATCH] clk: renesas: cpg-mssr: Adjust r8a77980 ifdef
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm+renesas@opensource.se>

Adjust the R8A77980-specific #ifdefs to use CLK instead of ARCH
to follow same style as other SoCs.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Noticed in renesas-drivers-2018-03-13-v4.16-rc5
 
 drivers/clk/renesas/renesas-cpg-mssr.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/drivers/clk/renesas/renesas-cpg-mssr.c
+++ work/drivers/clk/renesas/renesas-cpg-mssr.c	2018-03-20 11:57:19.320607110 +0900
@@ -705,7 +705,7 @@ static const struct of_device_id cpg_mss
 		.data = &r8a77970_cpg_mssr_info,
 	},
 #endif
-#ifdef CONFIG_ARCH_R8A77980
+#ifdef CONFIG_CLK_R8A77980
 	{
 		.compatible = "renesas,r8a77980-cpg-mssr",
 		.data = &r8a77980_cpg_mssr_info,
