Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:47716 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S969549AbeCSVbK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 17:31:10 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 1/3] nvram: at24c: prevent segfault by checking "rom-size"
Date: Mon, 19 Mar 2018 22:30:59 +0100
Message-Id: <20180319213101.6100-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180319213101.6100-1-wsa+renesas@sang-engineering.com>
References: <20180319213101.6100-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The value for "rom-size" is used as a divisor, so it must not be 0 or it
will segfault. A size of 0 wouldn't make sense anyhow.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 hw/nvram/eeprom_at24c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 22183f5360..ccf78b25e4 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -121,6 +121,11 @@ int at24c_eeprom_init(I2CSlave *i2c)
 {
     EEPROMState *ee = AT24C_EE(i2c);
 
+    if (!ee->rsize) {
+        ERR("rom-size not allowed to be 0\n");
+        exit(1);
+    }
+
     ee->mem = g_malloc0(ee->rsize);
 
     if (ee->blk) {
-- 
2.11.0
