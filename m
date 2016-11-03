Return-Path: <devicetree-owner@vger.kernel.org>
From: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Subject: [PATCH 1/3] dt: arm: shmobile: update H3ULCB board Documentation
Date: Thu,  3 Nov 2016 21:04:44 +0300
Message-Id: <1478196284-982-1-git-send-email-vladimir.barinov@cogentembedded.com>
In-Reply-To: <1478196242-939-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1478196242-939-1-git-send-email-vladimir.barinov@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This updates H3ULCB Device tree bindings Documentation with
official board name

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
---
 Documentation/devicetree/bindings/arm/shmobile.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/shmobile.txt b/Documentation/devicetree/bindings/arm/shmobile.txt
index 94f2c5f..a1e94da 100644
--- a/Documentation/devicetree/bindings/arm/shmobile.txt
+++ b/Documentation/devicetree/bindings/arm/shmobile.txt
@@ -51,7 +51,7 @@ Boards:
     compatible = "renesas,genmai", "renesas,r7s72100"
   - Gose (RTP0RC7793SEB00010S)
     compatible = "renesas,gose", "renesas,r8a7793"
-  - H3ULCB (RTP0RC7795SKB00010S)
+  - H3ULCB (R-Car Starter Kit Premier, RTP0RC7795SKB00010S)
     compatible = "renesas,h3ulcb", "renesas,r8a7795";
   - Henninger
     compatible = "renesas,henninger", "renesas,r8a7791"
-- 
1.9.1

