Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B21947987B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 14:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787150196; cv=none; b=WFAtbboj+35x+vsHUw/a2Mrh6ZDorJr7C4pHuZVRP4Pf5xrkw7t5S/J0yqzLTxpkwSZ5jraCOYkupGu/9DX/mvHMwW3z6GNDoZujqagLZT98IPKqPOYq/6YfYAV6yAelLs4jaSZICM/W/nkQ1+gAVKDqe6sNDEYeQjXW2PVqVsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787150196; c=relaxed/simple;
	bh=X9g9f9zNnjZporS8dI4PYZqzMLpP+8jgApko9JxkNpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cixk1B1sKsLtu0PCQE3fiHGyM9ZcLzWRYUTLdKwLXVENXJlSCxDwSd4L1MHuKgUrCad2ujLRKMg1uPG2o8ltw8UOnavydMJ6o6EHX0kGBm+iSe/YDRYhwc0JUHfDAWh8yG7YmHLStzbVuNpdC+CuyqetbG5/dV4EbEmrgjYI/mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=OKebSvQV; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="OKebSvQV"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499b02fc590so174665e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Aug 2026 07:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1787150193; x=1787754993; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpc193AsLHROsaZ79+wDxlRixh2ukohZH538sICJG0I=;
        b=OKebSvQVLLrUfOCQ5S7mdsokJydN2UJV3f4XG2sllwsZ/bpIAURnjsKfsrK2WDYIZO
         mk/LC/3jq9FmrxXN6Ai+LBblZzjGsR6xKeJGrb3EJuez4RViMSyuZqPGgC3nszB8hAAa
         CaGBWKjnWhwhzDAniIsX9aygu2sziyJt6Ji5ZMvJw67eBn7WASv3ZAHQ9JEUa0rScvXY
         i4l5A2+xhwNk7XKtkb9MkdpfMndun7d6+Woqd/nGgT/1OmHvkt3QDkYKPAm2zqs30fEM
         8uO5WSpElGvzq1QkRxNdIb4g5gBU2WY92owkJqIJwDnWnHJyCIDpeFxPht3PqWH5NbqW
         2SPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787150193; x=1787754993;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpc193AsLHROsaZ79+wDxlRixh2ukohZH538sICJG0I=;
        b=XJTxAzWGt9tiRxtsmhKSvMEF9qo6Sf59iUfNyFUAuF1Oj1gRrGyPFrFmuypADj9bGe
         miZJNOozmwBhgGWaX8mun0A5ETEhvbcVq9r3T0novKb5yyiVxd8mVy0nEex0cxOxO/kR
         y5+eHidh6thxpeDcrVTlZL6tZuZkund/OjjQm8w6S765D687wMRor2XnY7FLeNMienfI
         KIua5kT+SO8CnqG4pU0dolEPUwnWuQBtIiWGnYC+rOun9CLrzL3T5AzALKCJY48OdcAF
         2Ih3QWRLTDcfHRRO57klKYKZP0s2UNyz0NYEuwC38tF1MpednaxBzwiLnqGOwio0BsYs
         NwCg==
X-Forwarded-Encrypted: i=1; AHgh+RozHtk8B2Iq1hWWyvAXRFz59OoXNV1FfCGeM/tbs1lkwd12BLckk/8bp/GulG2snExudI6twwzXdAdWFtqnIjahZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+4grOokmt/QRQ4HIady+epcFNLKRbm9oCuQB4QNttSEAE2S3V
	uoUfy6FKXAzFhKqJ94XiUffltl9mFtLmI+d5mn5hd1wSzUSJnFoiJxdjzzKIdcnt+s8=
X-Gm-Gg: AR+sD12GK85hh+RvqaaIWadEKsbrMiHKXR0FIX/5uWfO/V2lnAFOhAO/uwMnAkZWVVy
	WmD9D2MTMKvC53xQiw9Pc8Zah7VqMlk8/xzwrRUKMjSAkpdSd1AWgeXFNdjI2X5pOUQXRVTDxPx
	2BxCb1KoH0SGNkHZE7+gvt+dQEDa0cy+ABYf9CTwDp4difWjNw3tEPUVxhJvRy4qvHM/zqgx6sU
	eC9ZnPx7poUFlFlUQm6XXKWO4s4pfebW65wokBSxM2a6Yr1hVFfoVF9uvSvziNg97Qw3C6AJDHS
	oLl8/eybkB5CqmLyiJVit/VbIYXOB8sFGtU1BNK9pbUtw9tVCBBEs+S0sm08XQxP0HlmZojj8ZJ
	jeD+TrNz6ZcO+MXfvQfblSrUSYhevFTJAMhV28DzzTKW+Tu1En9oJXZXEJQvK1JSn1ylt91A7R9
	mw8Oa5FHdAmwDxdhUO3OAuzbLPpz0WKRtDRd6UAFOGKCGOsL43sAjbCtZV5MYAjPP2HWPn4hw/8
	PCNdiYdV5zwJ61OJXsNyifp+EqY60bX90RMCeghpNzW1hqNvw==
X-Received: by 2002:a05:600c:a012:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-499aa1431a5mr105639935e9.1.1787150193466;
        Wed, 19 Aug 2026 07:36:33 -0700 (PDT)
Received: from claudiu-TUXEDO-InfinityBook-Pro-AMD-Gen9.. ([2a02:2f04:6400:1700:e978:dd1f:393f:9962])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e37284sm32671235e9.4.2026.08.19.07.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:36:32 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v5 4/5] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document the missing I3C power source option
Date: Wed, 19 Aug 2026 17:35:52 +0300
Message-ID: <20260819143553.2478984-5-claudiu.beznea+renesas@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
References: <20260819143553.2478984-1-claudiu.beznea+renesas@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The I3C pins on the Renesas RZ/G3S SoC can be powered at either 1.2V or
1.8V. Document the missing 1.2V power source option.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v5:
- collected tags

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- collected tags

 .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
index fb1fe1ea759f..32864c9add4a 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
@@ -129,7 +129,7 @@ additionalProperties:
           enum: [ 33, 50, 66, 100 ]
         power-source:
           description: I/O voltage in millivolt.
-          enum: [ 1800, 2500, 3300 ]
+          enum: [ 1200, 1800, 2500, 3300 ]
         slew-rate: true
         gpio-hog: true
         gpios: true
-- 
2.43.0

