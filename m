Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:44765 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752038AbcHXI41 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Aug 2016 04:56:27 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] usb: host: xhci: plat: add support for Renesas r8a7796 SoC
Date: Wed, 24 Aug 2016 17:52:38 +0900
Message-ID: <1472028762-6640-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch is based on the latest Greg's usb.git / usb-next branch.
(commit id = 1aaaa9acaea1dd2878d6c92b45e4c117ef425baf)

Yoshihiro Shimoda (4):
  usb: host: xhci: rcar: add a new firmware version for r8a7796
  usb: host: xhci: rcar: add a macro XHCI_PLAT_RENESAS_RCAR_PRIV
  usb: host: xhci: plat: use XHCI_PLAT_RENESAS_RCAR_PRIV macro for R-Car
  usb: host: xhci: plat: add support for Renesas r8a7796 SoC

 Documentation/devicetree/bindings/usb/usb-xhci.txt |  1 +
 drivers/usb/host/xhci-plat.c                       | 17 ++++++-----------
 drivers/usb/host/xhci-rcar.c                       | 18 +++++++++++++-----
 drivers/usb/host/xhci-rcar.h                       |  9 +++++++++
 4 files changed, 29 insertions(+), 16 deletions(-)

-- 
1.9.1
