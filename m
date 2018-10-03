Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www3345.sakura.ne.jp ([49.212.235.55]:32263 "EHLO
        www3345.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726617AbeJCOOi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 10:14:38 -0400
From: Cao Van Dong <cv-dong@jinso.co.jp>
To: broonie@kernel.org, geert+renesas@glider.be,
        linux-pm@vger.kernel.org
Cc: marc.zyngier@arm.com, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp, cv-dong@jinso.co.jp
Subject: [PATCH v2] thermal_hwmon: Fix the 'No sensors found' error after replacing the parameter NULL by the actual device
Date: Wed,  3 Oct 2018 16:25:51 +0900
Message-Id: <1538551551-3431-1-git-send-email-cv-dong@jinso.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Formerly, when registering the hwmon device, we pass NULL as the device. It's not a problem.
Recently, the developer has replaced the parameter NULL as the device by the actual device.
This causes the "No sensors found" error. Therefore, instead of using the device we will use pass
the parent of that device as parameter. This will sync with the processor on the hwmon core.
This patch is to fix this error.

This patch is based on the v4.19-rc3 tag.

---
 drivers/thermal/thermal_hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hwmon.c
index 40c69a5..a918ba9 100644
--- a/drivers/thermal/thermal_hwmon.c
+++ b/drivers/thermal/thermal_hwmon.c
@@ -143,7 +143,7 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_device *tz)
 	INIT_LIST_HEAD(&hwmon->tz_list);
 	strlcpy(hwmon->type, tz->type, THERMAL_NAME_LENGTH);
 	strreplace(hwmon->type, '-', '_');
-	hwmon->device = hwmon_device_register_with_info(&tz->device, hwmon->type,
+	hwmon->device = hwmon_device_register_with_info(tz->device.parent, hwmon->type,
 							hwmon, NULL, NULL);
 	if (IS_ERR(hwmon->device)) {
 		result = PTR_ERR(hwmon->device);
-- 
2.7.4
