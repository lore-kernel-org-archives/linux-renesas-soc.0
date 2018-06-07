Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33482 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932788AbeFGTpK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Jun 2018 15:45:10 -0400
Received: by mail-wr0-f194.google.com with SMTP id k16-v6so11033499wro.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 07 Jun 2018 12:45:10 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
To: geert+renesas@glider.be, jroedel@suse.de, horms@verge.net.au,
        magnus.damm@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] iommu/shmobile: Remove unused include/linux/platform_data/sh_ipmmu.h header
Date: Thu,  7 Jun 2018 19:44:56 +0000
Message-Id: <1528400696-32609-1-git-send-email-clabbe@baylibre.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

include/linux/platform_data/sh_ipmmu.h is unused since commit ae50dc4874c5 ("iommu/shmobile: Remove unused Renesas IPMMU/IPMMUI")
Let's remove it.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 include/linux/platform_data/sh_ipmmu.h | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 include/linux/platform_data/sh_ipmmu.h

diff --git a/include/linux/platform_data/sh_ipmmu.h b/include/linux/platform_data/sh_ipmmu.h
deleted file mode 100644
index 39f7405cdac5..000000000000
--- a/include/linux/platform_data/sh_ipmmu.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* sh_ipmmu.h
- *
- * Copyright (C) 2012  Hideki EIRAKU
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; version 2 of the License.
- */
-
-#ifndef __SH_IPMMU_H__
-#define __SH_IPMMU_H__
-
-struct shmobile_ipmmu_platform_data {
-	const char * const *dev_names;
-	unsigned int num_dev_names;
-};
-
-#endif /* __SH_IPMMU_H__ */
-- 
2.16.4
