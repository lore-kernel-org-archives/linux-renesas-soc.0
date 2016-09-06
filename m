Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from xavier.telenet-ops.be ([195.130.132.52]:60667 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755776AbcIFMSU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 08:18:20 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] cpufreq: dt: Add support for r8a7792
Date: Tue,  6 Sep 2016 14:18:20 +0200
Message-Id: <1473164300-22017-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the compatible string for supporting the generic cpufreq driver on
the Renesas R-Car V2H (r8a7792) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Untested due to lack of hardware.
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 285ed3e6494e9d22..276378a43321a4e0 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -52,6 +52,7 @@ static const struct of_device_id machines[] __initconst = {
 	{ .compatible = "renesas,r8a7779", },
 	{ .compatible = "renesas,r8a7790", },
 	{ .compatible = "renesas,r8a7791", },
+	{ .compatible = "renesas,r8a7792", },
 	{ .compatible = "renesas,r8a7793", },
 	{ .compatible = "renesas,r8a7794", },
 	{ .compatible = "renesas,sh73a0", },
-- 
1.9.1
