Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:40180 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753150AbeDJMnI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 08:43:08 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] extcon: int3496: use proper GPIO include
Date: Tue, 10 Apr 2018 14:43:02 +0200
Message-Id: <20180410124302.29932-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Since commit eca0f13c836a ("extcon: int3496: Ignore incorrect
IoRestriction for ID pin"), the driver doesn't use GPIOF_* flags
anymore. We can thus now drop the deprecated include file for GPIO and
use the new one.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Compile tested only.

@linusw: one more gone

 drivers/extcon/extcon-intel-int3496.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-intel-int3496.c b/drivers/extcon/extcon-intel-int3496.c
index acaccb128fc4..fd24debe58a3 100644
--- a/drivers/extcon/extcon-intel-int3496.c
+++ b/drivers/extcon/extcon-intel-int3496.c
@@ -20,7 +20,7 @@
 
 #include <linux/acpi.h>
 #include <linux/extcon-provider.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-- 
2.11.0
