Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:52511 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751037AbdCQK3D (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Mar 2017 06:29:03 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: host: xhci-plat: add support suspend/resume for R-Car
Date: Fri, 17 Mar 2017 19:02:32 +0900
Message-ID: <1489744955-29553-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch adds support suspend/resume for R-Car controllers.
The controllers need firmware downloading and the current code has
such process only when probe timing. After suspend the system and
the power of controller down, the driver needs to re-download the firmware
in resume timing. This patch adds such a process.
Also, since previous xhci-plat code didnn't handle the clk in suspend/resume,
this patch set has such process.

Yoshihiro Shimoda (3):
  usb: host: xhci-plat: enable clk in resume timing
  usb: host: xhci-plat: add resume_quirk()
  usb: host: xhci-plat: set resume_quirk() for R-Car controllers

 drivers/usb/host/xhci-plat.c | 29 ++++++++++++++++++++++++++++-
 drivers/usb/host/xhci-plat.h |  1 +
 drivers/usb/host/xhci-rcar.c | 11 +++++++++++
 drivers/usb/host/xhci-rcar.h |  6 ++++++
 4 files changed, 46 insertions(+), 1 deletion(-)

-- 
1.9.1
