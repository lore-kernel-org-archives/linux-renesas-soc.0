Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A0C18E778
	for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Oct 2024 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240812; cv=none; b=FXvsUPHZhV5PS9W0iKsLc8y2UnKFh3xgbVsNHpBD/d4wChzfD8To8WvRnqeCPZ442sEGPSY82uZRutGY/0Lj3xUm78KAxiuL/52GQDikEbfRUcKD91fyMBD0VtDvh5PpYtAdtk1HUrRXygi6rS9/LSBa6+q06XpGLT6D4j/O7Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240812; c=relaxed/simple;
	bh=fuf1hMLtgnHB/UbPAKArjy1K9sbITK4larZQqJoTs98=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eBzBeCUiRe4/KYx9LGwcgijQELgUcSVFW6FhZawSDnzE+TgwNzlvRE7GERFAjWt66Kx6WcWcJJAdwmEbafii+5nxdHxYxFfJG3DhCB10ChrHknBmFQ9XiL8xZ5+wGU/urExUGBgLzGOW7vMHAkqo4OZZDbpLtgc8L0xELx1SsPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9a0:3f16:2bd7:49ca])
	by laurent.telenet-ops.be with cmsmtp
	id Rkfy2D00H1MdCM201kfyxr; Fri, 18 Oct 2024 10:40:02 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1iWN-003z2E-Dn;
	Fri, 18 Oct 2024 10:39:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t1iWc-005rfp-BT;
	Fri, 18 Oct 2024 10:39:58 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: white-hawk-cpu-common: Add pin control for DSI-eDP IRQ
Date: Fri, 18 Oct 2024 10:39:55 +0200
Message-Id: <89bab2008891be1f003a3c0dbcdf36af3b98da70.1729240573.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the DSI to eDP bridge was added, pin control for the IRQ pin was
left out, because the pin controller did not support INTC-EX pins yet.

Commit 10544ec1b3436037 ("pinctrl: renesas: r8a779g0: Add INTC-EX
pins, groups, and function") added support for these pins, so add the
missing pin control description.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.13.

 arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
index 337ba68342c475b5..f24814d7c924ed51 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-cpu-common.dtsi
@@ -238,6 +238,9 @@ &i2c1 {
 	clock-frequency = <400000>;
 
 	bridge@2c {
+		pinctrl-0 = <&irq0_pins>;
+		pinctrl-names = "default";
+
 		compatible = "ti,sn65dsi86";
 		reg = <0x2c>;
 
@@ -341,6 +344,11 @@ i2c1_pins: i2c1 {
 		function = "i2c1";
 	};
 
+	irq0_pins: irq0 {
+		groups = "intc_ex_irq0_a";
+		function = "intc_ex";
+	};
+
 	keys_pins: keys {
 		pins = "GP_5_0", "GP_5_1", "GP_5_2";
 		bias-pull-up;
-- 
2.34.1

