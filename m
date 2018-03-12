Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:43960 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932282AbeCLVmk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 17:42:40 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: qemu-devel@nongnu.org
Cc: Michael Davidsaver <mdavidsaver@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 1/3] nvram: at24c: remove doubled prefix for ERR
Date: Mon, 12 Mar 2018 22:42:28 +0100
Message-Id: <20180312214230.17561-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
References: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The ERR macro already has the TYPE_AT24C_EE prefix, no need to repeat in
the error message.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 hw/nvram/eeprom_at24c.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 5494351976..8507516b7e 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -60,8 +60,7 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event event)
         if (ee->blk && ee->changed) {
             int len = blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
             if (len != ee->rsize) {
-                ERR(TYPE_AT24C_EE
-                        " : failed to write backing file\n");
+                ERR("failed to write backing file\n");
             }
             DPRINTK("Wrote to backing file\n");
         }
@@ -127,7 +126,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
         int64_t len = blk_getlength(ee->blk);
 
         if (len != ee->rsize) {
-            ERR(TYPE_AT24C_EE " : Backing file size %lu != %u\n",
+            ERR("Backing file size %lu != %u\n",
                     (unsigned long)len, (unsigned)ee->rsize);
             exit(1);
         }
@@ -135,8 +134,7 @@ int at24c_eeprom_init(I2CSlave *i2c)
         if (blk_set_perm(ee->blk, BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE,
                          BLK_PERM_ALL, &error_fatal) < 0)
         {
-            ERR(TYPE_AT24C_EE
-                    " : Backing file incorrect permission\n");
+            ERR("Backing file incorrect permission\n");
             exit(1);
         }
     }
@@ -158,8 +156,7 @@ void at24c_eeprom_reset(DeviceState *state)
         int len = blk_pread(ee->blk, 0, ee->mem, ee->rsize);
 
         if (len != ee->rsize) {
-            ERR(TYPE_AT24C_EE
-                    " : Failed initial sync with backing file\n");
+            ERR("Failed initial sync with backing file\n");
         }
         DPRINTK("Reset read backing file\n");
     }
-- 
2.11.0
