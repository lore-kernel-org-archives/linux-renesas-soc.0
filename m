Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B73955C0;
	Thu, 10 Sep 2026 08:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028365; cv=none; b=pOtMmt8T1z3C9A7NfwRHgAZkgjSmu9EPG/kHxzrFhVMqEjHP0vEh2WvOc5r6q2z4sOHqIOKLWCLWLPNXtSt9UXYSHLtLhD6ofycIihZoG75pFQCfPCqRCn6VDglFyz/kbGEPrjDTrBqMojRt9ru83j0SgCs8wq4+0sPYzrQPu3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028365; c=relaxed/simple;
	bh=YizKYJ2BgxRPni7o0gvqOZtvTZfiyWA4oPxjAPWN/Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gch3yJhC4wc0ZWZ3WIolqCQZr4o7iHvvJIdBA4MJ3pEvlp0YClniAezr4K1bEJj5wcMuIZvbHnUd112z9Zq+LvcVl1MrfCeznojDynTVybGwMojCQi8COCkzcDwWF/Twv+OOuBnPe3HLoPZ1/8SnsHgCbYQEn5joIMqKsbkN3FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151421F000FF;
	Thu, 10 Sep 2026 08:19:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Alessio Belle <alessio.belle@imgtec.com>,
	Luigi Santivetti <luigi.santivetti@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Anh Nguyen <anh.nguyen.pv@renesas.com>
Cc: imagination@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/3] dt-bindings: gpu: img,powervr-rogue: Document R-Car V4H and V4M support
Date: Thu, 10 Sep 2026 10:19:09 +0200
Message-ID: <1c2771f8882cde0fde694b9f5aae50c02a2ae4cb.1789028076.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789028076.git.geert+renesas@glider.be>
References: <cover.1789028076.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas R-Car V4H SoC integrates an Imagination Technologies IMG
AXM-8-256 GPU, while R-Car V4M integrates an Imagination Technologies
IMG BXS-4-64 GPU.  Both variants can generate 8 interrupts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/gpu/img,powervr-rogue.yaml       | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index e9218e0f363d1848..9bea037602c137a7 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -35,6 +35,11 @@ properties:
           # work with newer dts.
           - const: img,img-axe
           - const: img,img-rogue
+      - items:
+          - enum:
+              - renesas,r8a779g0-gpu
+          - const: img,img-axm-8-256
+          - const: img,img-rogue
       - items:
           - enum:
               - thead,th1520-gpu
@@ -44,6 +49,7 @@ properties:
           - enum:
               - ti,am62p-gpu
               - ti,j721s2-gpu
+              - renesas,r8a779h0-gpu
           - const: img,img-bxs-4-64
           - const: img,img-rogue
 
@@ -70,7 +76,8 @@ properties:
     minItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    maxItems: 8
 
   power-domains:
     minItems: 1
@@ -173,6 +180,19 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - renesas,r8a779g0-gpu
+                - renesas,r8a779h0-gpu
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
-- 
2.43.0

