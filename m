Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047133D1CDB
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 16:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774024925; cv=none; b=Q2JmnEVQ1oULcpPZTgnBod/PsJNOGFwC+ZhGLho5PjjhiZSp4rAfhG8jKZ8nZuMT4rzMheD9RIIoD0hAGJZj8AzLFEzJ3w0j64ovjmb8L50KsIyn1zXWkNmq2KIktEFkrfEYVJ+qub7HqQoEQqS1r3x+JGQ97sUADzQ7wjYKEXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774024925; c=relaxed/simple;
	bh=fK3o9R4p5yoqkrXzCDN7J6tQOqKI0ucN7iP+Z2se9Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9mLElWgckmVCtyVzgGegxFeHL3+Gyut+yqCmUKWaQhaVsYjxCXnwanTyE+Pz3kFKt1Bwt5TUfRwsMDbHDzNGgdOfUDTUgHWcdbR6Wszj992oTMIgc48ssQiYzZUlFeHYRsxoxRinV5XLmPqfgSpMLKpHyzUOSmSxDHAfcOKKe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqxIjONF; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqxIjONF"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so1968621f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Mar 2026 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774024922; x=1774629722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wDx7nIMupZuya6kEy4r0T51ugjRAiOlO9zel+//9XXQ=;
        b=CqxIjONFPLhLUXOKV4QUVzkCz7SXMGIc6hY+iKm1ObazbejILRuC2ny2FPBG4Lo+To
         4lQFUnzBOV6rZUavqUu1SFi0iRmvbsAmEGBnZavymKVL6qGTirpe23qSQKFlqWd+bQhR
         RR/eUDHmETuMTXGR58G7wLobg3CqJPKAtTGlQsSeGLGgUh7FwGdmRKHlHJ4MAIGFuHNy
         nnKF44llAI9V2FYu2hqptccR3vTnijQMRJbVv3ihAKHiyNj4jnyRE0uiZK00RPnSB8pk
         PElcbN2RYz0kZYzESRz1h06JQStn993zQ711q+uTnKqaMkrZnw5Rs2P2bMZygjaE6m5L
         aZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774024922; x=1774629722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wDx7nIMupZuya6kEy4r0T51ugjRAiOlO9zel+//9XXQ=;
        b=AUngCAs4GZdm6sReEvc4jszC/x6MzaUvFW6bGfIKdJM9vswrUvyI73uvt2+oTqi0VF
         GGMTholNbOBvtg+5rm2Rhp4G4sJ1LlOaT/ccIJGENgmeE3AVTEtDRbpbCTN0t6E2TU5d
         a4zhigUdvBpRnPwZkZXiyFL3nfrlcNywgRd0NXYcePoih2GoxtkQ8MW+GnJxsdLN/xOi
         25m+PWfVoMFr4lJeVvxMZlNYqTjxB9Sokefxni6FFb4qrdPEJCrZ77+GAG8YTYxMJ0b7
         v+c6QzTwQ5ghm0vW3gqtV/OtARPizAVQbT6EcX1kLzODRD50PC5u9UucUn+LXfaK/Hzi
         uxLg==
X-Forwarded-Encrypted: i=1; AJvYcCVPJftXMpBrMZ1oKUnSCRoZgr7EEiWRNKzMOsXYQ2ceLnM1U/rTib7WGgrbfxuVCbTFv/8owI+14fPjMK1GPFItWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4E1meyhe1tf82Du6pwkD7t6fGlppsipjOKXSDQ7LZD+I8X/MU
	7B56cOjL7iDzGuWZnNcz+zWdffxzzHLndPb36/revchwPt9DKurTn5WL
X-Gm-Gg: ATEYQzzyQ4iHL+qftlSauloUS95Jy8sf5cX5CZ7A3YLcB4QN0LbvM6rEWPWn7enIijs
	OzZ9hWCG9hU8jS1dFk+efSAlFlqm8WdqliPo7xpyhGqapowjCYmnAIj0xHs5lp4Hgs/SSek8y9D
	CqcO9ifRJcm/o1rxrre3e4o+LVxgtAIbtI+OoDy8euodaJxIVsxG1nnIPQlG99GaCEuXc7V9psO
	n6Eb/C0St1+/Pvl6SSqc02ZkZ2yUoznIHx0M7kVBDs0bXya9Q17Xmc69J4O5Q+xUHPMVDBV5j/H
	JYuY1OVdlDCGqq5jop6I2QIH7+pfnkkdAZml6ckIOxEz8nPMucpwMOQVW79iHa2cGPXtUPNO8yq
	MFQgKHSYE/heHUw6JOZdQXBxHDJP6BwmKmFOBSlZAC07fNcoI2g9iLkY1UoBCY1f4IX7UpjKEvr
	V6hwFVViV0HQTxEfu1UOZvYxzdcLGpjUo=
X-Received: by 2002:a5d:5e88:0:b0:43b:4461:7adc with SMTP id ffacd0b85a97d-43b57729635mr15672004f8f.20.1774024922158;
        Fri, 20 Mar 2026 09:42:02 -0700 (PDT)
Received: from biju.lan ([2a00:23c4:a758:8a01:5b93:d2b1:bc5c:9231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703650sm7016575f8f.20.2026.03.20.09.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 09:42:01 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: David Airlie <airlied@gmail.com>,
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
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 1/4] dt-bindings: gpu: mali-bifrost: Add compatible for RZ/G3L SoC
Date: Fri, 20 Mar 2026 16:41:47 +0000
Message-ID: <20260320164158.487406-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
References: <20260320164158.487406-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add a compatible string for the Renesas RZ/G3L SoC variants that include a
Mali-G31 GPU. These variants share the same restrictions on interrupts,
clocks, and power domains as the RZ/G2L SoC, so extend the existing schema
validation accordingly.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Collected tag
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index db49b8ff8c74..9db9f84ad964 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -26,6 +26,7 @@ properties:
               - realtek,rtd1619-mali
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a08g046-mali
               - renesas,r9a09g047-mali
               - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
@@ -150,6 +151,7 @@ allOf:
             enum:
               - renesas,r9a07g044-mali
               - renesas,r9a07g054-mali
+              - renesas,r9a08g046-mali
               - renesas,r9a09g047-mali
               - renesas,r9a09g056-mali
               - renesas,r9a09g057-mali
-- 
2.43.0

