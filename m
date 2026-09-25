Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EF749C4D8;
	Fri, 25 Sep 2026 12:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790341002; cv=none; b=hb9mcti+U90/Bh8MeDgV8FKUZvonTX1M/Rwaw3DoTj+knaMDsL9xMk0GcULlfCOVMKDWhFF0E+Ze+x7GmyGi6kv91l+E00544292exMU37bcRrl9A0ayK9jAbkEMcMpCF8s9gbRk8sQckbuxT1KEvkuWX64bXEGyC/u41Dfep8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790341002; c=relaxed/simple;
	bh=0oSVpqrNivbsPiby4j5ajWrbY8YCnBAvEUy5Wji0wCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/eI66RV8cbE5HiTmqFCNNhFa6dbnia7cTdhOChotfIZQ9bWY8udagzBlnNoEv3iCprUdK3QU/NBvUablCPVZbIf1SWhMxGbgjhEwuf67tITpuxoWxMGIzDM2AYbTMCzPoxYmXGfUDBMFDERWiJZhW+Rq4+8PLSFJDdryXkd6Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gbwm0Y35; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gbwm0Y35"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9AF31F00899;
	Fri, 25 Sep 2026 12:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790341000;
	bh=ytr+6qt7oOg9wgHURJXPBhtcOaznPpike86Oq9ErgQo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Gbwm0Y35Mh+osTXgpwIDJiGUNvpHmilKpjp9d1pxvjjAlITf1QyV77ubQQ9H/o17S
	 jb7GiBAoOVfYATKUWbR9AK9pK3Wrzemuy9JNc4V3vFUryP8ZAoe4aqrdFxeKADNZXi
	 ZuMQJ2ZpTn5wrSBEEvMHraulNUN5xbT11R0EXoLYpqA1fkO+FCVp7VbAerUb1DkTUn
	 xpBh5AJ8EXWd5BnTA8hQOn5ARiaVqFv62/HuTtesSCRzFY51eV10k/0JPlAIzgR9aj
	 O6ShhGThXaBW4mTPvbhgsBhn7kfdRbowGB33Dk9GrGSYfjrYQ5XJZ8dg9wUMPLkvAk
	 6LiX/2PM6MSOA==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 14:56:32 +0200
Subject: [PATCH v2 1/4] dt-bindings: media: renesas,r9a09g057-ivc: Describe
 additional interrupts
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-mali-c55-renesas-dts-v2-1-69f728a474a2@kernel.org>
References: <20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org>
In-Reply-To: <20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The RZ/V2H IVC provides input frame-start and frame-stop completion
interrupts alongside its input frame-end interrupt.

Describe these optional interrupts, keeping frame end first and requiring
only that entry to preserve support for existing device trees. Extend the
example to show all three interrupts using mock interrupt numbers.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 .../devicetree/bindings/media/renesas,r9a09g057-ivc.yaml      | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
index c09cbd8c9e35..3eeb1a92c9cf 100644
--- a/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,r9a09g057-ivc.yaml
@@ -21,7 +21,11 @@ properties:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Image input frame-end interrupt
+      - description: Image input frame-start interrupt
+      - description: Frame-stop processing completion interrupt
 
   clocks:
     items:
@@ -92,7 +96,10 @@ examples:
                <&cpg 0xd3>;
       reset-names = "reg", "axi", "isp";
 
-      interrupts = <GIC_SPI 861 IRQ_TYPE_EDGE_RISING>;
+      /* Example interrupt numbers. */
+      interrupts = <GIC_SPI 103 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 104 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
 
       port {
         ivc_out: endpoint {

-- 
2.55.0

