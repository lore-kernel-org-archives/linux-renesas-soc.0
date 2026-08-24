Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB06422E24
	for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 12:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787576165; cv=none; b=TP72WspGAibcr9FdM3R5031uxpDoRF04pP0bRaERHZ6ylE1siWAYxyoCB4LCo00iuRqFiKkkIqSnH5h+pHfISAD5tW8PHCPK1LTIco/1j2q0Ux20m1mfDa+ssGBNA8nbgHPSGt7yZ9I0MddKwyQvDEtkU8AnUPtyGhzE75vSJ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787576165; c=relaxed/simple;
	bh=2S9ge3Gkux6zzeM+n6dPsFXQ7STMFa+l1y8WPqoTfCk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTn66OL04I+uWUJbge6tCmNb42/4J4TbuXp1GWm3zHdTENNjpjeafgZTpy5C6Fc10HiwHOxD3uUO4eLjN+KcYIk8hSCR6EGiTGigTi1fmBtHVA1zqt83OZQMkXhmFanUethUtwMF/AhtMGbc1xxppb0/jZf916Dze9eOWrzw/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTBDucYY; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTBDucYY"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a41191c9a9so6819816a12.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 24 Aug 2026 05:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787576160; x=1788180960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lEYpVaTK2qGZEqiKTNTTUd76osnkufYUG4ARHqvujuo=;
        b=ZTBDucYYPfcxo8Pw00+LOBPvusYW5BjXQXm8VVnM0MTIByWFp29ebAfW/cBnpALbza
         Cp1XkLDSUvmfQVez21fDXVRnEUzzPBH3W9nU0lbbldAUEgeGqJy4eALBVWP8hrqh3uY4
         kreA/zDNHFX8IlCezOo4ag0iluy4qZQT6hnfri3Gb51GRKluVIctfTnZg5EL8VgC9PNq
         9F4QZi04d/Ue9mDa9wD//PT2+hnR6C5Ez9lyuOkKtN5t+b78tRwB4VbnT+/XFxSN3tA8
         ssas1vswN9vp3I8gNlIsjZ8KfWD08mU/olNKlucf5MVtlik9Uwe+WuV3JIUMroTN2Kqk
         Aq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787576160; x=1788180960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lEYpVaTK2qGZEqiKTNTTUd76osnkufYUG4ARHqvujuo=;
        b=CEatq7/XSOdl+WFYj+z60aMufvxfDYJtxk/tSPr3EYdNb3ingGCjFV/4McDhGmB/gC
         6StRa8MlIwFaBYD0a38RDTlThai9iu0w+flTMSo4uUsZaeolxMpmJIBFtyUL8LUp3K2P
         98OiFQ3bUeQfSn7lZh5PyKOvXU9oAav9k/+s4hqeKfQb53NRCg6xNWIDuG/yi3iSCGQK
         cmhq+jCPs3h+ybzhQtlnHqicapwjFeA7yDHSEln04hYXn0C9BdQWfPn+RFj9+r1Q0R2h
         6gurpzioWEyB0EHse1P/XUjxKERz83XcMNtAP80n6xhBPwVU1QiFCFvR70zHbmsTscy/
         jF0Q==
X-Forwarded-Encrypted: i=1; AHgh+RoGwXXDEfBtx8pFQo/726xrIe/p+6XhgT+LMjYphS9HFoWb40YuhJZ5mWbebUa9qTu0CKJE+SYnNpQICeE2GxE3zA==@vger.kernel.org
X-Gm-Message-State: AFuF++n8wiePSMK4mCmNowvYSHn9MEAhgRJcbCkSNbHbWojEGVMXRw0o
	xzk4TTxZJspSw4XsFPFfVhP7SthVG7CqB+9CTkDrh5thaPo5eACStYD6
X-Gm-Gg: AR+sD11kVfMoOqkzLHeQMhRe6mX3q8hyz2DHmipK2dGmVmo8DqG6+17AZl5UI67GbTZ
	p3AytIn91LPciCxMch5dzCczzmdRNoS1pv4uf3uEKQlrNman2J4ucEH3H6ewp3w1EjL235yCiTL
	32dRi6BMmG6A3ZMRuL/zptjOxFwrovK3JTORpQCMsIw2pvpxMQgov/WpsyaD6MwCxYdn6mbpx02
	rnSOGtuaXOGV5OsHn62XHvb3SiOn9sk3ev4a+pBdC2QixPERKRu0ifGaQQNzMU5gt1Vqem7vw7j
	G98/z77DNjax7kHbOQgbJwpirid71CL3t8+7hc1xfK6sKDY41XQ6h5bwtSPRw1sIpFULnAdpNDP
	9KyqD44/ucHryQfMiZjlQcNaT9dUwB6IfcIGRZkt9XuhqyUc1Tqls3nhC6jqS9aYYXHtLsnLeEH
	tiR8+tglOGuxYH1gX2bQxMStq4X0r5DMOtpaxAoY86dAtOXVspsK55X+UFzkXdb0ppdXJTq38Qk
	PhRfTxfdn1ouA==
X-Received: by 2002:a17:907:9346:b0:c1a:5d49:f99d with SMTP id a640c23a62f3a-c246a3ab4c2mr3218865366b.7.1787576159544;
        Mon, 24 Aug 2026 05:55:59 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:dea4:599b:49a8:96f5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f9c9fsm1245403066b.39.2026.08.24.05.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:55:59 -0700 (PDT)
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
Subject: [PATCH v7 8/9] dt-bindings: pwm: rzg2l-gpt: Document renesas,poegs property
Date: Mon, 24 Aug 2026 13:55:14 +0100
Message-ID: <20260824125523.131762-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
References: <20260824125523.131762-1-biju.das.jz@bp.renesas.com>
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
v6->v7:
 * No change
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

