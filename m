Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714DF39A7F0
	for <linux-renesas-soc@vger.kernel.org>; Sat,  4 Jul 2026 09:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783157678; cv=none; b=a0aToBwiVIISyx2w7z2RUzR0KxeILbEE6pkdHX1whaEY6c2lyEjSFkJdM/0ywY6z74p8rngn3WzMiSDYFWBM0sgjxXxSxI4YdxyUuIc7l6M5s/UmDZU8sOfB6+4gC/d/c8fREydeDWpBX3fxy+W54jLlnF7nCPmY3mQGTPFfXBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783157678; c=relaxed/simple;
	bh=9CkOkak3NtkBlSf4MxiSsL+TiDBp8RZoVM1VYImOVkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jk1RhF7/MB8PQJtbxgMlfGYb2yFxW5lRdMoZjHZT/ito44bijQ29BPnlRGXzuI1/VqZUumvLEVUGEc4Wjkn1nLzCbK63UjPz9xAaeZPaT93jTlDLZKRxDh+BPDd79DN6iOsuHiDvipB6pDNOlTq7rexbfBVemydliayZsN1ZYAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7HHe5Uk; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7HHe5Uk"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso12554345e9.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 04 Jul 2026 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783157676; x=1783762476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXSXtsaOb98EsKaQXza0t57The+nbXRGOe9BEUF2+xM=;
        b=C7HHe5Uk/L8vTpiOIlHVfqF4vAprVf3dmUqbxhipKCZLxbcwPGah6DoLNfBQVefjC3
         9jH95OdnqO8oVnQb4zePfypK87DZ9B8zHzt46t+ZUxVvSHMtVd+lF0vIm3Rt+6LWimBQ
         SHubVaYgUIpla85LznfdZoYOy02LhYxNpkDE9A5yvY9jgbqxK+Qm1douVvVXwQ8270RT
         5ox9WHfOkyYcngd5eyQeaUvJYczka46gRAcoLFaQURL0PVBxUe6jBZx1pck3JBCCFpvH
         cy+BrSGChS2ugWPHdvYYs95BVsr8d5mouQxu+MiZ8dNH5fF92EmmH7bFGYHX6JA/EYKj
         0xlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783157676; x=1783762476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lXSXtsaOb98EsKaQXza0t57The+nbXRGOe9BEUF2+xM=;
        b=GdcGtvMDXpu7tgcedHx6RkUeimkVVCOXlq0B/YpfuC2g7qKE/YxBegE2K8/amaondl
         1DS54rNT9q1fZzt9UocFzwFJ4BqDHJsssvyDsLEDHJi70ux1UpQDAxBVVqRKrEhFOJ8A
         6SeYBjr0Pou3Zg6TAQGmuiTLlQmNBbTg9P7rVLChVfrogHGQLxQZWX9XOoNiv7p1Gl4K
         ++VMoGlSowk1NJagjqOAXItFb72DQZMG2iBjSkPQ2YkXEENu8oAiIhQRAMG1OEtHNqFS
         y8WsgBsyyfztgymn+X1Pl1QPQ1RMRVWuAL8xVHMVfG7YhxbBAGkNov8/N3A6EIOE011p
         kwBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8cuwCkslA0GGrXeeW5FkOG9HyqeF/b4QLt+mjZQrekEEkwYta1Vgfj4V+9706dg+UtgFCyZ770AbRKOsm4P64f0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJCalhuVLmh1mxka1nbjhLoxdO9w0GuG6zIkP4vZADryGNxA2
	+eg7gSTUXA6jt0rn0PBptIqwB6oYi5Lj91hrtW5QLnlSBZh2a3Tg9fwX
X-Gm-Gg: AfdE7ckakYO4/6n+d7A6EHxt1R7QM9LsqMhZG8q7xkJDmnmdooG73NdbVtuFIkDlNZa
	9ZIwf+pXifhQG5pzK7Wes/iqOT8MLyRqAkIS1LLRQLKe5Qb7U+DnArvGtiU7jDAwmuWeQjqDRMO
	P9RH9V7F2q5Y1DMOif28nNtLcWZ+6k5cL7fjNGfzmrvPSXI2DGm9UK5gaa3ASe9IanGqsSmvfeA
	SksYJeC4X7AIRhXFBv5qz8o3QQz4zL82GvvjNtiYF3g9pemxSU+lipmNiWBdYjImRAJ3S9usUdW
	U2Br1SC7q0kXVgQCWrONPvy4gcOKYCTRec5KHclyO/N9skgQzcSXOAoFpRY3t5GK7PdLq21aUpp
	VZbQAvbfpFI6L8mUM3ND9wIQmkYwT4ja1jJF0gD5UXmUQbMVD9AthVIO+uen/3lFx777XaiErSb
	OG8cfxvHK/kEYXLBAJ2hHx
X-Received: by 2002:a05:600c:d7:b0:492:437a:a653 with SMTP id 5b1f17b1804b1-493d11f7b3cmr19319105e9.26.1783157675922;
        Sat, 04 Jul 2026 02:34:35 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a702:d301:8c5b:5b11:f6a5:9bc9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce040b4sm153180235e9.10.2026.07.04.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 02:34:35 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH 01/16] dt-bindings: display: bridge: renesas,dsi: Document RZ/G3L
Date: Sat,  4 Jul 2026 10:34:11 +0100
Message-ID: <20260704093433.273672-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
References: <20260704093433.273672-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L DSI IP is similar to the RZ/G2L but has different global PHY
timings and also the PLLCLK is ungateble clock. Add the compatible
string "renesas,r9a08g046-mipi-dsi" to handle these difference for the
Renesas RZ/G3L SoC. The power to DSI region is controlled by SYSC block.
Document renesas,sysc-pwrrdy property to handle the power control.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/display/bridge/renesas,dsi.yaml      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index c20625b8425e..b114ac3b111a 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -28,6 +28,7 @@ properties:
           - const: renesas,r9a09g057-mipi-dsi
 
       - enum:
+          - renesas,r9a08g046-mipi-dsi # RZ/G3L
           - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
@@ -108,6 +109,20 @@ properties:
   power-domains:
     maxItems: 1
 
+  renesas,sysc-pwrrdy:
+    description:
+      The system controller PWRRDY indicates to the DSI region, if the power
+      supply is ready. PWRRDY needs to be set during power-on before applying
+      any other settings. It also needs to be set before powering off the DSI.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description:
+              System controller phandle required by DSI driver to set
+              PWRRDY
+          - description: Register offset associated with PWRRDY
+          - description: Register bitmask associated with PWRRDY
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
-- 
2.43.0

