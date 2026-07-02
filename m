Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC173EDAAE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  2 Jul 2026 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782998308; cv=none; b=IQOci9WJ2zuklDFcI6PtuuQptdsoCdC7bm9O9oxy5MJd5pq2awDW9rkgqmg4tDEBDkhjd042aDY40z07wnhDNAWmDZZ5qpzXYYObtj1roRE7wabJ3fn5pcXTz6/6c2YHW4N/5wy8exFBv7AHQnBY7dn0OzuENrSXbLGIOk+LO1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782998308; c=relaxed/simple;
	bh=wMZtQew277rpQ9ShI7zWbViEmCXbIvL94L0Ybxqd6r8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lrOd6Dp8nxfZCNrzYjl/uKk57M1b41gGypelpYGzp8DgGmJDf84RERCvCJLbgNN9xA+Aw2cKzlCm8d9xVF+1HdcvRKx2cQ0bXLPOkTY5K/qC3GU3+xZO/sQhLVlDOFmHJITvcxc+c9G1SdPLflumciqELbJsGyc1Jdkgy2cN3Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C59051F000E9;
	Thu,  2 Jul 2026 13:18:26 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL/RFC] arm64: renesas: defconfig: Enable basic SCMI support
Date: Thu,  2 Jul 2026 15:18:21 +0200
Message-ID: <fbc22f38ff46ce2d662b4ae7fef3cda538198ca9.1782998043.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable support for the ARM System Control and Management Interface
(SCMI) Message Protocol, and the Renesas R-Car Multifunctional
Interface, as used on R-Car X5H Ironhide for communication with the
System Control Processor (SCP).

Disable support for the unneeded SCMI Quirks framework and for unused
transport methods.

For now this covers just the SCMI base protocol, as that is all that is
described in Ironhide's DTS.  Hence disable all other protocols that
would otherwise be auto-enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Should the unused but auto-enabled options be left enabled?

Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 45cc9f0f3ca34bd5..52d62e26a8e4d8f4 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -123,6 +123,10 @@ CONFIG_PCI_EPF_TEST=y
 CONFIG_PCI_PWRCTRL_GENERIC=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_ARM_SCMI_PROTOCOL=y
+# CONFIG_ARM_SCMI_QUIRKS is not set
+# CONFIG_ARM_SCMI_TRANSPORT_SMC is not set
+# CONFIG_ARM_SCMI_TRANSPORT_OPTEE is not set
 # CONFIG_DMIID is not set
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
@@ -396,6 +400,9 @@ CONFIG_HWSPINLOCK=y
 # CONFIG_ARM64_ERRATUM_858921 is not set
 CONFIG_RENESAS_OSTM=y
 CONFIG_MAILBOX=y
+CONFIG_RCAR_MFIS=y
+# CONFIG_ARM_SCMI_PERF_DOMAIN is not set
+# CONFIG_ARM_SCMI_POWER_DOMAIN is not set
 CONFIG_EXTCON_USB_GPIO=y
 CONFIG_MEMORY=y
 CONFIG_RENESAS_RPCIF=y
@@ -411,6 +418,7 @@ CONFIG_PWM_RENESAS_TPU=y
 CONFIG_RESET_GPIO=y
 CONFIG_RESET_RZG2L_USBPHY_CTRL=y
 CONFIG_RESET_RZV2H_USB2PHY=y
+# CONFIG_RESET_SCMI is not set
 CONFIG_PHY_CAN_TRANSCEIVER=y
 CONFIG_PHY_R8A779F0_ETHERNET_SERDES=y
 CONFIG_PHY_RCAR_GEN3_PCIE=y
-- 
2.43.0

