Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48194 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750883AbeEBJ6Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 05:58:16 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 1/2] Revert "cpufreq: dt: Add r8a7796 support to to use generic cpufreq driver"
Date: Wed,  2 May 2018 11:58:05 +0200
Message-Id: <20180502095806.30341-2-horms+renesas@verge.net.au>
In-Reply-To: <20180502095806.30341-1-horms+renesas@verge.net.au>
References: <20180502095806.30341-1-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This reverts commit bea2ebca6b917e46d0c585f416f1326fdf41e69b.

This is no longer needed since the flowing commit and to the best
of my knowledge is not relied on by any upstream DTS:
edeec420de24 ("cpufreq: dt-platdev: Automatically create cpufreq device with OPP v2")

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 3b585e4bfac5..206ae7460f4a 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -67,7 +67,6 @@ static const struct of_device_id whitelist[] __initconst = {
 	{ .compatible = "renesas,r8a7793", },
 	{ .compatible = "renesas,r8a7794", },
 	{ .compatible = "renesas,r8a7795", },
-	{ .compatible = "renesas,r8a7796", },
 	{ .compatible = "renesas,sh73a0", },
 
 	{ .compatible = "rockchip,rk2928", },
-- 
2.11.0
