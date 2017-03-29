Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:58196 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1755718AbdC2LpK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Mar 2017 07:45:10 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/3] usb: gadget: udc: renesas_usb3: add USB3.0 DRD support
Date: Wed, 29 Mar 2017 20:42:51 +0900
Message-ID: <1490787774-5796-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the latest Felipe's usb.bit / testing/next branch
(commit id = 29986993f67341493988b6c5d68e0653061975b2).

The USB3.0 DRD controller on R-Car Gen3 can change the role via DRD_CON
register in the periperal side sadly, so this patch adds support
for usb role swap feature in this udc driver.
Furtunately, the default setting of the DRD is host side, if a user want
to use host side only, we can handle it easily just to disable the udc driver.

Changes from v1:
 - Remove patch 1 not to add "b-device" mode.
 - Add device_remove_file() calling in renesas_usb3_remove().
 - Use usb3_connect() instead of usb3_check_vbus() in usb3_mode_a_peri().

Yoshihiro Shimoda (3):
  usb: gadget: udc: add USB ID signal monitoring
  usb: gadget: udc: renesas_usb3: add extcon support
  usb: gadget: udc: renesas_usb3: add support for usb role swap

 .../ABI/testing/sysfs-platform-renesas_usb3        |  15 ++
 drivers/usb/gadget/udc/Kconfig                     |   1 +
 drivers/usb/gadget/udc/renesas_usb3.c              | 171 ++++++++++++++++++++-
 3 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-platform-renesas_usb3

-- 
1.9.1
