Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:16794 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751198AbeDBMVs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Apr 2018 08:21:48 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] usb: gadget: udc: renesas_usb3: fix some major issues
Date: Mon,  2 Apr 2018 21:21:30 +0900
Message-Id: <1522671694-10229-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on v4.16. (I should have realized these issues in
v4.16-rc cycle though...)

Yoshihiro Shimoda (4):
  usb: gadget: udc: renesas_usb3: fix double phy_put()
  usb: gadget: udc: renesas_usb3: should remove debugfs
  usb: gadget: udc: renesas_usb3: should call pm_runtime_enable() before
    add udc
  usb: gadget: udc: renesas_usb3: should call devm_phy_get() before add
    udc

 drivers/usb/gadget/udc/renesas_usb3.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

-- 
1.9.1
