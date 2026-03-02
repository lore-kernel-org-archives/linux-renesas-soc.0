Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB4D33F8D6
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 11:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449514; cv=none; b=F4GMRAwVtk4fHEz5iYdzUX7ZZcYWiMf8aqDnDDhtTF0yBhZ+p5wbc9COZNK0/OiM1dZ+kqP8YWLjhHv4b4auycYtYn/WorIclajbF3PshAVSV/g/yYNdgAqvA4akt/4eBAyOKhu9DVnXCI8ZUNbjKa6sQY7Ntgt6TgS+Qhny29Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449514; c=relaxed/simple;
	bh=BZERYYwZfoEwBJHj6s46XmRaODedHSclex+udI21fYs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JKXDVdk6uBxI+XdkyZZ4YGBQZwqQUFwdb+3DJwEN9azGJZtmumvL2fbSGRRj9QorknXYo8ouB53VBmj9h7q7016yU1QPh/FIBhN2a5Be9VOglMKioFXkyy7DRZPTzVmw6nnSqyLVjvq/lnSTKQZ4Hk+RiVu69VaG61Jk6GArFgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52F68C19423;
	Mon,  2 Mar 2026 11:05:13 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: renesas: defconfig: Refresh for v7.0-rc1
Date: Mon,  2 Mar 2026 12:05:10 +0100
Message-ID: <39e32613f8b894530a517669e16a290cb463f224.1772449482.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM64 systems:
  - Move various DRM config symbols (moved in commit 22ba3bb3ff2a8e5a
    ("drm/Kconfig: sort driver Kconfig source list")),
  - Drop CONFIG_LOGO_LINUX_MONO=n and CONFIG_LOGO_LINUX_VGA16=n
    (disabled by default since commit 994fcd4b107d747b ("video/logo:
    don't select LOGO_LINUX_MONO and LOGO_LINUX_VGA16 by default")),
  - Drop CONFIG_NFS_V4_1=y (removed in commit 7537db24806fdc3d ("NFS:
    Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Not intended for upstream merge.
To be applied to the topic/renesas-defconfig branch.
---
 arch/arm64/configs/renesas_defconfig | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index 65582f6cfca510ae..792d5ebb1553ef30 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -291,10 +291,6 @@ CONFIG_VIDEO_ADV7604_CEC=y
 # CONFIG_MEDIA_TUNER_XC5000 is not set
 CONFIG_DRM=y
 CONFIG_DRM_FBDEV_EMULATION=y
-CONFIG_DRM_RCAR_DU=y
-CONFIG_DRM_RCAR_DW_HDMI=y
-CONFIG_DRM_RZG2L_DU=y
-CONFIG_DRM_PANEL_LVDS=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_I2C_NXP_TDA998X=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
@@ -305,14 +301,16 @@ CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=y
 CONFIG_DRM_DW_HDMI_I2S_AUDIO=y
 CONFIG_DRM_DW_HDMI_CEC=y
-CONFIG_DRM_PANFROST=y
 CONFIG_DRM_POWERVR=y
+CONFIG_DRM_PANEL_LVDS=y
+CONFIG_DRM_PANFROST=y
+CONFIG_DRM_RCAR_DU=y
+CONFIG_DRM_RCAR_DW_HDMI=y
+CONFIG_DRM_RZG2L_DU=y
 CONFIG_FB_DEVICE=y
 CONFIG_BACKLIGHT_CLASS_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_LOGO=y
-# CONFIG_LOGO_LINUX_MONO is not set
-# CONFIG_LOGO_LINUX_VGA16 is not set
 CONFIG_SOUND=y
 CONFIG_SND=y
 # CONFIG_SND_SPI is not set
@@ -435,7 +433,6 @@ CONFIG_HUGETLBFS=y
 CONFIG_SQUASHFS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
 CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
-- 
2.43.0

