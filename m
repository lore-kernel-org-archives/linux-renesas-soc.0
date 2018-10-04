Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:41326 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727530AbeJED6V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 23:58:21 -0400
Received: by mail-lf1-f67.google.com with SMTP id q39-v6so7836822lfi.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Oct 2018 14:03:16 -0700 (PDT)
Subject: [PATCH 2/2] thermal: rcar_thermal: add R8A77970 support
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <366d8e06-6164-94ff-823f-6b0d1e2d8d53@cogentembedded.com>
Message-ID: <65ec6fcf-931a-a807-af1b-f204c03344f0@cogentembedded.com>
Date: Fri, 5 Oct 2018 00:03:13 +0300
MIME-Version: 1.0
In-Reply-To: <366d8e06-6164-94ff-823f-6b0d1e2d8d53@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the R-Car V3M (R8A77970) SoC support to the R-Car gen2 thermal driver.
The hardware is the same as in the R-Car D3 (R8A77995) plus the CIVM status
register (we don't use).

Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/thermal/rcar_thermal.c |    4 ++++
 1 file changed, 4 insertions(+)

Index: linux-soc-thermal/drivers/thermal/rcar_thermal.c
===================================================================
--- linux-soc-thermal.orig/drivers/thermal/rcar_thermal.c
+++ linux-soc-thermal/drivers/thermal/rcar_thermal.c
@@ -113,6 +113,10 @@ static const struct of_device_id rcar_th
 		 .data = &rcar_gen2_thermal,
 	},
 	{
+		.compatible = "renesas,thermal-r8a77970",
+		.data = &rcar_gen3_thermal,
+	},
+	{
 		.compatible = "renesas,thermal-r8a77995",
 		.data = &rcar_gen3_thermal,
 	},
