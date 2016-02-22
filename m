Return-Path: <devicetree-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <horms@verge.net.au>, <magnus.damm@gmail.com>,
	<robh+dt@kernel.org>, <pawel.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <galak@codeaurora.org>
CC: <devicetree@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC v2 9/9] arm64: dts: salvator-x: enable HS-USB
Date: Mon, 22 Feb 2016 18:58:08 +0900
Message-ID: <1456135088-7976-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1456135088-7976-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1456135088-7976-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
index f9d904b..66e7e04 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
+++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
@@ -388,3 +388,7 @@
 &ohci2 {
 	status = "okay";
 };
+
+&hsusb {
+	status = "okay";
+};
-- 
1.9.1

