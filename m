Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:17334 "EHLO
	relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752007AbcHHMyb (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 08:54:31 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: renesas_usbhs: fix the driver for v4.8
Date: Mon, 8 Aug 2016 21:50:50 +0900
Message-ID: <1470660653-21743-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Felipe's usb.git / testing/fixes branch.
(The commit id = 10493a3c0718 ("usb: dwc3: gadget: increment request->actual once")

Yoshihiro Shimoda (3):
  usb: renesas_usbhs: Fix receiving data corrupt on R-Car Gen3 with dmac
  usb: renesas_usbhs: clear the BRDYSTS in usbhsg_ep_enable()
  usb: renesas_usbhs: Use dmac only if the pipe type is bulk

 drivers/usb/renesas_usbhs/common.c     | 3 ++-
 drivers/usb/renesas_usbhs/fifo.c       | 4 ++--
 drivers/usb/renesas_usbhs/mod_gadget.c | 7 +++++--
 3 files changed, 9 insertions(+), 5 deletions(-)

-- 
1.9.1
