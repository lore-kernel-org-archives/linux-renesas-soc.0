Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:41827 "EHLO
        relmlie4.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751347AbdD0TNU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Apr 2017 15:13:20 -0400
From: Chris Brandt <chris.brandt@renesas.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>
Subject: [PATCH] usb: r8a66597-hcd: decrease timeout
Date: Thu, 27 Apr 2017 12:12:49 -0700
Message-Id: <20170427191249.21302-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The timeout for BULK packets was 300ms which is a long time if other
endpoints or devices are waiting for their turn. Changing it to 50ms
greatly increased the overall performance for multi-endpoint devices.

Fixes: 5d3043586db4 ("usb: r8a66597-hcd: host controller driver for R8A6659")
Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
---
 drivers/usb/host/r8a66597-hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/host/r8a66597-hcd.c b/drivers/usb/host/r8a66597-hcd.c
index 9c3413d550bb..7bf78be1fd32 100644
--- a/drivers/usb/host/r8a66597-hcd.c
+++ b/drivers/usb/host/r8a66597-hcd.c
@@ -1269,7 +1269,7 @@ static void set_td_timer(struct r8a66597 *r8a66597, struct r8a66597_td *td)
 			time = 30;
 			break;
 		default:
-			time = 300;
+			time = 50;
 			break;
 		}
 
-- 
2.11.0
