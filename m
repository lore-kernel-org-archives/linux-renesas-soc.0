Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41674 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751066AbeETHAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 03:00:41 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: qemu-devel@nongnu.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 RESEND 3/3] nvram: at24c: use standard error reporting
Date: Sun, 20 May 2018 09:00:37 +0200
Message-Id: <20180520070037.8593-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180520070037.8593-1-wsa+renesas@sang-engineering.com>
References: <20180520070037.8593-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Replace the ERR macro with error_report() because fprintf is deprecated.
This also fixes the prefix printed out twice.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 hw/nvram/eeprom_at24c.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index ab1ef686e2..c35b29e503 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -13,6 +13,7 @@
 #include "hw/hw.h"
 #include "hw/i2c/i2c.h"
 #include "sysemu/block-backend.h"
+#include "qemu/error-report.h"
 
 /* #define DEBUG_AT24C */
 
@@ -22,9 +23,6 @@
 #define DPRINTK(FMT, ...) do {} while (0)
 #endif
 
-#define ERR(FMT, ...) fprintf(stderr, TYPE_AT24C_EE " : " FMT, \
-                            ## __VA_ARGS__)
-
 #define TYPE_AT24C_EE "at24c-eeprom"
 #define AT24C_EE(obj) OBJECT_CHECK(EEPROMState, (obj), TYPE_AT24C_EE)
 
@@ -63,8 +61,7 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
         if (ee->blk && ee->changed) {
             int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
             if (len != ee->rsize) {
-                ERR(TYPE_AT24C_EE
-                        " : failed to write backing file\n");
+                error_report("failed to write backing file");
             }
             DPRINTK("Wrote to backing file\n");
         }
@@ -125,7 +122,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
     EEPROMState *ee = AT24C_EE(i2c);
 
     if (!ee->rsize) {
-        ERR("rom-size not allowed to be 0\n");
+        error_report("rom-size not allowed to be 0");
         exit(1);
     }
 
@@ -135,7 +132,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
         int64_t len = blk_getlength(ee->blk);
 
         if (len != ee->rsize) {
-            ERR(TYPE_AT24C_EE " : Backing file size %lu != %u\n",
+            error_report("Backing file size %lu != %u",
                     (unsigned long)len, (unsigned)ee->rsize);
             exit(1);
         }
@@ -143,8 +140,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
         if (blk_set_perm(ee->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
                          BLK_PERM_ALL, &error_fatal) < 0)
         {
-            ERR(TYPE_AT24C_EE
-                    " : Backing file incorrect permission\n");
+            error_report("Backing file incorrect permission");
             exit(1);
         }
     }
@@ -166,8 +162,7 @@ void at24c_eeprom_reset(DeviceState *state)
         int len = blk_pread(ee->blk, 0, ee->mem, ee->rsize);
 
         if (len != ee->rsize) {
-            ERR(TYPE_AT24C_EE
-                    " : Failed initial sync with backing file\n");
+            error_report("Failed initial sync with backing file");
         }
         DPRINTK("Reset read backing file\n");
     }
-- 
2.11.0
