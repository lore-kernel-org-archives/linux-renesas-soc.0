Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798469;
	b=cxUi5CH0x5hpUD9W1v7pDHC2UTznzwLzUZnuwREjo4iEIVcqTHhyBMjMQHqms/1M/7aI
	 qlfEAT2h/rNMXthaLAejdU0oZb9jsthFXVGfSyqx4KJKgWu+MKUGTK5qYFuS7prqRbFQI
	 Od2G2xNEdCppyEJxhLjDwA3mbSKQNHcAXwujV5lLX5xrsXKNdWpukfu3Cf+j1mR6CcixZ
	 srOAUYKl10ks9pdQYH2kSfOtdfxgzV69oJZYUS3JIwt6twQsAUkb/bpSNYXud3rvkKydy
	 ZU51v1eonO5hXNk7/Ulw+5h6iSnSkAYy3ONrvoq5m2uRniU/5OS9jaaeUkttLImzy6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798469;
	h=Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c0Uw+g2EwxMMpWbp4sFtotQBIYOiTAKEyRcbgueiNig=;
	b=cv8uiLQVtWBkKfD5Va9AmNUg4+oXAKcWsiFUAWpDIC+QiU1Gtumqx/Q4c9Ij9gKMhkia
	 KpLZkvbMD6DVVGGumZFfJmFzp2pMlf0G/0dxlmZc71+bVP0+Xf/q0Taeyfzsi/TG2sv3a
	 7qzZ1blIzueGMcXYxvkXpGwmYF+FcwwzZEOOIrzN+tkPtKa+93CC0dao0lWdVlsdDLwD8
	 L88Ge80VYjAYoFqo/awMn4y+ufpcUKhUcUwixnBgO4/w4eNHkuJKoqjmzj8pzpOG6DXDb
	 tT29mzyfP/R7couOCpLsBHeGCJw50kO+vCzRxjgCeDu3SUiG+mKMf1YYq+93Tr7z6BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA0606A31B
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 13:21:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897A71F000C1;
	Wed,  4 Nov 2026 13:21:07 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v7.4-rc1
Date: Wed,  4 Nov 2026 14:21:03 +0100
Message-ID: <d3335368d073f91745c2d24ffd462b11ed18f275.1793798428.git.geert+renesas@glider.be>
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

Refresh the defconfig for Renesas ARM systems:
  - Move CONFIG_SPI_SH_MSIOF=y (moved in commit d696b9109d2315fc ("spi:
    Fix the section ordering in accordance with the comment")),
  - Disable CONFIG_DRM_RCAR_USE_DSC (defaults to yes since commit
    c217ce005b232899 ("drm/rcar-du: dsc: Add rudimentary Renesas R-Car
    V4H DSC driver"), but only used on R-Car V4H),
  - Enable RZ/N1 timer support.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.5.
---
 arch/arm/configs/shmobile_defconfig | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index 58059f943a9b307c..3683276dd82ebd26 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -94,8 +94,8 @@ CONFIG_I2C_RCAR=y
 CONFIG_I2C_SLAVE_EEPROM=y
 CONFIG_SPI=y
 CONFIG_SPI_RSPI=y
-CONFIG_SPI_SH_MSIOF=y
 CONFIG_SPI_SH_HSPI=y
+CONFIG_SPI_SH_MSIOF=y
 CONFIG_PINCTRL_RZA1=y
 CONFIG_PINCTRL_RZA2=y
 CONFIG_PINCTRL_RZN1=y
@@ -149,6 +149,7 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_RCAR_DU=y
+# CONFIG_DRM_RCAR_USE_DSC is not set
 # CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
 CONFIG_DRM_SHMOBILE=y
 CONFIG_FB_DEVICE=y
@@ -199,6 +200,7 @@ CONFIG_RZN1_DMAMUX=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=y
 CONFIG_RZ_DMAC=y
+CONFIG_RZN1_TIMER=y
 CONFIG_ARM_GT_INITIAL_PRESCALER_VAL=1
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_IIO=y
-- 
2.43.0

