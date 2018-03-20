Return-Path: <linux-i2c-owner@vger.kernel.org>
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] i2c: rcar: fix mask value of prohibited bit
Date: Tue, 20 Mar 2018 22:04:14 +0100
Message-Id: <20180320210414.6070-1-wsa+renesas@sang-engineering.com>
Sender: linux-i2c-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>

According to documentation, Bit 7 of ICMSR is unused and 0 should be
written to it. Fix the mask accordingly.

Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
[wsa: edited commit message]
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 4159ebcec2bb61..c6915b83539658 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -102,8 +102,8 @@
 #define RCAR_IRQ_RECV	(MNR | MAL | MST | MAT | MDR)
 #define RCAR_IRQ_STOP	(MST)
 
-#define RCAR_IRQ_ACK_SEND	(~(MAT | MDE) & 0xFF)
-#define RCAR_IRQ_ACK_RECV	(~(MAT | MDR) & 0xFF)
+#define RCAR_IRQ_ACK_SEND	(~(MAT | MDE) & 0x7F)
+#define RCAR_IRQ_ACK_RECV	(~(MAT | MDR) & 0x7F)
 
 #define ID_LAST_MSG	(1 << 0)
 #define ID_FIRST_MSG	(1 << 1)
-- 
2.11.0
