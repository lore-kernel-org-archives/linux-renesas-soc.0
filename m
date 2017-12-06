Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:39056 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752484AbdLFIWt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Dec 2017 03:22:49 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: renesas_usbhs: modify fifo/pipe buffer clear handling
Date: Wed,  6 Dec 2017 17:18:30 +0900
Message-Id: <1512548313-20175-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Felipe's usb.git / testing next branch
(commit id = 3ed9bbf28b6bc494606b4c1847073343f96d85db).

Yoshihiro Shimoda (3):
  usb: renesas_usbhs: remove redundant polling in usbhsf_fifo_barrier()
  usb: renesas_usbhs: add usbhs_pipe_clear_without_sequence() function
  usb: renesas_usbhs: use PIPEnCLR.ACLRM instead of {C,Dn}FIFOCTR.BCLR
    in usbhs_pkt_pop()

 drivers/usb/renesas_usbhs/fifo.c | 21 +++++++--------------
 drivers/usb/renesas_usbhs/pipe.c | 19 ++++++++++++++-----
 drivers/usb/renesas_usbhs/pipe.h |  2 ++
 3 files changed, 23 insertions(+), 19 deletions(-)

-- 
1.9.1
