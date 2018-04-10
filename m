Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:23279 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751820AbeDJFjL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Apr 2018 01:39:11 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/6] usb: gadget: udc: renesas_usb3: fix some major issues
Date: Tue, 10 Apr 2018 14:38:48 +0900
Message-Id: <1523338734-20474-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on v4.16.

Changes from v1:
 - Add Reviewed-by in patch 1, 2, 3 and 4.
 - Revise typo in patch 4.
 - Add new patches as patch 5 and 6.

Yoshihiro Shimoda (6):
  usb: gadget: udc: renesas_usb3: fix double phy_put()
  usb: gadget: udc: renesas_usb3: should remove debugfs
  usb: gadget: udc: renesas_usb3: should call pm_runtime_enable() before
    add udc
  usb: gadget: udc: renesas_usb3: should call devm_phy_get() before add
    udc
  usb: gadget: udc: renesas_usb3: should fail if devm_phy_get() returns
    error
  usb: gadget: udc: renesas_usb3: disable the controller's irqs for
    reconnecting

 drivers/usb/gadget/udc/renesas_usb3.c | 37 +++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

-- 
1.9.1
