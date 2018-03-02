Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:54486 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1424001AbeCBM1u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Mar 2018 07:27:50 -0500
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] ARM: shmobile: defconfig: Disable CONFIG_EMBEDDED
Date: Fri,  2 Mar 2018 13:27:46 +0100
Message-Id: <1519993666-11041-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1519993666-11041-1-git-send-email-geert+renesas@glider.be>
References: <1519993666-11041-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CONFIG_EXPERT exposes too many config options that do not matter for
development.  E.g. it prohibits using the default values for the various
SH_SCI options.  However, CONFIG_EMBEDDED selects CONFIG_EXPERT, so it
cannot be disabled.

Hence disable CONFIG_EMBEDDED, and compensate for the loss of
CONFIG_DEBUG_KERNEL by enabling the latter.

Actual impact, all harmless:
  - CONFIG_NAMESPACES=y (plus a few related CONFIG_*_NS options),
  - CONFIG_SYSCTL_SYSCALL=n,
  - CONFIG_SERIAL_SH_SCI_NR_UARTS changed from 20 to 18,
  - Some HID support became enabled,
  - CONFIG_DEBUG_MEMORY_INIT=y,

Refresh the result.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Enhance patch description,
  - Rebase.
---
 arch/arm/configs/shmobile_defconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
index e3658ec04e837f8a..a701601fbd7618f4 100644
--- a/arch/arm/configs/shmobile_defconfig
+++ b/arch/arm/configs/shmobile_defconfig
@@ -5,8 +5,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
-CONFIG_SYSCTL_SYSCALL=y
-CONFIG_EMBEDDED=y
 CONFIG_PERF_EVENTS=y
 CONFIG_SLAB=y
 CONFIG_ARCH_RENESAS=y
@@ -103,7 +101,6 @@ CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_EM=y
 CONFIG_SERIAL_SH_SCI=y
-CONFIG_SERIAL_SH_SCI_NR_UARTS=20
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_MUX=y
 CONFIG_I2C_DEMUX_PINCTRL=y
@@ -164,7 +161,6 @@ CONFIG_FB_SH_MOBILE_MERAM=y
 # CONFIG_BACKLIGHT_GENERIC is not set
 CONFIG_BACKLIGHT_PWM=y
 CONFIG_BACKLIGHT_AS3711=y
-CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_SOC=y
@@ -225,4 +221,5 @@ CONFIG_NLS_ISO8859_1=y
 CONFIG_PRINTK_TIME=y
 # CONFIG_ENABLE_WARN_DEPRECATED is not set
 # CONFIG_ENABLE_MUST_CHECK is not set
+CONFIG_DEBUG_KERNEL=y
 # CONFIG_ARM_UNWIND is not set
-- 
2.7.4
