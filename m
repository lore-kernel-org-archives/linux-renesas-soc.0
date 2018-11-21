Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:62514
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727069AbeKUREm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 12:04:42 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "balbi@kernel.org" <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] usb: renesas_usbhs: Use SIMPLE_DEV_PM_OPS macro
Date: Wed, 21 Nov 2018 06:31:23 +0000
Message-ID: <1542781735-8548-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1542781735-8548-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1542781735-8548-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch uses SIMPLE_DEV_PM_OPS macro instead of struct dev_pm_ops
directly.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs=
/common.c
index 0e760f2..02c1d2b 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -874,10 +874,7 @@ static int usbhsc_resume(struct device *dev)
 	return 0;
 }
=20
-static const struct dev_pm_ops usbhsc_pm_ops =3D {
-	.suspend		=3D usbhsc_suspend,
-	.resume			=3D usbhsc_resume,
-};
+static SIMPLE_DEV_PM_OPS(usbhsc_pm_ops, usbhsc_suspend, usbhsc_resume);
=20
 static struct platform_driver renesas_usbhs_driver =3D {
 	.driver		=3D {
--=20
1.9.1
