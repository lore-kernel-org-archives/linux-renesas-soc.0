Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relay12.mail.gandi.net ([217.70.178.232]:33521 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752984AbeEKKBV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 May 2018 06:01:21 -0400
From: Jacopo Mondi <jacopo@jmondi.org>
To: niklas.soderlund@ragnatech.se
Cc: Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [PATCH 5/5] convert: Accept destination format as parameter
Date: Fri, 11 May 2018 12:00:39 +0200
Message-Id: <1526032839-14536-6-git-send-email-jacopo@jmondi.org>
In-Reply-To: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
References: <1526032839-14536-1-git-send-email-jacopo@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Accept the destination image format as thrid parameter of the convert
function.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
---
 convert.sh | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/convert.sh b/convert.sh
index 4059868..878ac63 100755
--- a/convert.sh
+++ b/convert.sh
@@ -2,6 +2,7 @@
 
 F=$(dirname $1)/$(basename $1 .bin)
 FRAME_SIZE=${2:-1280x720}
+FORMAT=${3:-RGB565}
 
-raw2rgbpnm -f RGB565 -s $FRAME_SIZE $F.bin $F.pnm
+raw2rgbpnm -f $FORMAT -s $FRAME_SIZE $F.bin $F.pnm
 convert $F.pnm $F.png
-- 
2.7.4
