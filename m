Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from albert.telenet-ops.be ([195.130.137.90]:34640 "EHLO
        albert.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727284AbeH1SiS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Aug 2018 14:38:18 -0400
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] [LOCAL] arm64: defconfig: Refresh renesas_defconfig for v4.19-rc1
Date: Tue, 28 Aug 2018 16:46:15 +0200
Message-Id: <20180828144615.9851-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Refresh the defconfig for Renesas R-Car Gen3 boards:
  - Move options that have moved,
  - Remove CONFIG_PCIE_DW_PLAT_HOST (auto-disabled),
  - Remove CONFIG_DEBUG_FS (auto-enabled).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/configs/renesas_defconfig | 40 +++++++++++++---------------
 1 file changed, 19 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/configs/renesas_defconfig b/arch/arm64/configs/renesas_defconfig
index e2336fd21e355726..4d831eb8dedd409a 100644
--- a/arch/arm64/configs/renesas_defconfig
+++ b/arch/arm64/configs/renesas_defconfig
@@ -4,6 +4,7 @@ CONFIG_POSIX_MQUEUE=y
 CONFIG_AUDIT=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_PREEMPT=y
 CONFIG_IRQ_TIME_ACCOUNTING=y
 CONFIG_BSD_PROCESS_ACCT=y
 CONFIG_BSD_PROCESS_ACCT_V3=y
@@ -27,9 +28,6 @@ CONFIG_SCHED_AUTOGROUP=y
 CONFIG_BLK_DEV_INITRD=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_PROFILING=y
-CONFIG_JUMP_LABEL=y
-CONFIG_BLK_DEV_INTEGRITY=y
-# CONFIG_IOSCHED_DEADLINE is not set
 CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_R8A774A1=y
 CONFIG_ARCH_R8A7795=y
@@ -46,7 +44,6 @@ CONFIG_PCI_IOV=y
 CONFIG_HOTPLUG_PCI=y
 CONFIG_PCIE_RCAR=y
 CONFIG_PCI_HOST_GENERIC=y
-# CONFIG_PCIE_DW_PLAT_HOST is not set
 # CONFIG_CAVIUM_ERRATUM_22375 is not set
 # CONFIG_CAVIUM_ERRATUM_23154 is not set
 # CONFIG_CAVIUM_ERRATUM_27456 is not set
@@ -58,17 +55,12 @@ CONFIG_PCI_HOST_GENERIC=y
 # CONFIG_HISILICON_ERRATUM_161600802 is not set
 CONFIG_ARM64_VA_BITS_48=y
 CONFIG_SCHED_MC=y
-CONFIG_PREEMPT=y
-CONFIG_KSM=y
-CONFIG_TRANSPARENT_HUGEPAGE=y
-CONFIG_CMA=y
 CONFIG_SECCOMP=y
 CONFIG_KEXEC=y
 CONFIG_CRASH_DUMP=y
 CONFIG_XEN=y
 # CONFIG_ARM64_LSE_ATOMICS is not set
 # CONFIG_ARM64_RAS_EXTN is not set
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
 CONFIG_COMPAT=y
 CONFIG_HIBERNATION=y
 CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
@@ -77,6 +69,22 @@ CONFIG_ARM_CPUIDLE=y
 CONFIG_CPU_FREQ=y
 CONFIG_CPUFREQ_DT=y
 CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
+# CONFIG_DMIID is not set
+CONFIG_VIRTUALIZATION=y
+CONFIG_KVM=y
+CONFIG_ARM64_CRYPTO=y
+CONFIG_CRYPTO_SHA1_ARM64_CE=y
+CONFIG_CRYPTO_SHA2_ARM64_CE=y
+CONFIG_CRYPTO_GHASH_ARM64_CE=y
+CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
+CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
+CONFIG_JUMP_LABEL=y
+CONFIG_BLK_DEV_INTEGRITY=y
+# CONFIG_IOSCHED_DEADLINE is not set
+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
+CONFIG_KSM=y
+CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_CMA=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
@@ -294,7 +302,6 @@ CONFIG_PHY_RCAR_GEN3_USB2=y
 CONFIG_PHY_RCAR_GEN3_USB3=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
-# CONFIG_DMIID is not set
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y
 CONFIG_FANOTIFY=y
@@ -312,21 +319,12 @@ CONFIG_NFS_V4_2=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=y
-CONFIG_VIRTUALIZATION=y
-CONFIG_KVM=y
+CONFIG_CRYPTO_ANSI_CPRNG=y
+# CONFIG_CRYPTO_DEV_VIRTIO is not set
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 CONFIG_PROVE_LOCKING=y
 # CONFIG_FTRACE is not set
-CONFIG_CRYPTO_ANSI_CPRNG=y
-# CONFIG_CRYPTO_DEV_VIRTIO is not set
-CONFIG_ARM64_CRYPTO=y
-CONFIG_CRYPTO_SHA1_ARM64_CE=y
-CONFIG_CRYPTO_SHA2_ARM64_CE=y
-CONFIG_CRYPTO_GHASH_ARM64_CE=y
-CONFIG_CRYPTO_AES_ARM64_CE_CCM=y
-CONFIG_CRYPTO_AES_ARM64_CE_BLK=y
-- 
2.17.1
