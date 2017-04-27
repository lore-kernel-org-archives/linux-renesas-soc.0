Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:31289 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1756310AbdD0TMo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 15:12:44 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] usb: r8a66597-hcd: select a different endpoint on timeout
Date: Thu, 27 Apr 2017 12:12:02 -0700
Message-Id: <20170427191202.21252-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

If multiple endpoints on a single device have pending IN URBs and one
endpoint times out due to NAKs (perfectly legal), select a different
endpoint URB to try.
The existing code only checked to see another device address has pending
URBs and ignores other IN endpoints on the current device address. This
leads to endpoints never getting serviced if one endpoint is using NAK as
a flow control method.

Fixes: 5d3043586db4 ("usb: r8a66597-hcd: host controller driver for R8A6659")
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/usb/host/r8a66597-hcd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index bfa7fa3d2eea..9c3413d550bb 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -1785,6 +1785,7 @@ static void r8a66597_td_timer(unsigned long _r8a66597)
 		pipe = td->pipe;
 		pipe_stop(r8a66597, pipe);
 
+		/* Select a different address or endpoint */
 		new_td = td;
 		do {
 			list_move_tail(&new_td->queue,
@@ -1794,7 +1795,8 @@ static void r8a66597_td_timer(unsigned long _r8a66597)
 				new_td = td;
 				break;
 			}
-		} while (td != new_td && td->address == new_td->address);
+		} while (td != new_td && td->address == new_td->address &&
+			td->pipe->info.epnum == new_td->pipe->info.epnum);
 
 		start_transfer(r8a66597, new_td);
 
-- 
2.11.0
