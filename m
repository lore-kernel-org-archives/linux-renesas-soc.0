Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] arm64: defconfig: Enlarge CMA alignment to 2 MiB
Date: Fri, 27 Jan 2017 17:03:16 +0100
Message-Id: <1485532996-19719-1-git-send-email-geert+renesas@glider.be>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Some IOMMUs (e.g. Renesas IPMMU/VMSA) support only page sizes of 4 KiB,
2 MiB, and 1 GiB.

With the default setting of CONFIG_CMA_ALIGNMENT = 8, allocations larger
than 1 MiB are aligned to a 1 MiB boundary only.  Hence a 2 MiB
allocation may not be aligned, leading to a mapping of 512 4 KiB pages.

Increase CONFIG_CMA_ALIGNMENT to allow mapping a 2 MiB buffer using a
single PTE, decreasing memory usage and TLB pressure.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Is this useful?

Should there instead be different defaults in Kconfig, depending on
enabled platform support?
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cea17afae855f589..1acc422052050770 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -143,6 +143,7 @@ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_DMA_CMA=y
+CONFIG_CMA_ALIGNMENT=9
 CONFIG_MTD=y
 CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
-- 
1.9.1
