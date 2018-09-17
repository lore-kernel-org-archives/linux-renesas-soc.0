Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43372 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727329AbeIQOFz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Sep 2018 10:05:55 -0400
Received: by mail-pg1-f193.google.com with SMTP id v66-v6so7306852pgb.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Sep 2018 01:39:31 -0700 (PDT)
From: Magnus Damm <magnus.damm@gmail.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>
Date: Mon, 17 Sep 2018 17:39:30 +0900
Message-Id: <153717357067.480.7556586771925219502.sendpatchset@octo>
In-Reply-To: <153717356234.480.6698281193817518888.sendpatchset@octo>
References: <153717356234.480.6698281193817518888.sendpatchset@octo>
Subject: [PATCH 01/03] dt-bindings: arm: consistently name SH-Mobile AG5 as R8A73A00
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Magnus Damm <damm@opensource.se>

Update the description of the AG5 entry to follow same style as other SoCs.

The actual DT binding remains unchanged.

Signed-off-by: Magnus Damm <damm@opensource.se>
---

 Developed on top of renesas-devel-20180914-v4.19-rc3

 Documentation/devicetree/bindings/arm/shmobile.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- 0001/Documentation/devicetree/bindings/arm/shmobile.txt
+++ work/Documentation/devicetree/bindings/arm/shmobile.txt	2018-09-17 13:00:41.773502304 +0900
@@ -9,7 +9,7 @@ SoCs:
     compatible = "renesas,r7s72100"
   - RZ/A2 (R7S9210)
     compatible = "renesas,r7s9210"
-  - SH-Mobile AG5 (R8A73A00/SH73A0)
+  - SH-Mobile AG5 (R8A73A00)
     compatible = "renesas,sh73a0"
   - R-Mobile APE6 (R8A73A40)
     compatible = "renesas,r8a73a4"
