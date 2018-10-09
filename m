Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:43782 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727219AbeJJCaV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Oct 2018 22:30:21 -0400
Received: by mail-lf1-f68.google.com with SMTP id p34-v6so2108187lfg.10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 09 Oct 2018 12:11:54 -0700 (PDT)
Subject: [PATCH 2/2] thermal: rcar_gen3_thermal: add R8A77980 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <3c96d51e-fc36-2ff9-03a8-176c4c0ed365@cogentembedded.com>
Message-ID: <ffa4ab74-aa7c-553a-6246-022e3af7d9fa@cogentembedded.com>
Date: Tue, 9 Oct 2018 22:11:51 +0300
MIME-Version: 1.0
In-Reply-To: <3c96d51e-fc36-2ff9-03a8-176c4c0ed365@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the R-Car V3H (R8A77980) SoC support to the R-Car gen3 thermal driver.

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/thermal/rcar_gen3_thermal.c |    1 +
 1 file changed, 1 insertion(+)

Index: linux-soc-thermal/drivers/thermal/rcar_gen3_thermal.c
===================================================================
--- linux-soc-thermal.orig/drivers/thermal/rcar_gen3_thermal.c
+++ linux-soc-thermal/drivers/thermal/rcar_gen3_thermal.c
@@ -321,6 +321,7 @@ static const struct of_device_id rcar_ge
 	{ .compatible = "renesas,r8a7795-thermal", },
 	{ .compatible = "renesas,r8a7796-thermal", },
 	{ .compatible = "renesas,r8a77965-thermal", },
+	{ .compatible = "renesas,r8a77980-thermal", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rcar_gen3_thermal_dt_ids);
