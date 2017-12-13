Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor2.renesas.com ([210.160.252.172]:53486 "EHLO
        relmlie1.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750748AbdLMGva (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 01:51:30 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/4] usb: renesas_usbhs: add extcon notifier for non-otg channel
Date: Wed, 13 Dec 2017 15:46:56 +0900
Message-Id: <1513147620-20925-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the Felipe's usb.git / testing/next branch
(commit id = f2830ad455ec0fdc386baeb9d654f7095bf849da).

Yoshihiro Shimoda (4):
  usb: renesas_usbhs: Add a function to write the UGCTRL2 register
  usb: renesas_usbhs: add a new callback for extcon notifier
  usb: renesas_usbhs: set the mode by using extcon state for non-otg
    channel
  usb: renesas_usbhs: add extcon notifier to set mode for non-otg
    channel

The following patches are required for this feature.
 https://patchwork.kernel.org/patch/10109281/
 https://patchwork.kernel.org/patch/10109287/
 https://patchwork.kernel.org/patch/10109279/
 https://patchwork.kernel.org/patch/10109291/
 https://patchwork.kernel.org/patch/10109285/

 drivers/usb/renesas_usbhs/common.c |  9 +++++++++
 drivers/usb/renesas_usbhs/common.h |  1 +
 drivers/usb/renesas_usbhs/rcar3.c  | 35 +++++++++++++++++++++++++++++++----
 include/linux/usb/renesas_usbhs.h  |  8 ++++++++
 4 files changed, 49 insertions(+), 4 deletions(-)

-- 
1.9.1
