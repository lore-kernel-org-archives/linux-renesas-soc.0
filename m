Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33476 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751303AbcGUM1z (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 08:27:55 -0400
Received: by mail-lf0-f46.google.com with SMTP id b199so60561281lfe.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Jul 2016 05:27:55 -0700 (PDT)
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 2/2] dt: arm: shmobile: add H3ULCB board DT bindings
Date: Thu, 21 Jul 2016 15:27:53 +0300
Message-Id: <1469104073-20490-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1469103962-20378-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1469103962-20378-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Add H3ULCB Device tree bindings Documentation, listing it as a supported
board.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 1df32d3..69e4246 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -49,6 +49,8 @@ Boards:
     compatible = "renesas,genmai", "renesas,r7s72100"
   - Gose
     compatible = "renesas,gose", "renesas,r8a7793"
+  - H3ULCB (RTP0RC7795SKB00010S)
+    compatible = "renesas,h3ulcb", "renesas,r8a7795";
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
   - Koelsch (RTP0RC7791SEB00010S)
-- 
1.9.1
