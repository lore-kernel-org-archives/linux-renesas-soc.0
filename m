Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41654 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750966AbeETHAk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 03:00:40 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: qemu-devel@nongnu.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 RESEND 1/3] nvram: at24c: prevent segfault by checking "rom-size"
Date: Sun, 20 May 2018 09:00:35 +0200
Message-Id: <20180520070037.8593-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180520070037.8593-1-wsa+renesas@sang-engineering.com>
References: <20180520070037.8593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The value for "rom-size" is used as a divisor, so it must not be 0 or it
will segfault. A size of 0 wouldn't make sense anyhow.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
