Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] drivers: firmware: psci: checker: Use psci_is_available()
Date: Wed, 11 Oct 2017 10:03:02 +0200
Message-Id: <1507708982-12336-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1507708982-12336-1-git-send-email-geert+renesas@glider.be>
References: <1507708982-12336-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Use the psci_is_available() helper instead of direct accesses to
psci_ops internals.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/firmware/psci_checker.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/psci_checker.c b/drivers/firmware/psci_checker.c
index 6523ce9628659755..72b40ed2dcce7cf4 100644
--- a/drivers/firmware/psci_checker.c
+++ b/drivers/firmware/psci_checker.c
@@ -54,7 +54,7 @@ static int psci_ops_check(void)
 	int migrate_type = -1;
 	int cpu;
 
-	if (!(psci_ops.cpu_off && psci_ops.cpu_on && psci_ops.cpu_suspend)) {
+	if (!psci_is_available()) {
 		pr_warn("Missing PSCI operations, aborting tests\n");
 		return -EOPNOTSUPP;
 	}
-- 
2.7.4
