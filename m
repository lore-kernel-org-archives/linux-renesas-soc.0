Return-Path: <devicetree-owner@vger.kernel.org>
From: bd-phuc@jinso.co.jp
To: daniel.lezcano@linaro.org, tglx@linutronix.de
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sh@vger.kernel.org, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com,
        horms@verge.net.au, kuninori.morimoto.gx@renesas.com,
        yoshihiro.shimoda.uh@renesas.com, ryusuke.sakato.bx@renesas.com,
        h-inayoshi@jinso.co.jp, cm-hiep@jinso.co.jp, nv-dung@jinso.co.jp
Subject: [PATCH 7/8] clocksource: Kconfig: Modify CMT config support 64bit
Date: Fri,  9 Sep 2016 20:43:13 +0900
Message-Id: <1473421394-9745-8-git-send-email-bd-phuc@jinso.co.jp>
In-Reply-To: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
References: <1473421394-9745-1-git-send-email-bd-phuc@jinso.co.jp>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Bui Duc Phuc <bd-phuc@jinso.co.jp>

Modify CMT config to support 64bit

Signed-off-by: Bui Duc Phuc <bd-phuc@jinso.co.jp>
---
 drivers/clocksource/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 5677886..62c2bcb 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -408,7 +408,7 @@ config SYS_SUPPORTS_EM_STI
         bool
 
 config SH_TIMER_CMT
-	bool "Renesas CMT timer driver" if COMPILE_TEST
+	bool "Renesas CMT timer driver" if ( ARM64 || COMPILE_TEST )
 	depends on GENERIC_CLOCKEVENTS
 	depends on HAS_IOMEM
 	default SYS_SUPPORTS_SH_CMT
-- 
2.7.4

