Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1931CD4A
	for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Nov 2023 08:12:48 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d60:3031:68fb:d1ad])
	by michel.telenet-ops.be with bizsmtp
	id DUCm2B00E3EmSSH06UCmUJ; Wed, 22 Nov 2023 17:12:46 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5pq4-009ylC-95;
	Wed, 22 Nov 2023 17:12:46 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1r5pqI-00GzNP-7j;
	Wed, 22 Nov 2023 17:12:46 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/3] ARM: shmobile: defconfig: Switch to DRM_SHMOBILE
Date: Wed, 22 Nov 2023 17:12:41 +0100
Message-Id: <3d17d8418ddabeb84ff5fa1cdd16439ddc84286f.1700669207.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700669207.git.geert+renesas@glider.be>
References: <cover.1700669207.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now the DRM driver for the SH-Mobile LCD Controller supports DT, replace
the legacy frame buffer device driver by the DRM driver.

Disable frame buffer device drivers, as this was the last frame buffer
device driver for Renesas ARM systems.
Enable CONFIG_DRM_FBDEV_EMULATION and CONFIG_FB_DEVICE, as these are no
longer auto-enabled since commit bb6c4507fe825f1b ("drm: fix up fbdev
Kconfig defaults").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm/configs/shmobile_defconfig | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index e2ea369548eb0a8d..c47a638172a89bfd 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -135,8 +135,10 @@ CONFIG_VIDEO_ADV7604=y
 CONFIG_VIDEO_ADV7604_CEC=y
 CONFIG_VIDEO_ML86V7667=y
 CONFIG_DRM=y
+CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_RCAR_DU=y
 # CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
+CONFIG_DRM_SHMOBILE=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_EDP=y
 CONFIG_DRM_DISPLAY_CONNECTOR=y
@@ -145,8 +147,7 @@ CONFIG_DRM_SII902X=y
 CONFIG_DRM_SIMPLE_BRIDGE=y
 CONFIG_DRM_I2C_ADV7511=y
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
-CONFIG_FB=y
-CONFIG_FB_SH_MOBILE_LCDC=y
+CONFIG_FB_DEVICE=y
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_AS3711=y
 CONFIG_SOUND=y
-- 
2.34.1

