Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:33133 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751810AbdHPNWw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 09:22:52 -0400
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-serial@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, magnus.damm@gmail.com,
        laurent.pinchart@ideasonboard.com, wsa@the-dreams.de,
        robh@kernel.org, peda@axentia.se, geert@linux-m68k.org,
        linux-i2c@vger.kernel.org,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 6/6] dt-bindings: slave-device: add reg property
Date: Wed, 16 Aug 2017 15:22:28 +0200
Message-Id: <1502889748-31499-7-git-send-email-ulrich.hecht+renesas@gmail.com>
In-Reply-To: <1502889748-31499-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1502889748-31499-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This adds a new DT property to define the index used by a multiplexer to
select the device.

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 Documentation/devicetree/bindings/serial/slave-device.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/serial/slave-device.txt b/Documentation/devicetree/bindings/serial/slave-device.txt
index 40110e0..f9b0783 100644
--- a/Documentation/devicetree/bindings/serial/slave-device.txt
+++ b/Documentation/devicetree/bindings/serial/slave-device.txt
@@ -30,6 +30,8 @@ Optional Properties:
 		      way to reset the device
 		    * device baud rate is configured by its firmware but
 		      there is no way to request the actual settings
+- reg		: Index used to select the device if it is controlled by a
+		  multiplexer.
 
 Example:
 
-- 
2.7.4
