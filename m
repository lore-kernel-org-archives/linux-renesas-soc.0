Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:61751 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752429AbcHVIt2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Aug 2016 04:49:28 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] usb: gadget: add a new quirk to avoid skb_reserve in u_ether.c
Date: Mon, 22 Aug 2016 17:48:24 +0900
Message-ID: <1471855708-10897-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Felipe's usb.git / testing/next branch.
(commit id = fcb8eae8d83c12770f8de915df01f7191dc697a3)

I submitted this patch set as RFC in last month and nobody said anything.
So, I submitted this without RFC :)

Changes from RFC version:
 - rebase on the latest testing/next branch.
 - revise the commit description and typo in patch 1.


Yoshihiro Shimoda (4):
  usb: gadget: add a new quirk to avoid skb_reserve in u_ether.c
  usb: gadget: u_ether: add a flag to avoid skb_reserve() calling
  usb: gadget: f_ncm: add support for no_skb_reserve
  usb: renesas_usbhs: set quirk_avoids_skb_reserve if USB-DMAC is used

 drivers/usb/gadget/function/f_ncm.c    |  2 ++
 drivers/usb/gadget/function/u_ether.c  |  5 ++++-
 drivers/usb/gadget/function/u_ether.h  |  1 +
 drivers/usb/renesas_usbhs/mod_gadget.c |  2 ++
 include/linux/usb/gadget.h             | 13 +++++++++++++
 5 files changed, 22 insertions(+), 1 deletion(-)

-- 
1.9.1
