Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:10256 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750752AbdCMG1j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 02:27:39 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <stern@rowland.harvard.edu>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] usb: host: [eo]hci-plat: set hcd->phy to avoid phy_get_() in usb_add_hcd()
Date: Mon, 13 Mar 2017 15:25:22 +0900
Message-ID: <1489386324-31353-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The usb_add_hcd() will call phy_{get,init,power_on}() if hcd->phy is not set.
After the usb_add_hcd() call phy_power_on(), it keeps until usb_remove_hcd().
And then, even if the system turns suspend, the usb core keeps the phy power.
I think that each host driver should handle the phy power. So, this patch
sets hcd->phy before usb_add_hcd() to avoid phy_get() in usb_add_hcd().

Changes from v1 (as RFC):
 - Fix the usage condition about priv->phys[].
 - Remove RFC.

Yoshihiro Shimoda (2):
  usb: host: ehci-platform: set hcd->phy to avoid phy_get() in
    usb_add_hcd()
  usb: host: ohci-platform: set hcd->phy to avoid phy_get() in
    usb_add_hcd()

 drivers/usb/host/ehci-platform.c | 3 +++
 drivers/usb/host/ohci-platform.c | 3 +++
 2 files changed, 6 insertions(+)

-- 
1.9.1
