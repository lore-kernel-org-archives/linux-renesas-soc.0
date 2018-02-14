Return-Path: <devicetree-owner@vger.kernel.org>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: horms@verge.net.au, magnus.damm@gmail.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/4] arm64: defconfig: Enable USB-DMAC for R-Car
Date: Wed, 14 Feb 2018 15:23:30 +0900
Message-Id: <1518589412-7330-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1518589412-7330-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1518589412-7330-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Enable the R-Car's USB-DMAC controller. This controller will be used
by HS-USB (renesas_usbhs driver). Since the renesas_usbhs driver
(CONFIG_USB_RENESAS_USBHS_UDC) is enabled as module, the USB-DMAC
driver is also enabled as module.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 59c11a5..9f55541 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -501,6 +501,7 @@ CONFIG_QCOM_BAM_DMA=y
 CONFIG_QCOM_HIDMA_MGMT=y
 CONFIG_QCOM_HIDMA=y
 CONFIG_RCAR_DMAC=y
+CONFIG_RENESAS_USB_DMAC=m
 CONFIG_VFIO=y
 CONFIG_VFIO_PCI=y
 CONFIG_VIRTIO_PCI=y
-- 
1.9.1

