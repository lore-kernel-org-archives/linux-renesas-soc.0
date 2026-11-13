Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794554008;
	b=tLvjXZjgKQbp6qF77VcoLAwkfYjPq7Orr925y4wlgSTpRQ8WLlzLFhGiFuQoDcZcYn1a
	 u/aHFxVyANF5JfYFOi59sPGDD1mKe/jBcr/hljkXt2d2sdvG74fx6RyZTPjeplEDpyKHB
	 xiDuJsR8vOziE2pCfwSNVabp4lApX8/O63lu+HMZ1UWVRwqvBgl1EMsX+mKaX19AX5m/D
	 6LDpHEM+psJTn5mB+3y+/hVcVud6c8C0v0gKW06iZcuyqW65w3p0wBsktpp/PO9uqdNrc
	 XqolgNPnCkezrVRoOMR1emLuQetLv+gqf+qO8BbI167Tg87ApFrjyzsdvMHyHL2q4Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554008;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=QE22+vCD+5ZFlPxh/eG7EteY2wTaowHsKUJq2Ws2oNU=;
	b=ij/eX6mMFCQ2zSBiSgViFzFzGjcSUdtK13ESZObgbVe4NdAfyZkvIFn1rddI5mHL7VSY
	 dFuoBmdGDLk73H96xIHlOiRN01o/CwKKO5YqbhXNeZaV83vAWR1Et4th2FxfxUJQ6w06q
	 aVIFt+0i7HEY59vvvg3fJwmWzRk1x7b4n+kq77uKLYuBNBpDaqKROn1FaFwk/PxjYaNjM
	 LUPaavqPPqZPFs/abMhuVMM2Rg37PHFHpc8eTIAbB08SALDfF0VovuJ5oU+g1ZXDLP31b
	 U+PFrr9OECyKk5DWw6JG0McBEo3rSRwZLQDa/1YCq3ZE2tp2OfcQ/rQ68V83wt1f7OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25CE60A2608
	for <linux-renesas-soc@vger.kernel.org>; Fri, 13 Nov 2026 07:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25CE60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs55.andestech.com [10.0.1.155])
	by Atcsqr.andestech.com with ESMTPS id 6AD7CR5O059129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Nov 2026 15:12:29 +0800 (+08)
	(envelope-from minachou@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs55.andestech.com
 (10.0.1.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 13 Nov
 2026 15:12:29 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Nov
 2026 15:12:29 +0800
From: Mina Hui-Min Chou <minachou@andestech.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <alex@ghiti.fr>, <conor@kernel.org>, <jic23@kernel.org>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <randolph@andestech.com>, <cyyang772@andestech.com>,
        <tim609@andestech.com>, <minachou@andestech.com>, <az70021@gmail.com>
Subject: [PATCH v2 12/19] dt-bindings: cache: andestech: update schema for generic LLC support
Date: Fri, 13 Nov 2026 15:11:36 +0800
Message-ID: <20261113071143.1446167-13-minachou@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261113071143.1446167-1-minachou@andestech.com>
References: <20261113071143.1446167-1-minachou@andestech.com>
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs55.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AD7CR5O059129

The last level cache controller of Andes cores is not specific to
AX45MP. Other Andes cores, such as the A27L2, use the same controller
with the same register interface, but the binding only accepts
andestech,ax45mp-cache. Add andestech,llcache for them, and describe
the binding as an Andes last level cache rather than an AX45MP L2
cache.

The cache-level, cache-sets and cache-size constraints describe the
AX45MP L2 cache, so apply them to andestech,ax45mp-cache only. The LLC
of other Andes cores can be level 3 and have other geometries, so
allow cache-level 3 and require cache-sets only for AX45MP. Match
renesas,r9a07g043f-ax45mp-cache explicitly instead of through the else
branch, which would otherwise also apply to andestech,llcache.

Also add an example for andestech,llcache, and add myself as a
maintainer of the binding.

Signed-off-by: Mina Hui-Min Chou <minachou@andestech.com>
---
 .../cache/andestech,ax45mp-cache.yaml         | 71 ++++++++++++++-----
 1 file changed, 54 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
index b135ffa4ab6b..da9688cc95f7 100644
--- a/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
+++ b/Documentation/devicetree/bindings/cache/andestech,ax45mp-cache.yaml
@@ -5,14 +5,15 @@
 $id: http://devicetree.org/schemas/cache/andestech,ax45mp-cache.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Andestech AX45MP L2 Cache Controller
+title: Andestech Last Level Cache Controller
 
 maintainers:
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+  - Mina Hui-Min Chou <minachou@andestech.com>
 
 description:
-  A level-2 cache (L2C) is used to improve the system performance by providing
-  a large amount of cache line entries and reasonable access delays. The L2C
+  A last level cache (LLC) is used to improve the system performance by providing
+  a large amount of cache line entries and reasonable access delays. The LLC
   is shared between cores, and a non-inclusive non-exclusive policy is used.
 
 select:
@@ -21,18 +22,23 @@ select:
       contains:
         enum:
           - andestech,ax45mp-cache
+          - andestech,llcache
 
   required:
     - compatible
 
 properties:
   compatible:
-    items:
-      - enum:
-          - andestech,qilai-ax45mp-cache
-          - renesas,r9a07g043f-ax45mp-cache
-      - const: andestech,ax45mp-cache
-      - const: cache
+    oneOf:
+      - items:
+          - enum:
+              - andestech,qilai-ax45mp-cache
+              - renesas,r9a07g043f-ax45mp-cache
+          - const: andestech,ax45mp-cache
+          - const: cache
+      - items:
+          - const: andestech,llcache
+          - const: cache
 
   reg:
     maxItems: 1
@@ -44,13 +50,11 @@ properties:
     const: 64
 
   cache-level:
-    const: 2
+    enum: [2, 3]
 
-  cache-sets:
-    enum: [1024, 2048]
+  cache-sets: true
 
-  cache-size:
-    enum: [131072, 262144, 524288, 1048576, 2097152]
+  cache-size: true
 
   cache-unified: true
 
@@ -64,7 +68,6 @@ required:
   - interrupts
   - cache-line-size
   - cache-level
-  - cache-sets
   - cache-size
   - cache-unified
 
@@ -73,15 +76,36 @@ allOf:
       properties:
         compatible:
           contains:
-            const: andestech,qilai-ax45mp-cache
+            const: andestech,ax45mp-cache
+    then:
+      properties:
+        cache-level:
+          const: 2
+        cache-sets:
+          enum: [1024, 2048]
+        cache-size:
+          enum: [131072, 262144, 524288, 1048576, 2097152]
+      required:
+        - cache-sets
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: andestech,qilai-ax45mp-cache
     then:
       properties:
         cache-sets:
           const: 2048
         cache-size:
           const: 2097152
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g043f-ax45mp-cache
+    then:
       properties:
         cache-sets:
           const: 1024
@@ -101,3 +125,16 @@ examples:
         cache-size = <262144>;
         cache-unified;
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    cache-controller@e0500000 {
+        compatible = "andestech,llcache", "cache";
+        reg = <0xe0500000 0x10000>;
+        interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+        cache-line-size = <64>;
+        cache-level = <2>;
+        cache-size = <262144>;
+        cache-unified;
+    };
-- 
2.34.1

