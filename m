Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:62915 "EHLO
	relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1161191AbcFHHdD (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 03:33:03 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: renesas_usbhs: fix issues on specific situations
Date: Wed, 8 Jun 2016 16:32:48 +0900
Message-ID: <1465371170-4828-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Felipe's usb.git / testing/fixes branch.
(commit id = 50c763f8c1bac0dc00f7788a75f227276c0efd54)

Yoshihiro Shimoda (2):
  usb: renesas_usbhs: fix NULL pointer dereference in xfer_work()
  usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable()

 drivers/usb/renesas_usbhs/fifo.c       | 18 ++++++++++++++----
 drivers/usb/renesas_usbhs/mod_gadget.c |  9 ++++++++-
 2 files changed, 22 insertions(+), 5 deletions(-)

-- 
1.9.1
