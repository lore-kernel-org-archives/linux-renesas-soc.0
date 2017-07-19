Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:40861 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751376AbdGSHUA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jul 2017 03:20:00 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: renesas_usbhs: fixes for system suspend/resume
Date: Wed, 19 Jul 2017 16:16:53 +0900
Message-ID: <1500448615-25287-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Felipe's usb.git / testing/fixes branch
(the commit id = 781001ff9678e5df048cca3d4290c1638a28cafa).

Yoshihiro Shimoda (2):
  usb: renesas_usbhs: fix usbhsc_resume() for !USBHSF_RUNTIME_PWCTRL
  usb: renesas_usbhs: gadget: disable all eps when the driver stops

 drivers/usb/renesas_usbhs/common.c     |  4 +++-
 drivers/usb/renesas_usbhs/mod_gadget.c | 31 ++++++++++++++++++++++++-------
 2 files changed, 27 insertions(+), 8 deletions(-)

-- 
1.9.1
