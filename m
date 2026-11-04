Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798516;
	b=vOMMoErax71CZECUITBNOi9Q0LmgTMfwBZv7bMLD4ky28TuEq48gv0qUsbGWQsGF6f6y
	 QfJts1rDMRgDv9ywaOQHxiIA0nw27U87dURd0oyGltn7po5rVRm85WcroiI7+j6XkhtiA
	 gAJwwagZrO++MGTyrKKBm+B/DuL+ugLXmifdeTxfVZpKLVKl17RTo+4SM/+A3CgA2UEhj
	 /yKKoGXjAa0n6Xu4i4Q7HsTr+LTY+6nB8WmCMyTOwajQLIYnkfb+dRmHMyAADTW/+InJ+
	 Hg4SoveUfP2G2QHKFEIvnB6k4NuxD2C8dLVJ6/h5heR77qUuBPaFQG+9OkE3N6pW+rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798516;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=scTI70Tg8hvkhq4dFIqkNBfUsL6wPMgjjdfzf8xkiUc=;
	b=W/BbFyOCQ4KCvOAWguUo+j5bR2yCARWRQl/Gz7a5GmFYK6aRqD23pW1ue/Y0Rj1sE06N
	 ZtNsWj+pwvFrU1lMGxjAvhQeYcUotq8cqpVIcmKHUnBU5Cfhsh9i8iA8054FhKzr0cUra
	 qg8CQbPuUHcB60LP41wW29TpqGIAPEw7gol/hKadXdENRPkQ21he5DWF48VI2NvyEMfLO
	 wlBXVrAfbXyCzu3DCrbpXq1MtACC6ogLAPiwIgR1c01STdcRxrJ6k8VDRjRufyburpYnv
	 N3qUe7+mtsh0DdsgXZfn9EYtLxXp5gyv7FkdtWSsDuAmBh0gh8toY9tQQ7ilKaJb8Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1074F606A326
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 13:21:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9781F00A02;
	Wed,  4 Nov 2026 13:21:54 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/LOCAL] arm64: renesas: defconfig: Refresh for v7.4-rc1
Date: Wed,  4 Nov 2026 14:21:50 +0100
Message-ID: <27bb44d9dd4ca7a8ca9bd47045cdab44266b1e00.1793798477.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Disable support for the NXP iMX8QM/QP ERR050104 erratum (not
    applicable),
  - Drop CONFIG_SERIAL_8250_RUNTIME_UARTS=2 (no longer needed since
    commit dbe1ae2304a3b02c ("kconfig: fix extra output from
    savedefconfig on out-of-range defaults")),
  - Drop CONFIG_I2C_MUX=y (auto-enabled by VIDEO_MAXIM_SERDES since
    commit b8749c5a6856fa4e ("media: i2c: add Maxim GMSL2/3 serializer
    and deserializer framework")),
  - Replace CONFIG_VIDEO_MAX96712=y by CONFIG_VIDEO_MAX96724=y (former
    removed by commit 9e88bdefadd49906 ("staging: media: remove MAX96712
    driver"), latter available since commit bccc36c35947d3f7 ("media:
    i2c: maxim-serdes: add MAX96724 driver")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 8e9d8e41ddf10ba4..3ead81d1155e3a50 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -56,6 +56,7 @@ CONFIG_ARCH_RENESAS=y
 # CONFIG_NVIDIA_OLYMPUS_1027_ERRATUM is not set
 # CONFIG_ROCKCHIP_ERRATUM_3568002 is not set
 # CONFIG_ROCKCHIP_ERRATUM_3588001 is not set
+# CONFIG_NXP_IMX8QM_ERRATUM_ERR050104 is not set
 # CONFIG_SOCIONEXT_SYNQUACER_PREITS is not set
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_NR_CPUS=32
@@ -180,7 +181,6 @@ CONFIG_SERIAL_8250_CONSOLE=y
 # CONFIG_SERIAL_8250_EXAR is not set
 # CONFIG_SERIAL_8250_MOXA_PCIE is not set
 CONFIG_SERIAL_8250_NR_UARTS=2
-CONFIG_SERIAL_8250_RUNTIME_UARTS=2
 CONFIG_SERIAL_8250_EM=y
 # CONFIG_SERIAL_8250_PERICOM is not set
 CONFIG_SERIAL_SH_SCI=y
@@ -189,7 +189,6 @@ CONFIG_SERIAL_DEV_BUS=y
 CONFIG_VIRTIO_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
 CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_MUX=y
 CONFIG_I2C_MUX_PCA954x=y
 CONFIG_I2C_RIIC=y
 CONFIG_I2C_RZV2M=y
@@ -258,6 +257,7 @@ CONFIG_VIDEO_ADV7180=y
 CONFIG_VIDEO_ADV748X=y
 CONFIG_VIDEO_ADV7604=y
 CONFIG_VIDEO_ADV7604_CEC=y
+CONFIG_VIDEO_MAX96724=y
 # CONFIG_MEDIA_TUNER_E4000 is not set
 # CONFIG_MEDIA_TUNER_FC0011 is not set
 # CONFIG_MEDIA_TUNER_FC0012 is not set
@@ -388,7 +388,6 @@ CONFIG_VIRTIO_MMIO=y
 # CONFIG_XEN_PCIDEV_STUB is not set
 CONFIG_STAGING=y
 CONFIG_STAGING_MEDIA=y
-CONFIG_VIDEO_MAX96712=y
 CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_PWM=y
 CONFIG_COMMON_CLK_RS9_PCIE=y
-- 
2.43.0

