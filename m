Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:9683 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S932117AbdIYIFI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Sep 2017 04:05:08 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: gadget: udc: renesas_usb3: bugfix for v4.14
Date: Mon, 25 Sep 2017 17:01:22 +0900
Message-Id: <1506326485-26254-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the Felipe's usb.git / testing/fixes branch
(The commit is 7661ca09b2ff98f48693f431bb01fed62830e433).

Yoshihiro Shimoda (3):
  usb: gadget: udc: renesas_usb3: fix for no-data control transfer
  usb: gadget: udc: renesas_usb3: fix Pn_RAMMAP.Pn_MPKT value
  usb: gadget: udc: renesas_usb3: Fix return value of usb3_write_pipe()

 drivers/usb/gadget/udc/renesas_usb3.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

-- 
1.9.1
