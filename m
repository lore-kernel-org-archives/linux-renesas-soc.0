Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:43976 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932408AbeCLVml (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Mar 2018 17:42:41 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: qemu-devel@nongnu.org
Cc: Michael Davidsaver <mdavidsaver@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH 3/3] nvram: at24c: use a sane default for "rom-size"
Date: Mon, 12 Mar 2018 22:42:30 +0100
Message-Id: <20180312214230.17561-4-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
References: <20180312214230.17561-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

0 as "rom-size" doesn't make much sense, let's use the smallest 24cXX
which has 128 byte.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 hw/nvram/eeprom_at24c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
index d82710e1df..de988f8d07 100644
--- a/hw/nvram/eeprom_at24c.c
+++ b/hw/nvram/eeprom_at24c.c
@@ -168,7 +168,7 @@ void at24c_eeprom_reset(DeviceState *state)
 }
 
 static Property at24c_eeprom_props[] = {
-    DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 0),
+    DEFINE_PROP_UINT32("rom-size", EEPROMState, rsize, 128),
     DEFINE_PROP_BOOL("writable", EEPROMState, writable, true),
     DEFINE_PROP_DRIVE("drive", EEPROMState, blk),
     DEFINE_PROP_END_OF_LIST()
-- 
2.11.0
