Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:41516 "EHLO
	relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757176AbcFACkT (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 31 May 2016 22:40:19 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>
CC: <linux-usb@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: host: xhci: rcar: fix the quirks setting of XHCI_NO_64BIT_SUPPORT
Date: Wed, 1 Jun 2016 11:40:04 +0900
Message-ID: <1464748806-7932-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

I'm afraid but I found a regression of xhci-rcar in v4.7-rc1.
This regression is caused by the following commit:

commit b1c127ae990bccf0187d741c1695a61e54de1943
Author: Felipe Balbi <felipe.balbi@linux.intel.com>
Date:   Fri Apr 22 13:17:16 2016 +0300

    usb: host: xhci: plat: make use of new methods in xhci_plat_priv
    
    Now that the code has been refactored enough,
    switching over to using ->plat_start() and
    ->init_quirk() becomes a very simple patch.
    
    After this patch, there are no further uses for
    xhci_plat_type_is() which will be removed in a
    follow-up patch.
    
    Acked-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
    Signed-off-by: Felipe Balbi <felipe.balbi@linux.intel.com>
    Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

< Overview >
The regression is the quirks flag "XHCI_NO_64BIT_SUPPORT" will be overwritten
by xhci_gen_setup(). Then, the driver will not work correctly.

< Detail >
Since the previous code will do the following, the quirks flag can be set:

xhci_plat_setup()
 -> xhci_gen_setup(hcd, xhci_plat_quirks);
  -> xhci->quirks = quirks;
   -> get_quirks() [This is xhci_plat_quirks]
    -> xhci->quirks |= XHCI_NO_64BIT_SUPPORT

However, after we applied the patch above, the quirks will disappear:

xhci_plat_setup()
 -> xhci_priv_init_quirk();
  -> xhci_rcar_init_quirk();
   -> xhci->quirks |= XHCI_NO_64BIT_SUPPORT
  -> xhci_gen_setup(hcd, xhci_plat_quirks);
   -> xhci->quirks = quirks; <----------------- here
    -> get_quirks() [This is xhci_plat_quirks]

So, I submitted incremental patches to resolve this issue like the followings:

xhci_plat_setup()
 -> xhci_priv_init_quirk();
  -> xhci_rcar_init_quirk();
  -> xhci_gen_setup(hcd, xhci_plat_quirks);
   -> xhci->quirks = quirks;
    -> get_quirks() [This is xhci_plat_quirks]
     -> xhci->quirks |= priv->quirks (XHCI_NO_64BIT_SUPPORT)

Yoshihiro Shimoda (2):
  usb: host: xhci: plat: add ->quirks value for platform-specific
  usb: host: xhci: rcar: fix the quirks setting of XHCI_NO_64BIT_SUPPORT

 drivers/usb/host/xhci-plat.c | 12 +++++++++++-
 drivers/usb/host/xhci-plat.h |  2 ++
 drivers/usb/host/xhci-rcar.c | 21 ---------------------
 3 files changed, 13 insertions(+), 22 deletions(-)

-- 
1.9.1
