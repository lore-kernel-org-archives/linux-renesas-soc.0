Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6179047CC64;
	Tue, 16 Jun 2026 17:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781632796; cv=none; b=IKY9Qz1ZhY2ZmqfJcEopz8FVx22lSo4qpfjPG3X+9LGgxpZ0nymPEs8cnCEuv8ufiTMXxVCTpZWnV5i/SSLrQxgic6f7k0pPPv78Iq3pFW97YHRhK+MpRAeeYQwdwl11bPY3ZzNp/B13i8Ma/BUpkUIlmvzSpRlG2Md4Vx+bKe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781632796; c=relaxed/simple;
	bh=rwt7fpLfIZOPJzT6GS5LZThdPk3JNj4NICbsz53SbDU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AZJdp7CRGgb0qEp7Dm3vEeoKMDDAR8wLBnD+zbatkQgqk8ZsByK0tPcAgm7yOBvB01cg75S8pN8Kdrg83EwB0EZ2OKskiAbCeBklAk8Ai+PxG+CezfvydVRKmhEPnbkOUCyhUx0CLwDQ/tMw5yfgpWszeshgq5T6fkkuDIPT1Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Rj7PX/5F; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=HAu0orq1; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Rj7PX/5F";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="HAu0orq1"
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 73C451D000B5;
	Tue, 16 Jun 2026 13:59:53 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Tue, 16 Jun 2026 13:59:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781632793;
	 x=1781719193; bh=cBOa7dhN12n/BNdfOTNpiMuXzZmTPcGyOfDVS6bKqbs=; b=
	Rj7PX/5FDu1EMJOp92D4dk2/LIfGwZEd7Il4XQezn19so69RvJy7GToMN7dRKB5S
	ys1y0anhy3XlIYOEdmCrJwmtuIOFsvlYIZtAAwWbjeSTlpl/FolZEyCzsAQRw3On
	FGQxlnZIIYRzj/DkGtHqHxxmfGN8WwLXtzHyTJebbpS4CBVTku7Ns47fP/Zo/M51
	i/wylAfgM/GttS6Inbdn2R2obuDESOoqC+8zU3T3JPVbS297d3GZd8AsS1bdPPor
	KD3tEB7/avtNtnHvZnVoFoXBFEvWsZiT5xrtj9taorE3ntLBVtJ7KqNOVnXllSFT
	s15cpoFOIF3iloZTpWNhxg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781632793; x=
	1781719193; bh=cBOa7dhN12n/BNdfOTNpiMuXzZmTPcGyOfDVS6bKqbs=; b=H
	Au0orq1q9tjQEgbosONzuDkr7jzCYFEFLwgWdxEI06IHI7XjkOpTJbZJd53P88rM
	GcKBbXyMV2HMhobAY4St38+9Cp6IjTHQjUxsSMZIKyCpx0dZUx6r4l1NtHpmpjHg
	R6v7UlklxAovnQ8N0hTNhzLVmiMMpU6Q7LJIrQsameSo9mE2XcX8Soce2n4N6yWx
	Lo/d47/CdWz5gMLXBRQFvpO1rdlZdG3Nt6gSFs+78HO8MQ9S1aqIMkVLjgpHTCJQ
	oLE3vIraTH6qfi39jy2g0g7lXlz1eBH18SjbVoj6Kn2Y5oMYGAGG7xvW0+CU4u22
	Ad9EIKPLJwJFpY9KvGYBQ==
X-ME-Sender: <xms:GI8xajvU19qhlTto7KKG5AKqmY97RZtz3F7Qx23OyhIpFoZE05a5ag>
    <xme:GI8xagwpeJQp7ybEFgyhNPd6T3YkemzvWvQyiaYrnejXK717ptmU5HAM2gfg3EsC8
    MVcHTTv7IO45vo9XNmdlQCsh055rQqcoxPdhztlYoinc91dQaYJkIc>
