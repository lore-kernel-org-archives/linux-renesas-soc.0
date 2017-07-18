Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:36919 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751322AbdGRM3v (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jul 2017 08:29:51 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: gadget: udc: renesas_usb3: fixes for v4.13-rc1
Date: Tue, 18 Jul 2017 21:26:39 +0900
Message-ID: <1500380802-26930-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch is based on the latest Felipe's usb.git / testing/fixes branch
(The commit id = 4a71fcb8ac5f94c07bf47a43b13258a52e4fe3ad).

Yoshihiro Shimoda (3):
  usb: gadget: udc: renesas_usb3: fix free size in
    renesas_usb3_dma_free_prd()
  usb: gadget: udc: renesas_usb3: fix zlp transfer by the dmac
  usb: gadget: udc: renesas_usb3: protect usb3_ep->started in
    usb3_start_pipen()

 drivers/usb/gadget/udc/renesas_usb3.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

-- 
1.9.1
