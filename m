Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:40911 "EHLO
	relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752864AbcFHHdT (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 8 Jun 2016 03:33:19 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <balbi@kernel.org>
CC: <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <stable@vger.kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/2] usb: renesas_usbhs: protect the CFIFOSEL setting in usbhsg_ep_enable()
Date: Wed, 8 Jun 2016 16:32:50 +0900
Message-ID: <1465371170-4828-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1465371170-4828-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1465371170-4828-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch fixes an issue that the CFIFOSEL register value is possible
to be changed by usbhsg_ep_enable() wrongly. And then, a data transfer
using CFIFO may not work correctly.

For example:
 # modprobe g_multi file=usb-storage.bin
 # ifconfig usb0 192.168.1.1 up
 (During the USB host is sending file to the mass storage)
 # ifconfig usb0 down

In this case, since the u_ether.c may call usb_ep_enable() in
eth_stop(), if the renesas_usbhs driver is also using CFIFO for
mass storage, the mass storage may not work correctly.

So, this patch adds usbhs_lock() and usbhs_unlock() calling in
usbhsg_ep_enable() to protect CFIFOSEL register. This is because:
 - CFIFOSEL.CURPIPE = 0 is also needed for the pipe configuration
 - The CFIFOSEL (fifo->sel) is already protected by usbhs_lock()

Fixes: 97664a207bc2 ("usb: renesas_usbhs: shrink spin lock area")
Cc: <stable@vger.kernel.org> # v3.1+
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/usb/renesas_usbhs/mod_gadget.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/renesas_usbhs/mod_gadget.c b/drivers/usb/renesas_usbhs/mod_gadget.c
index 30345c2..50f3363 100644
--- a/drivers/usb/renesas_usbhs/mod_gadget.c
+++ b/drivers/usb/renesas_usbhs/mod_gadget.c
@@ -585,6 +585,9 @@ static int usbhsg_ep_enable(struct usb_ep *ep,
 	struct usbhs_priv *priv = usbhsg_gpriv_to_priv(gpriv);
 	struct usbhs_pipe *pipe;
 	int ret = -EIO;
+	unsigned long flags;
+
+	usbhs_lock(priv, flags);
 
 	/*
 	 * if it already have pipe,
@@ -593,7 +596,8 @@ static int usbhsg_ep_enable(struct usb_ep *ep,
 	if (uep->pipe) {
 		usbhs_pipe_clear(uep->pipe);
 		usbhs_pipe_sequence_data0(uep->pipe);
-		return 0;
+		ret = 0;
+		goto usbhsg_ep_enable_end;
 	}
 
 	pipe = usbhs_pipe_malloc(priv,
@@ -621,6 +625,9 @@ static int usbhsg_ep_enable(struct usb_ep *ep,
 		ret = 0;
 	}
 
+usbhsg_ep_enable_end:
+	usbhs_unlock(priv, flags);
+
 	return ret;
 }
 
-- 
1.9.1
