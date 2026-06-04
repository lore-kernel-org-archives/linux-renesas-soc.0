Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493713A1CFE
	for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Jun 2026 09:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780567015; cv=none; b=ScaFTYZBrkF1AcB+Y44UnaqZ6cak2+5JNonbqbeesd2GqcMlkSHAcS1MIJKk/MREZRnAb3ep5ct8o4EA34Pm+zs3TihwYeMheobjSrPlZLxPVq1Aacmn9PyFuI3Iefr/9xcNbZsahLpsILev36pM/LEVOp1EicfVM3ovBCDlmdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780567015; c=relaxed/simple;
	bh=GlK9ixHx54Su6flP5suqw3t57abQqWUB6DRE7SgXo5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DL1tb6n1KnvEcKYNSABX/MrHjdOpjkpyzbJ+AK81mXyOBd1P56qaxQi0KsLN1bPSKwrCQ7qlPmLgMT1l+xX1DgIOH6veKnGhGi90uu+6hKvj8afuOjKh13kijRZJ7/+p6VQ/7oFaduhyjcvpZ46sKSRWa7NNJRsSR6BWqa9FLq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USqgekZk; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USqgekZk"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490b8ac62baso11122355e9.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Jun 2026 02:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780567013; x=1781171813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpnqT/H77UIaNdz4UGNV31fQveT8Q7DBDQnTYavMONs=;
        b=USqgekZkAxbpGQV2ymPvT1uNwjPrBfku36ElBt/jclzS/CHcGL/dTM/2EzLQwllb1b
         LK5klRIooUYTdjT1AXH3n98y1y0NgyVP2yM/9dsrra2nmwfKV2/BGyLo+RH4R5dgh2JT
         a3vbklzKhfS6rAUbSkxDoijh3FUcHIFBuoP1b7IiDu+hJOEISUfrqmFEwZUSo6dKOG8e
         +IF/13eVJI6NzLNn9qfp/xbXlnHGyezVzfhtv6IkJE3sUW8drNexJr4Ul/q0HXVb+A3n
         JXCtPyT3LvOlQp4aq2ub+LD35Ud/crSqew7XiLwhVxpIFSo436RyrcAIFJeFBvaac36f
         oTSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780567013; x=1781171813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bpnqT/H77UIaNdz4UGNV31fQveT8Q7DBDQnTYavMONs=;
        b=IzwJV2KO1gAQvrv2iNHkflwBki1fCbcoVItT5HUgOeWUbkMSP5JEYh654ojXY4NmSe
         h4w/jqw1eVH4nWLTXeljLSJ8tu5G1dFWyU4wn7Nw3xjm8R40Bpi9BToK7R53BItbiRA1
         MyRt0bAjdECJrTDuFt48FG1jYeUdVfgzQ3XxuUsnk4mRFOzJkc27k7UdzOtP1fXsmB95
         mMhFT9MZadb1EZuRcTxXUoHYhEnctv1A0xJEVAyORNMHIaqpCvbO/m9vT71sri6xcSvx
         gzmKEYGIJNGC/R3IUSZsnJBUV7pYKaNoj7LO/YHofVWqXvxvCU6Ya7vmtVN9MyetsgvP
         LKJA==
X-Forwarded-Encrypted: i=1; AFNElJ/hW2GrI85MHFmBMJdhUx+A4FNPRz2F7kRurH0lFBpv+rLJoZYP8fwUg9lkXUjyNKQl8qVTbqVHcsAmwo6ta8OTLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYQhhgca8JEC6tuw2QrL1cuq7C1q2OnaaNw89GWAkEBDPBEx6f
	V2GfG2dQWPnA0Dt1Ok9DxIpkbDtaWToPPTnalK7M1z2DNh9516s2OYZe
X-Gm-Gg: Acq92OET6DG8SpcRDMdEdvOm7VPpXPWlvYWypDkXNKnFm8xY1QU0Cddz8vexZwagUqB
	1xLV3GqOWaamTiGttW/+T5zkZEAfR8Qq0Xx+APeC7gF5ecSBbTfU1SmVCKOrWcFr8Om39UNOQKC
	LKWdA5zDze/8iXZZSmZk3cXqETfa3NXVEuANNtDgP8W+aOSrFcuLScitn3MYeTOVAJZVYoHyyM8
	LlZJ0ISM90Ealio34KwKYCK28554Gy+jTRsGCFG8TZHjBlg/3UaaW5iAFUY3JS2MjNO8J9l6s+J
	MP9ORhJATljapu4yQbuPk4DotrcC5HturmdhcPX5IyQRB85ng1X5v9tQ4zQ1SOb8IqERo6C5Wip
	T+1RMKEeK/xeWexOGJi+nwFII0SWlYIUszsC7JkSmnnqgGAJGpL62Jz4UT+HLGizTW8314Z6g4R
	2+uTZsM0/jJXYM5Xf8glZw1RjCJz40guL3xilXwQ7+lFF0ZBOAxebNP0Fpvfw=
X-Received: by 2002:a05:600c:4453:b0:48f:e230:29f5 with SMTP id 5b1f17b1804b1-490bc50dcecmr42162245e9.16.1780567012510;
        Thu, 04 Jun 2026 02:56:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:1615:3574:e0c0:837d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490be1f69bcsm38037335e9.8.2026.06.04.02.56.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 02:56:52 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v6 02/11] dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
Date: Thu,  4 Jun 2026 10:56:32 +0100
Message-ID: <20260604095647.108654-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
References: <20260604095647.108654-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

RZ/G2L GPT IP supports output pin disable function by dead time
error and detecting short-circuits between output pins.

Add documentation for the optional property renesas,poegs to
link a pair of GPT IOs with POEG.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * No change
v5:
 * No change
v24 from [1]:
[1] https://lore.kernel.org/all/20250226144531.176819-1-biju.das.jz@bp.renesas.com/
---
 .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
index 13b807765a30..98bcde755fb9 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
@@ -245,6 +245,28 @@ properties:
   resets:
     maxItems: 1
 
+  renesas,poegs:
+    minItems: 1
+    maxItems: 8
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      items:
+        - description: phandle to POEG instance that serves the output disable
+        - enum: [ 0, 1, 2, 3, 4, 5, 6, 7 ]
+          description: |
+            An index identifying pair of GPT channels.
+              <0> : GPT channels 0 and 1
+              <1> : GPT channels 2 and 3
+              <2> : GPT channels 4 and 5
+              <3> : GPT channels 6 and 7
+              <4> : GPT channels 8 and 9
+              <5> : GPT channels 10 and 11
+              <6> : GPT channels 12 and 13
+              <7> : GPT channels 14 and 15
+    description:
+      A list of phandle and channel index pair tuples to the POEGs that handle the
+      output disable for the GPT channels.
+
 required:
   - compatible
   - reg
@@ -375,4 +397,5 @@ examples:
         power-domains = <&cpg>;
         resets = <&cpg R9A07G044_GPT_RST_C>;
         #pwm-cells = <3>;
+        renesas,poegs = <&poeggd 4>;
     };
-- 
2.43.0

