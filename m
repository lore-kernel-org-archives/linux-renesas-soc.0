Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3861935AC3E
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Mar 2026 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449475; cv=none; b=c3vvo0sNwmpmYYgVJUqsLLbLZws5GHMC0Od00Ogscs84vWk8IOujLtw0nKsbL+ullTTILv9ur6URfewoKsOxw2W5v9tJ4beMR10pILjaqt0svsChm7UhPkhKFyvdf6XUyL26iMRnsZDagXKRd/B8Mk+xFNv/EDT8SGF7me5cbLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449475; c=relaxed/simple;
	bh=KHd2mc922FwxoGh3YHHjWmLsMVLhFkTvnuSUKZvP5MY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SHP4SoX8foyF65YTOmtz2GzHMa0bvtaU3/xXYaKzSfM2jlVMI0vYt5OJsG9iUxmcO4yJ42hpUgWSlCvoelaEWLVsTmIdOXsLbimm7Yhy72u6OVWUlb68K9HImH4gaaOd8FcKbASdamHcjv9ehkK2mHR1DMi6dTCq5JJ9KXGZ0Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241B1C19423;
	Mon,  2 Mar 2026 11:04:33 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: shmobile: defconfig: Refresh for v7.0-rc1
Date: Mon,  2 Mar 2026 12:04:28 +0100
Message-ID: <d5faca8fe1db69d584f3097c269be7813ceffd33.1772449420.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh the defconfig for Renesas ARM systems:
  - Move various DRM config symbols (moved in commit 22ba3bb3ff2a8e5a
    ("drm/Kconfig: sort driver Kconfig source list")),
  - Drop CONFIG_NFS_V4_1=y (removed in commit 7537db24806fdc3d ("NFS:
    Merge CONFIG_NFS_V4_1 with CONFIG_NFS_V4")).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v7.1.
---
 arch/arm/configs/shmobile_defconfig | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index ef487eab17cc70aa..6f9696e9fe17ddcc 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -140,17 +140,17 @@ CONFIG_VIDEO_ADV7604_CEC=y
 CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
 CONFIG_DRM_FBDEV_EMULATION=y
-CONFIG_DRM_RCAR_DU=y
-# CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
-CONFIG_DRM_SHMOBILE=y
-CONFIG_DRM_PANEL_EDP=y
-CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
 CONFIG_DRM_LVDS_CODEC=y
 CONFIG_DRM_SII902X=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
+CONFIG_DRM_PANEL_EDP=y
+CONFIG_DRM_PANEL_SIMPLE=y
+CONFIG_DRM_RCAR_DU=y
+# CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
+CONFIG_DRM_SHMOBILE=y
 CONFIG_FB_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_AS3711=y
@@ -217,7 +217,6 @@ CONFIG_TMPFS=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
-CONFIG_NFS_V4_1=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-- 
2.43.0

