Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A340142CAF5
	for <linux-renesas-soc@vger.kernel.org>; Tue,  7 Jul 2026 14:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783435014; cv=none; b=tr75IVR2oNjk2KC5ze7IIbem/Nwrumeir+z6/cV9aLKv7JMUHnBSn3qwipaz3d10D6Lq4OZL264Pa9xRlH5jZPIROS9CZrkr1WISHB6wDdCersDLkYJg8HnKPQItgzToBKTYiASnSFdfxNbLd63ksdQZ9JcNFSRCPmx0WnRIB2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783435014; c=relaxed/simple;
	bh=bgc4PIqSQZxUe1yo6mMLg2775bSa/NICAsyxdbxA+dM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OSJyrCcPHjoF0wSTdY4EfB/LTQLUxkQfwPsB52HJ/h1Y2mKXeXPjlhMhV+NdsrfmCdLsca3D+SIpfcUAHX5ATjASMbC+DPN1n5eWZaXWSAZd6FLFpgvPklLTcHUr+1Fr4LibrneM+YBk8YlyyiP3ro0iJSSfcb0sIwSw2UvClLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXXB3krc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXXB3krc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4629051c9d1so2197638f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 07 Jul 2026 07:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783435011; x=1784039811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cr4ORC5iEzVJ8CZQXiF8gWDp6d51C+uYuHd+oA5It4Q=;
        b=GXXB3krcq9gDJeG5ctUb0VvNIOzyzQE1LaVcSXJJU9KhVVgCUp0lemQjy/rBsusV+S
         TjT884asz/W8rTx9n4sGyFMtdtgzdt2fZrUJjX1MrG7Yu8sPUEiAvMYcIkyxh/mQZxjQ
         aTRymFUY5uaC2Di5+olinOL3XdfMl7bbaTkD0J4Qye7OivkhykI2Fix8uxzCcGd2bFCP
         8bT9FpfR92zmFQX1Iu3BRNly58VB1Qxvt/VAK1lW+1oSlYM2UU3hz6/wOwmVEEtObnXU
         Y5GRd0Uun3vlmn0ntaNhqOj9O4hBpIte7SnEePZTegcDI7Ymhc4WewnoAjJRBt5A7JBM
         bTIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783435011; x=1784039811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cr4ORC5iEzVJ8CZQXiF8gWDp6d51C+uYuHd+oA5It4Q=;
        b=sM5FAHmnVan4UY46OPzbYx0tNDJQim++BPzon2QyUaDE8iZyDnUXdHN2K+YN8wqGnp
         fUyR8IoT08tD62nDatiRH1E+wmnJs97YHW4oAmmtaKXdEgkiC2W88kHYnbmlqCC54EB3
         ACpoUFIHiqsMeQJMUmJESMIM3L7VA3sSvl8vwGSEnpFcXNsgqCeif+1zNXySgVjdTpYK
         sbZ43xsuObgGIv+knh8Rv1agUyEwHJBSUIUEIDiJ6TB8YgaJPu8T0eW7GBHPXLqH/d/n
         n/g8iqiKRHFMv7/nEmLuDe2HnjtL7Kpw+v6qfsFCn4pP4If7KGjyLOwP1RSJOAdLt+8E
         yJEg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1xGAnNLyGKz92BVsXAR/xUYKKLBqzcTVOtY+l4G8JsYyRS9jJUvxo3JrAt0Fmegs49sssBPQx+LxzqDc14u8/WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkHWns9BTfzgT40/vOYg2si00LDaVYHzBNWQzzpQVqPM9wgkIH
	Jpod/rfoZup3O3lWJGIIqqkQNamnQjZRJ1SF0OHy8+52Ko1COrHfwJeQ
X-Gm-Gg: AfdE7ckMYfi62xmAMcP05TehHlW6Em3Y2J0vXKtiiLFwt+sT3VwWgSARpKGyUvfuryP
	OIJI2BqkVTgekQPn3dDOkG5OKrbprNyivQoFZ1fScZmaqj5SeW9pXTwnanENJm+m4/pIq1NOkY5
	puNr5Bm3a0ZZqDn5hjl36PbJtxdgdOhpzA7UJBtKuf/X9skqVglXO4k3n+2QFGMEE1paLy0X1P4
	Km3jv10PYP8yK96xJFhDviXo1ePwGWer30aMfjFMq/gnsERQJMS70bz8lseDdMrhIEOPwcEi3P9
	MNq9/2XF632GeTLyHsHj2g8n2Ep9H2IwUyXsdlqK+J0BY7d9svlBzhpfmSOcN2/s3OnCl0EaT+L
	LctOqVoXwEN8fEuxPKJwFLwlTMty59rqGCr8KmHftEcxw7x+TzbxYbENXXwnCgStphyD1jpEu72
	4WbSKyCSkPG2NQlb5ax5DkL77tr7Mx3UmPtN9E8Q==
X-Received: by 2002:a5d:648a:0:b0:46f:7d90:8127 with SMTP id ffacd0b85a97d-47de66cf83dmr5043918f8f.13.1783435010951;
        Tue, 07 Jul 2026 07:36:50 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:a4ac:4e7f:194a:852e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ae44sm33228611f8f.23.2026.07.07.07.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 07:36:50 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 2/9] dt-bindings: phy: renesas,usb2-phy: Document RZ/G3L PHY bindings
Date: Tue,  7 Jul 2026 15:36:34 +0100
Message-ID: <20260707143646.245177-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
References: <20260707143646.245177-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add device tree binding support for the RZ/G3L (r9a08g046) USB2 PHY.
The RZ/G3L USB PHY is almost identical to the RZ/G3S USB PHY, the
difference being 2 OTG blocks on RZ/G3L compared to 1 on RZ/G3S.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * Collected tag.
---
 Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
index 9740e5b335f9..d6b9d08ceec6 100644
--- a/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/renesas,usb2-phy.yaml
@@ -16,6 +16,7 @@ properties:
           - enum:
               - renesas,usb2-phy-r8a77470  # RZ/G1C
               - renesas,usb2-phy-r9a08g045 # RZ/G3S
+              - renesas,usb2-phy-r9a08g046 # RZ/G3L
               - renesas,usb2-phy-r9a09g057 # RZ/V2H(P)
 
       - items:
@@ -132,6 +133,7 @@ allOf:
             enum:
               - renesas,usb2-phy-r9a09g057
               - renesas,usb2-phy-r9a08g045
+              - renesas,usb2-phy-r9a08g046
               - renesas,rzg2l-usb2-phy
     then:
       properties:
-- 
2.43.0

