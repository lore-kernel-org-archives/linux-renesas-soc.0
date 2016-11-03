Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:35020 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758184AbcKCSG6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Nov 2016 14:06:58 -0400
Received: by mail-lf0-f54.google.com with SMTP id b14so45998088lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 03 Nov 2016 11:06:58 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 1/9] dt: arm: shmobile: add M3ULCB board DT bindings
Date: Thu,  3 Nov 2016 21:06:57 +0300
Message-Id: <1478196417-1177-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1478196375-1131-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add M3ULCB Device tree bindings Documentation, listing it as a supported
board.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 9a60cb3..94f2c5f 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -63,6 +63,8 @@ Boards:
     compatible = "renesas,kzm9g", "renesas,sh73a0"
   - Lager (RTP0RC7790SEB00010S)
     compatible = "renesas,lager", "renesas,r8a7790"
+  - M3ULCB (R-Car Starter Kit Pro, RTP0RC7796SKB00010S)
+    compatible = "renesas,m3ulcb", "renesas,r8a7796";
   - Marzen (R0P7779A00010S)
     compatible = "renesas,marzen", "renesas,r8a7779"
   - Porter (M2-LCDP)
-- 
1.9.1
