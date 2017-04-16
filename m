Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:32920 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756258AbdDPSBf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Apr 2017 14:01:35 -0400
From: Marek Vasut <marek.vasut@gmail.com>
To: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] of: Add vendor prefix for ROHM Semiconductor
Date: Sun, 16 Apr 2017 20:01:11 +0200
Message-Id: <20170416180111.16795-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

ROHM Semiconductor Co., Ltd. offer PMICs, touchscreen controllers etc.
http://www.rohm.com/web/global/

Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index c7d1b72ec3c5..de191865d1ed 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -266,6 +266,7 @@ richtek	Richtek Technology Corporation
 ricoh	Ricoh Co. Ltd.
 rikomagic	Rikomagic Tech Corp. Ltd
 rockchip	Fuzhou Rockchip Electronics Co., Ltd
+rohm	ROHM Semiconductor Co., Ltd
 samsung	Samsung Semiconductor
 samtec	Samtec/Softing company
 sandisk	Sandisk Corporation
-- 
2.11.0
