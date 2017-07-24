Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:35221 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752626AbdGXMdU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jul 2017 08:33:20 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: host: xhci: {plat,rcar}: add support for R-Car H3 ES2.0
Date: Mon, 24 Jul 2017 21:30:10 +0900
Message-ID: <1500899413-28565-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Greg's usb.git / usb-next branch
(the commit id = 141769851cb73e8f986e9ed83129cde3b645288d)

Yoshihiro Shimoda (3):
  usb: host: xhci: rcar: Add firmware_name selection by
    soc_device_match()
  usb: host: xhci: plat: re-fact xhci_plat_priv for R-Car Gen3
  usb: host: xhci: rcar: Add support for R-Car H3 ES2.0

 drivers/usb/host/xhci-plat.c | 10 +---------
 drivers/usb/host/xhci-rcar.c | 40 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 39 insertions(+), 11 deletions(-)

-- 
1.9.1
