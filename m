Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE284DE711
	for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411355; cv=none; b=dGjkdlR1K0gBBnSCKCuk3QsYhiKj3kHfgdDEWFjk0WgytvLrsfSl7A2+SccGg3YddUxIW1SCXc5sgp01N1vQ9SzPhoMIGXIo3k857gUPcWUewbCRHRH1MhjClwoq3PSA13JbsNo+0rsz5VOsK1Tkw2waO2D1bj0MwQq5QTDFrMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411355; c=relaxed/simple;
	bh=iFbP10Bp7LS5kIOdZls1wMf5WlKbBBYkoW7MqibMJmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OEszGTqEdk35piD9XkZsEECataFOt66c8+FwANFnoSCKBP79wOQ+5yuHfxRTFsdHyMKKLgnuJVAI10pGj/SY7Ms4qa+GyAeknZrKP3Bc3VRkNXxGKBCCPGZamPskDrzTeg/o1bJfSKgP/57WxiV4NypEQ+XeODmu9GlymBlPWiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A9S0o0gC; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A9S0o0gC"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df54150dfso1526639f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Oct 2026 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792411352; x=1793016152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=idHkNMOyIew8kYXkBA045+ZWcFautzFXNk3fld2wd2Y=;
        b=A9S0o0gCzurFOPL/XTj17XLU2z2dvCtxQHcptAc+Az3px/cl3/HfXYpoZksA0L4KN3
         mZPXg2O4CQil1D4eI4867EE5tix3c8q8cfg0FJOF1OrI1zpUY576g4JNaPiQy3r2iE55
         irVS+YGJ1JhpCXlgAOV9rsROJUILk05TaUsUA0eW038R7Hu9qsopxCTI/03YJoh8KTZw
         79FNC130nwh6DWcqsej2cEVQPj6GSStBFSTozbG2baZ2joVkoHVYjK2gngvHLhRRIUsH
         iQJuU++PAPvjVeqjKCBFmq5lpQi6wYKHf9t0dPm8qoRk1ZAKwroQA5HhXc3YqZlpur8t
         KXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411352; x=1793016152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=idHkNMOyIew8kYXkBA045+ZWcFautzFXNk3fld2wd2Y=;
        b=CEjf+xJelXgOaOvrorsuyk4Xvoisd5cr1uIgGiFCApRA1VzEOAFNpwxyb8BF5Tr86G
         4nXxbpRY+vZf0q308K9RcufniSnikNhN/Iw3aEp7jWSEvK54/M4PAoaWwQ2R2r65DrLD
         Vh9R6tnXsOpybxqrQWrJj5pY3Ml1ntFVXEwShz+FT7BBp4SpUXANgbCDFjEQKQX/BN3l
         a8ydQnps7W2+17m4KuJAdvVg9dT0n+2aaFLr6MsH5tqbCPmrUSgt6roVoqJ5YenKF02+
         UWGGKGoE3Bz52t0QXYlsN2rkayIZOwIY0NeZfS+TZ6z/UOV8qUn+VTjtorw3pGNAeDNd
         KJNA==
X-Forwarded-Encrypted: i=1; AKwUvBwnT1IYywDL5CgqJC4UvbMHQBGxhuIzsSigBm8X9Y+EjGfMVmSoa+E3998aioVQQWXPrS+dlcY2qNCIXYnPaafLaw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJWRzgevG73xroLLKkQHi6FOEO3Hqt8JUFunO2b30D96Osf4N7e
	Nqu4yKnuAQe8x7VKeAakLqXIE9ynJjnJYhamEJ1v6Eljw6XkMsSEdEa8
X-Gm-Gg: AYBFou325TbL2Cp6APh1vQthnd6UX+o2XyCAccAYBR+wORReiwXto0mLeTN3/PK6bzl
	Mmzjmr0+hoZAz1LNUdHOUNyWeJdp0dt25w+8OQllXnPSnyxF7LSKiLueEIwayGK+j493rJ+cxL9
	z6rGGxPfoPYM7f1lEMI+cAII4tnl65vlM52l0F0ZFKH2gRASFV+xhqWp/gwz5iXgl7Zg0ndZQbM
	64Wl75QXhvzyjnYhdHtCCx9jZze5/6dlhzujHHAw0gtfuwe+R85DxFgNHmLXorqNjvys93Zoh9c
	W8qACZcL27tiRIyY8tGrxtpDUYC6KSQKZR67VzpqIDVEQndmTkRtqteZw9rXRLVAmVfL2PNU/+1
	6d5btL9DKlaz4Z2p55P2AInmk0zzeuyOYcfiG9tkKmkTRYx2L23I5N6kG79CFdvBwSQPfPqTvx3
	Y4BBh/UAQRPfbmCF7pdWImyxVPxD/q86xdRxtpqlPIqL4GZi5tb5vSE1MbEsPOoirpkMJDcTdNW
	Oib5UXKrebd2CjPbb+Cr29R+wTG1bSeR2fcAOTQO9VEuORWeWC1yfA=
