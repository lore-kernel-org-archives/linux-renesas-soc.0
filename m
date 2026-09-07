Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8404A4852
	for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Sep 2026 12:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788784448; cv=none; b=EibFJ0yLfy6aPm6g1eiiiaubp7SOdSPoRNSPy6DTnYt6mZz0YKXsUkajokaE2WdAyq3u3bkKPoN3DwoEeb0j8OJ3JtAI/pUkz6hlu1MJLivrhdPGAcp8S1VNUOmrsysfiBVsat7HkQbeFmGIEdJz0j/g2FMDPE3sltsv0eNRfJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788784448; c=relaxed/simple;
	bh=6l0+1SBqPXbOXKg7CimgquPh8zR3KsSDdNEAzto0yns=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aKZZRrQ+5VCTrI5oGS67up2w7VBpa00bMfBsu/xaBZCEENuJoHPSvjx7OJcRdGcj4I6XcVs3I8ILBCHpRHXD8oZllAPgO22A8GQHM0pHGwYl3SmjUQMASuvKmMbR7mWxxT3v4PXj6ioYkjNKUnOprIpi+msIJHMFOYlhGK48zCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25D661F00A3A;
	Mon,  7 Sep 2026 12:34:05 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v7.3-rc1
Date: Mon,  7 Sep 2026 14:34:03 +0200
Message-ID: <f9a3c0f715be9a0884d56078d4a1486b6e485c26.1788784410.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Disable NVIDIA Olympus erratum 1207 support (not applicable),
  - Move CONFIG_EEPROM_AT24=y (moved in commit cf09b7a05618bea9
    ("eeprom: move nvmem EEPROM drivers to drivers/nvmem/")),
  - Disable 8250/16550 Moxa PCIe device support (not applicable),
  - Enable Renesas RZ/N1 RTC support, as used on the RZ/T2H and RZ/N2H
    EVK boards.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 52d62e26a8e4d8f4..b8a1307c45930b31 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -53,6 +53,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_QCOM_QDF2400_ERRATUM_0065 is not set
 # CONFIG_QCOM_FALKOR_ERRATUM_E1041 is not set
 # CONFIG_NVIDIA_CARMEL_CNP_ERRATUM is not set
+# CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM is not set
 # CONFIG_ROCKCHIP_ERRATUM_3568002 is not set
 # CONFIG_ROCKCHIP_ERRATUM_3588001 is not set
 # CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
@@ -139,7 +140,6 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_SRAM=y
 CONFIG_PCI_ENDPOINT_TEST=y
-CONFIG_EEPROM_AT24=y
 # CONFIG_SCSI_PROC_FS is not set
 CONFIG_BLK_DEV_SD=y
 CONFIG_SCSI_SAS_LIBSAS=y
@@ -178,6 +178,7 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_PCI is not set
 # CONFIG_SERIAL_8250_EXAR is not set
+# CONFIG_SERIAL_8250_MOXA_PCIE is not set
 CONFIG_SERIAL_8250_NR_UARTS=2
 CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_8250_EM=y
@@ -373,6 +374,7 @@ CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_ISL1208=y
 CONFIG_RTC_DRV_RX8581=y
 CONFIG_RTC_DRV_DA9063=y
+CONFIG_RTC_DRV_RZN1=y
 CONFIG_DMADEVICES=y
 CONFIG_DW_EDMA=y
 CONFIG_RCAR_DMAC=y
@@ -426,6 +428,7 @@ CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
 CONFIG_PHY_RZ_G3E_USB3=y
 # CONFIG_ARM64_BRBE is not set
+CONFIG_EEPROM_AT24=y
 CONFIG_NVMEM_RCAR_EFUSE=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
-- 
2.43.0

