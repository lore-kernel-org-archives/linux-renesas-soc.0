Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:62732 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752837AbeGCKsD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 Jul 2018 06:48:03 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: mathias.nyman@intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: host: xhci-{plat,rcar}: add support for R-Car E3 and a condition check
Date: Tue,  3 Jul 2018 19:46:55 +0900
Message-Id: <1530614818-7634-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Greg's usb.git / usb-next branch
(the commit id = 399111aaa7b9b4a2f7f20d38943ab55b6a67653e).

 - Patch 1 and 2 are for adding R-Car E3 support.
 - Patch 2 is for adding a condition check about PLL active.

Yoshihiro Shimoda (3):
  usb: host: xhci-plat: add firmware_name for R-Car Gen3
  usb: host: xhci-rcar: Simplify getting the firmware name for R-Car
    Gen3
  usb: host: xhci-rcar: Add a condition check about PLL active

 drivers/usb/host/xhci-plat.c |  1 +
 drivers/usb/host/xhci-rcar.c | 43 ++++++++++++++++++++++++++++---------------
 2 files changed, 29 insertions(+), 15 deletions(-)

-- 
1.9.1
