Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:50829 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751787AbdI0JvR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Sep 2017 05:51:17 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, stable@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] usb: renesas_usbhs: bugfix for v4.14
Date: Wed, 27 Sep 2017 18:47:11 +0900
Message-Id: <1506505633-4688-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

 This patch set is based on the Felipe's usb.git / testing/fixes branch
 (The commit is 7661ca09b2ff98f48693f431bb01fed62830e433).

Changes from v1:
 - Devides two fix things in a patch to two patches.

Yoshihiro Shimoda (2):
  usb: renesas_usbhs: fix the BCLR setting condition for non-DCP pipe
  usb: renesas_usbhs: fix usbhsf_fifo_clear() for RX direction

 drivers/usb/renesas_usbhs/fifo.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

-- 
1.9.1
