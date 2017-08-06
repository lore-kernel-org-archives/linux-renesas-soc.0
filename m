Return-Path: <devicetree-owner@vger.kernel.org>
From: "Bui Duc Phuc (Fukuda)" <phucduc.bui@gmail.com>
To: geert+renesas@glider.be, horms@verge.net.au
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sh@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, magnus.damm@gmail.com,
        kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com
Subject: [PATCH] ARM:dts:armadillo800eva: Add console parametters
Date: Sun,  6 Aug 2017 20:55:02 +0700
Message-Id: <1502027702-4366-2-git-send-email-phucduc.bui@gmail.com>
In-Reply-To: <1502027702-4366-1-git-send-email-phucduc.bui@gmail.com>
References: <1502027702-4366-1-git-send-email-phucduc.bui@gmail.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Bui Duc Phuc <phucduc.bui@gmail.com>

After the kernel boot, the login prompt doesn't appear.
This patch will add console parametters to bootargs to fix it.

Signed-off-by: Bui Duc Phuc <phucduc.bui@gmail.com>
---
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index 1788e18..d383b37 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -24,7 +24,8 @@
 	};
 
 	chosen {
-		bootargs = "earlyprintk ignore_loglevel root=/dev/nfs ip=dhcp rw";
+		bootargs = "console=tty0 console=ttySC0,115200 earlyprintk
+				ignore_loglevel root=/dev/nfs ip=dhcp rw";
 		stdout-path = "serial0:115200n8";
 	};
 
-- 
2.7.4

