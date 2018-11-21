Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:62514
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726195AbeKUREk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 12:04:40 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "balbi@kernel.org" <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] usb: renesas_usbhs: clean up the code around dev_pm_ops
Date: Wed, 21 Nov 2018 06:31:22 +0000
Message-ID: <1542781735-8548-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on the Felipe's usb.git / testing/next branch
(commit id =3D 9c5f54eb289b244dc9f5e24f56c9a9373582ef35).

The patch 1 comes from the following:
 https://patchwork.kernel.org/patch/10654679/


Jarkko Nikula (1):
  usb: renesas_usbhs: Remove dummy runtime PM callbacks

Yoshihiro Shimoda (1):
  usb: renesas_usbhs: Use SIMPLE_DEV_PM_OPS macro

 drivers/usb/renesas_usbhs/common.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

--=20
1.9.1