X-Received: by 2002:a05:6000:27db:10b0:48e:82f:48f7 with SMTP id ffacd0b85a97d-48e082f4e2dmr9581056f8f.10.1792411352292;
        Mon, 19 Oct 2026 05:02:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:1439:c865:be43:6676])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdc4eecasm22400720f8f.13.2026.10.19.05.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 05:02:31 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-can@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 3/4] dt-bindings: can: renesas,rcar-canfd: Document RZ/G3L SoC
Date: Mon, 19 Oct 2026 13:02:15 +0100
Message-ID: <20261019120220.166163-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019120220.166163-1-biju.das.jz@bp.renesas.com>
References: <20261019120220.166163-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Document the RZ/G3L (R9A08G046) SoC support.

RZ/G3L has 11 interrupts and 3 CANFD channels compared to 8 interrupts
and 2 CANFD channels on RZ/G3S. RZ/G3L has 288 buffers in total
compared to 192 buffers in RZ/G3S.

Like RZ/G3S, RZ/G3L supports only CAN-FD mode, so renesas,no-can-fd is
disallowed for it, and the description of that property is updated to
exclude RZ/G3L.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Dropped the tags as there are new changes.
 * Updated the description for renesas,no-can-fd to document RZ/G3L has no
   Classical CAN mode.
 * Restored maxItems on interrupts and interrupt-names.
 * Added resets/reset-names required property for RZ/G3L.
v3->v4:
 * Dropped maxItems from interrupts,interrupt-names and resets.
 * Collected tag.
v2->v3:
 * Collected tag.
v1->v2:
 * Updated commit description
 * Dropped RZ/G3S fallback as there are lot of differences.
---
 .../bindings/net/can/renesas,rcar-canfd.yaml  | 32 +++++++++++++++++--
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
index 7d3330f8fc1a..22980ee1e898 100644
--- a/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
+++ b/Documentation/devicetree/bindings/net/can/renesas,rcar-canfd.yaml
@@ -14,6 +14,7 @@ properties:
     oneOf:
       - enum:
           - renesas,r9a08g045-canfd        # RZ/G3S
+          - renesas,r9a08g046-canfd        # RZ/G3L
           - renesas,r9a09g047-canfd        # RZ/G3E
           - renesas,r9a09g077-canfd        # RZ/T2H
 
@@ -146,8 +147,9 @@ properties:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
       The controller can operate in either CAN-FD mode (default) or FD-Only
-      mode (RZ/{G2L,G3E} and R-Car Gen4) or Classical CAN mode(except RZ/G3S}.
-      Specify this property to put the controller in Classical CAN mode.
+      mode (RZ/{G2L,G3E} and R-Car Gen4) or Classical CAN mode(except RZ/G3L
+      and RZ/G3S). Specify this property to put the controller in Classical CAN
+      mode.
 
   renesas,fd-only:
     $ref: /schemas/types.yaml#/definitions/flag
@@ -294,6 +296,27 @@ allOf:
       patternProperties:
         "^channel[6-7]$": false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g046-canfd
+    then:
+      properties:
+        interrupts:
+          minItems: 11
+          maxItems: 11
+
+        interrupt-names:
+          minItems: 11
+          maxItems: 11
+
+        resets:
+          minItems: 2
+
+      patternProperties:
+        "^channel[3-7]$": false
+
   - if:
       properties:
         compatible:
@@ -334,6 +357,7 @@ allOf:
           contains:
             enum:
               - renesas,r9a08g045-canfd
+              - renesas,r9a08g046-canfd
               - renesas,r9a09g047-canfd
               - renesas,rzg2l-canfd
     then:
@@ -358,7 +382,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a08g045-canfd
+            enum:
+              - renesas,r9a08g045-canfd
+              - renesas,r9a08g046-canfd
     then:
       properties:
         renesas,no-can-fd: false
-- 
2.43.0

