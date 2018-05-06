Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:37616 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751572AbeEFLYQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 May 2018 07:24:16 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: trivial@kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/9] base: core: fix typo 'can by' to 'can be'
Date: Sun,  6 May 2018 13:23:47 +0200
Message-Id: <20180506112404.24872-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180506112404.24872-1-wsa+renesas@sang-engineering.com>
References: <20180506112404.24872-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index b610816eb887f9..4993bd8dfc52c5 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2684,7 +2684,7 @@ static int device_move_class_links(struct device *dev,
 /**
  * device_move - moves a device to a new parent
  * @dev: the pointer to the struct device to be moved
- * @new_parent: the new parent of the device (can by NULL)
+ * @new_parent: the new parent of the device (can be NULL)
  * @dpm_order: how to reorder the dpm_list
  */
 int device_move(struct device *dev, struct device *new_parent,
-- 
2.11.0
