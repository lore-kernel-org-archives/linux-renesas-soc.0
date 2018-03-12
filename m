Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:43968 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932376AbeCLVmk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 17:42:40 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: qemu-devel@nongnu.org
Cc: Michael Davidsaver <mdavidsaver@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 2/3] nvram: at24c: prevent segfault by checking "rom-size"
Date: Mon, 12 Mar 2018 22:42:29 +0100
Message-Id: <20180312214230.17561-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
References: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The value for "rom-size" is used as a divisor, so it must not be 0 or it
will segfault. A size of 0 wouldn't make sense as well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 hw/nvram/eeprom_at24c.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index 8507516b7e..d82710e1df 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -120,6 +120,11 @@ int at24c_eeprom_init(I2CSlave *i2c)
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
