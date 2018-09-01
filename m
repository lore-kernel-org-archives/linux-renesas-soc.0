Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43471 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726968AbeIAXH0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 1 Sep 2018 19:07:26 -0400
Received: by mail-lf1-f68.google.com with SMTP id h64-v6so12337775lfi.10
        for <linux-renesas-soc@vger.kernel.org>; Sat, 01 Sep 2018 11:54:30 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] clk: renesas: r8a77980: add CMT clocks
To: "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk@vger.kernel.org
References: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Message-ID: <32394fbc-1b10-5708-2769-38cc2eff5042@cogentembedded.com>
Date: Sat, 1 Sep 2018 21:54:27 +0300
MIME-Version: 1.0
In-Reply-To: <5b7895ac-11c1-ac2d-837b-56726bc6226a@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Now that RCLK has been added by Geert, we can add the CMT module clocks.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'clk-renesas' branch of Geert's 'renesas-drivers.git'
repo.

 drivers/clk/renesas/r8a77980-cpg-mssr.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
===================================================================
--- renesas-drivers.orig/drivers/clk/renesas/r8a77980-cpg-mssr.c
+++ renesas-drivers/drivers/clk/renesas/r8a77980-cpg-mssr.c
@@ -119,6 +119,10 @@ static const struct mssr_mod_clk r8a7798
 	DEF_MOD("msiof0",		 211,	R8A77980_CLK_MSO),
 	DEF_MOD("sys-dmac2",		 217,	R8A77980_CLK_S0D3),
 	DEF_MOD("sys-dmac1",		 218,	R8A77980_CLK_S0D3),
+	DEF_MOD("cmt3",			 300,	R8A77980_CLK_R),
+	DEF_MOD("cmt2",			 301,	R8A77980_CLK_R),
+	DEF_MOD("cmt1",			 302,	R8A77980_CLK_R),
+	DEF_MOD("cmt0",			 303,	R8A77980_CLK_R),
 	DEF_MOD("tpu0",			 304,	R8A77980_CLK_S3D4),
 	DEF_MOD("sdif",			 314,	R8A77980_CLK_SD0),
 	DEF_MOD("pciec0",		 319,	R8A77980_CLK_S2D2),
