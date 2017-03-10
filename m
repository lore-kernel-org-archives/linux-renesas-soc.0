Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:63161 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S935932AbdCJNDh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Mar 2017 08:03:37 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC 0/2] usb: host: [eo]hci-plat: set hcd->phy to avoid phy_get_() in usb_add_hcd()
Date: Fri, 10 Mar 2017 22:01:24 +0900
Message-ID: <1489150886-27862-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The usb_add_hcd() will call phy_{get,init,power_on}() if hcd->phy is not set.
After the usb_add_hcd() call phy_power_on(), it keeps until usb_remove_hcd().
And then, even if the system turns suspend, the usb core keeps the phy power.
I think that each host driver should handle the phy power. So, this patch
sets hcd->phy before usb_add_hcd() to avoid phy_get() in usb_add_hcd().

I'm not sure that this is a suitable way. (e.g. usb_add_hcd() should not call
phy_get()?) So, I marked "RFC" into this patch set.

Yoshihiro Shimoda (2):
  usb: host: ehci-platform: set hcd->phy to avoid phy_get() in
    usb_add_hcd()
  usb: host: ehci-platform: set hcd->phy to avoid phy_get() in
    usb_add_hcd()

 drivers/usb/host/ehci-platform.c | 2 ++
 drivers/usb/host/ohci-platform.c | 2 ++
 2 files changed, 4 insertions(+)

-- 
1.9.1
