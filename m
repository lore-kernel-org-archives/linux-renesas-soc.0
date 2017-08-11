Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52799 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752631AbdHKPhE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Aug 2017 11:37:04 -0400
From: Simon Horman <horms+renesas@verge.net.au>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH] cpufreq: dt: Add r8a7796 support to to use generic cpufreq driver
Date: Fri, 11 Aug 2017 17:36:57 +0200
Message-Id: <1502465817-19804-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>

This patch adds the r8a7796 support the generic cpufreq driver
by adding an appropriate compat string. This is in keeping
with support for other Renesas ARM and arm64 based SoCs.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
[simon: new changelog]
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
 1 file changed, 1 insertion(+)

This is a follow-up for a similar change that has already been accepted
for the r8a7795.


I have provided an integration branch that includes with this patch, those
DTS updates that make use of opp-v2 bindings that depend on this change,
and Renesas clock updates also depended on by the DTS changes.  The result
is working CPUFreq for the r8a7796 (R-Car M3-W).

https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git topic/r8a7796-cpufreq

A description of steps taken to lightly exercise the same feature for the
r88a7795 the above can be found at the link below. The results are the same
for the r8a7796 with the exception that it has two active CPU cores rather
than four.

http://elinux.org/Tests:R-CAR-GEN3-CPUFreq

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index bcee384b3251..233e18ad3948 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -68,6 +68,7 @@ static const struct of_device_id machines[] __initconst = {
 	{ .compatible = "renesas,r8a7793", },
 	{ .compatible = "renesas,r8a7794", },
 	{ .compatible = "renesas,r8a7795", },
+	{ .compatible = "renesas,r8a7796", },
 	{ .compatible = "renesas,sh73a0", },
 
 	{ .compatible = "rockchip,rk2928", },
-- 
2.1.4