X-ME-Received: <xmr:GI8xaobkDyWafninAjU4Io-bjQvo60emCLXdsozDpJIfnfWcOTBU9oJ0OSmqgNXfJAYt8rWODvgE5pJtpp3Bnm-cdNIz>
X-ME-Proxy-Cause: dmFkZTFzMoEVwJ23/63BROQGNT0ZS7cXR47HqO+CDSdbwtxHNmnrRpTLZYdoYwpdUpZHYj
    WU0KyMLp10RzWf3fGNyDiytarS8coUyAbaVJ854ZzfbbNXzExBiFXYdhxw/Ksaoa+hrCIx
    EDRhErfzw8A2jkir0CHck11DpMFn3TyLDsxdzSFBiyYcfZQLs9s3JpvsMupXLgDfFBYWEJ
    XqylP9jwLhP7kCi9W17W5QBv+Ns3OCGUfhOM2MbeWkNc/DrXRJEyuiflezdKW4QwnpE4Mh
    HXsrrpRLWtjcij2rIfI942nASQZ65knyAakhCDAfsNu9FN4D1mwCJyvaGubQyYaFSQebop
    mTFJklVQ7lvtN6P6iyPN6eX+PhkXBhzqME+Bf9us9h3ejVsA7NuNyfIcJ+j2lPOtQ/4q6C
    Vk30FdhJRMjuzyQsQeX2RyHKEnmKfmZ0rphowooAPPhXUUN7Gf96m3XQhEHWKFbPqgnkKp
    V4cZa1ENW8sMgFMnDztYO2qBwoCGxOvM+XIRXIpDVTur/CAvDy727jy6zfyDg+2XjJXnEU
    NVJmwks6RcrY3zaV1n5z8y5Uzr2MiCscZTvOU6DrVGenhKaPvYpbEW/b+sZJFDdbHhAeX7
    MAQeI1jhZU+oiT7YQBqz7S4dYVuRNPrnr5oMl4Gx4+CLPTv9WXVCjwgVMmzA
X-ME-Proxy: <xmx:GI8xavVv4TfG2_bHiHDlOTo74e6GHcMW1tTAPp6eOSlUvC4hUwMgvw>
    <xmx:GY8xapFlUMQgJ1VlBo5625kG6xMCKcTkQyTGBgnWiW5oodubSDzY0A>
    <xmx:GY8xapBdzVMqpS-DsH3Vw8_LQ80iwsxO5T0gkfJrCMCR4Iz2zgXpBA>
    <xmx:GY8xahzp_11qoVwFxXNhvfE-4taJZnGma625citjA1NLZaGk7fzdFA>
    <xmx:GY8xajBVlhmz9Y9cGXMc69BAnykeqw0LDyS8dEobkLjC_2f7nowlAGoa>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Jun 2026 13:59:52 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 1/2] dt-bindings: gpu: img,powervr-rogue: Document GE8300 GPU in Renesas R-Car D3
Date: Tue, 16 Jun 2026 19:58:34 +0200
Message-ID: <20260616175835.2109336-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260616175835.2109336-1-niklas.soderlund+renesas@ragnatech.se>
References: <20260616175835.2109336-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Document Imagination Technologies PowerVR Rogue GE8300 BNVC 22.67.54.30
present in Renesas R-Car R8A77995 D3 SoCs.

Compared to other R-Car Gen3 SoCs the D3 only have one power domain and
it is always on. Extend the list of special cases for this to also cover
R8A77995 and update the description of it.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
* Changes since v1
- Sort img,img-ge8300 after img,img-ge7800.
- Fold special case for power domain into an existing one and update the
  description.
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index a1f54dbae3f3..b93f49f1fa0a 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -25,6 +25,11 @@ properties:
               - renesas,r8a779a0-gpu
           - const: img,img-ge7800
           - const: img,img-rogue
+      - items:
+          - enum:
+              - renesas,r8a77995-gpu
+          - const: img,img-ge8300
+          - const: img,img-rogue
       - items:
           - enum:
               - ti,am62-gpu
@@ -114,6 +119,7 @@ allOf:
           contains:
             enum:
               - img,img-ge7800
+              - img,img-ge8300
               - img,img-gx6250
               - thead,th1520-gpu
     then:
@@ -159,14 +165,14 @@ allOf:
   - if:
       properties:
         compatible:
-          contains:
-            const: thead,th1520-gpu
+          enum:
+            - renesas,r8a77995-gpu
+            - thead,th1520-gpu
     then:
       properties:
         power-domains:
           items:
-            - description: The single, unified power domain for the GPU on the
-                TH1520 SoC, integrating all internal IP power domains.
+            - description: The single, unified power domain for the GPU.
         power-domain-names: false
       required:
         - power-domains
-- 
2.54.0

