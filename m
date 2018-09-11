Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:52178 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726678AbeIKPSi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Sep 2018 11:18:38 -0400
From: Biju Das <biju.das@bp.renesas.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: Biju Das <biju.das@bp.renesas.com>, linux-pm@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 10/10] cpufreq: dt: Add support for r8a7744
Date: Tue, 11 Sep 2018 11:12:51 +0100
Message-Id: <1536660771-32278-11-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
References: <1536660771-32278-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add the compatible strings for supporting the generic cpufreq driver on
the Renesas RZ/G1N (R8A7744) SoC.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index fe14c57..805f8a0 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -58,6 +58,7 @@ static const struct of_device_id whitelist[] __initconst = {
 	{ .compatible = "renesas,r8a73a4", },
 	{ .compatible = "renesas,r8a7740", },
 	{ .compatible = "renesas,r8a7743", },
+	{ .compatible = "renesas,r8a7744", },
 	{ .compatible = "renesas,r8a7745", },
 	{ .compatible = "renesas,r8a7778", },
 	{ .compatible = "renesas,r8a7779", },
-- 
2.7.4
