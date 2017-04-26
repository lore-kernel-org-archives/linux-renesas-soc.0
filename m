Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:39488 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1763466AbdDZLwf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Apr 2017 07:52:35 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/5] usb: gadget: udc: renesas_usb3: add DMAC support
Date: Wed, 26 Apr 2017 20:50:06 +0900
Message-ID: <1493207411-24416-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Feribe's usb.git / testing/next branch
(the commit id = 28ea6be01e2cf244c461a40c8e9593816f894412.)

This patch set has 2 things:
 - Fixes some minor issues.
 - Add support for dedicated DMAC.

If possible, I want the patches [1/5] to [4/5] to be applied to v4.12-rcN.
I think the patch [5/5] will be applied to v4.13 (or later).
Should I submit them sepaletely?

Yoshihiro Shimoda (5):
  usb: gadget: udc: renesas_usb3: fix pm_runtime functions calling
  usb: gadget: udc: renesas_usb3: fix deadlock by spinlock
  usb: gadget: udc: renesas_usb3: lock for PN_ registers access
  usb: gadget: udc: renesas_usb3: Fix PN_INT_ENA disabling timing
  usb: gadget: udc: renesas_usb3: add support for dedicated DMAC

 drivers/usb/gadget/udc/renesas_usb3.c | 438 +++++++++++++++++++++++++++++++++-
 1 file changed, 425 insertions(+), 13 deletions(-)

-- 
1.9.1
