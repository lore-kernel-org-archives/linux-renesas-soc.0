Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:51621 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751502AbeCTQTN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Mar 2018 12:19:13 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v3 2/3] nvram: at24c: use a sane default for "rom-size"
Date: Tue, 20 Mar 2018 17:18:49 +0100
Message-Id: <20180320161850.2104-3-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180320161850.2104-1-wsa+renesas@sang-engineering.com>
References: <20180320161850.2104-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

0 as "rom-size" will lead to an error message. Let's use the size of a
small 24c01 which has 128 byte.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 hw/nvram/eeprom_at24c.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index ccf78b25e4..ab1ef686e2 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -28,6 +28,9 @@
 #define TYPE_AT24C_EE "at24c-eeprom"
 #define AT24C_EE(obj) OBJECT_CHECK(EEPROMState, (obj), TYPE_AT24C_EE)
 
+/* default is the size of a 24c01 EEPROM */
+#define AT24C_ROMSIZE_DEFAULT 128
+
 typedef struct EEPROMState {
     I2CSlave parent_obj;
 
@@ -171,7 +174,7 @@ void at24c_eeprom_reset(DeviceState *state)
 }
 
 static Property at24c_eeprom_props[] = {
-    DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
+    DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, AT24C_ROMSIZE_DEFAULT),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
     DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
     DEFINE_PROP_END_OF_LIST()
-- 
2.11.0
