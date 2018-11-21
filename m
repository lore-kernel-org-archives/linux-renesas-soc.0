Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-eopbgr1410100.outbound.protection.outlook.com ([40.107.141.100]:62514
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726039AbeKUREi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 12:04:38 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: "balbi@kernel.org" <balbi@kernel.org>
CC: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/2] usb: renesas_usbhs: Remove dummy runtime PM callbacks
Date: Wed, 21 Nov 2018 06:31:23 +0000
Message-ID: <1542781735-8548-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1542781735-8548-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1542781735-8548-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Jarkko Nikula <jarkko.nikula@linux.intel.com>

Platform drivers don't need dummy runtime PM callbacks that just return
success in order to have runtime PM happening. This has changed since
following commits:

commit 05aa55dddb9e ("PM / Runtime: Lenient generic runtime pm callbacks")
commit 543f2503a956 ("PM / platform_bus: Allow runtime PM by default")
commit 8b313a38ecff ("PM / Platform: Use generic runtime PM callbacks direc=
tly")

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[shimoda: revise git commit description style]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs=
/common.c
index a3e1290..0e760f2 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -874,23 +874,9 @@ static int usbhsc_resume(struct device *dev)
 	return 0;
 }
=20
-static int usbhsc_runtime_nop(struct device *dev)
-{
-	/* Runtime PM callback shared between ->runtime_suspend()
-	 * and ->runtime_resume(). Simply returns success.
-	 *
-	 * This driver re-initializes all registers after
-	 * pm_runtime_get_sync() anyway so there is no need
-	 * to save and restore registers here.
-	 */
-	return 0;
-}
-
 static const struct dev_pm_ops usbhsc_pm_ops =3D {
 	.suspend		=3D usbhsc_suspend,
 	.resume			=3D usbhsc_resume,
-	.runtime_suspend	=3D usbhsc_runtime_nop,
-	.runtime_resume		=3D usbhsc_runtime_nop,
 };
=20
 static struct platform_driver renesas_usbhs_driver =3D {
--=20
1.9.1
