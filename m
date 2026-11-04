Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816479;
	b=E5Jd4nuQxOraM5SUY/WV/vXlV6CjQZmnzV35ycgxJARz/ojEyxlLVjbVHlv/IsWEEbup
	 WGnyADJh1Yk4bqdWpB+jbkSiUXyGkpn4r6H71XfkVzpeKILn5YBuuc38LfC7oEPTCLZRt
	 RLvOAFdM6HdwMEP+qzGG+IqZrMKAMNekNzj4xOdZJbOxnS29WGJ5xJC9o7S9/oDbFYZOZ
	 TsdSm4TaMPzCmzxGKr/kSo3YPo+8e6fo7//wRHi9RfWu1VJvyzGNEusHI9BdvJ6CXfDx6
	 QCfR+bKnR3SovEuNYcntPfFK1tzT8tVcmeAyV948Zcps0fjecTzsiQdQA3+vuksi1kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=xFvESBDRc03vw3r4G764xn86wJOmVghZmhz8uSPjRmw=;
	b=TR3cdU3z8pbkjud/s7hcnbIO7gI0ZUPc/MWdrFQSjIAc8H7N3f848kUr0tddN6VrE393
	 6lJpQFs+4bMyFVDazn26AXj6uz4bgj+1OmrsEt37KFXuxdyYEM1TWlT5DXX5Qig4KYjEq
	 wG4ii+xekNwSrnG1DU9TiaNtMNMn/BT4CLLdlGdlCwFwAt+HXm+Ew788pGUR49PA2e1jI
	 6pm6bRXEGNrPKbMN7uKi8d9Y9vSuzMfYPmeCinYhmMod0dPeIO7g2dWz5n1N9BQ7WoZzf
	 2Z920I2+yFig8dlGdGJMacW8sn8UBem1o0iqO11aROIWDTYIa8fgFCygDsm5XIbvQHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mc2YvxkD;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F0D606D822
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 18:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7F0D606D822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mc2YvxkD
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so9427345e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816477; x=1794421277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFvESBDRc03vw3r4G764xn86wJOmVghZmhz8uSPjRmw=;
        b=mc2YvxkDKEeg2lcrOssOXv0I+WaqYQYrqleUksf2y8thSRC/rHemThvT7wQcFheOf4
         osQJ6NhXScf07S4avWAH2B43pAlG1y0GWM41g5kRwBOvatoiSl1gOLxuPaNxXFU/eHsC
         RxwLTYH/fGt+0xvlHbcZxw6iJyGvI1KJ71nr5rGwn5wew0ztYNmDZkVrmrFawweApqdc
         qFD15KvSU6EKoKCRxvTxIWfeYFuhZLXYRj6MTY85hk29aqVH4zH2WLFyMMCE/v9Ehc+g
         xpdzZ0MZgcfZ7seqORjj266fQ1l2huUXps5oqIRJUW61KFvrTaPcnw1Vj1YzMDIRvLSg
         TulA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816477; x=1794421277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFvESBDRc03vw3r4G764xn86wJOmVghZmhz8uSPjRmw=;
        b=ma6pmq9kh+isFyS+5BnBB4WNIUgQm+hWhnxkz9Pfgy5g7hAB+qfCCjqPMdOqycLMMG
         IwbqZ27YI/9sShUjl3YYQzCM79gmiX4ty36w30IlmOFRuqvr+sxOsnlH8c1gbd+Kg8mz
         kcEALG0kq71s7YSdZxqkmk4cZwwPoUqEL5l9WW1/7Nn+VwMw0/KY5XVF8NFpEuFaaGGE
         t8Z+3Cj2O6D/wsShoYnfPkkD008pIgFXeV6H7i7K2nxi1Jx04yX4bqzricqmSm19kE4k
         CmZdfMl1n8Q+NQYPkHOvx8JASYV+dax4RLDsNxAiQFv/HlpyZZIvW28EDaXjX+xYONPZ
         lRaQ==
X-Gm-Message-State: APuU4Z9eQDTpJTb+JcLekdgXW3k2rmpsaO1V0ygxzIsy8nJ0ehX4t2j7
	bwgv0iF42sLFXzz1vYcg9WTjQ5osKe9NTF8QmrBow4NiiraUeIp8qilF
X-Gm-Gg: AYBFou0XFSiHtuvl9q1n8pqRDcuUhu+Ifj4BJCgaw5c6J0pQqqPI2T1all7iVFz34Uk
	NZV9YBQauNBfT5JpFgs2CNX2YywlApXEY//iJBO6XMDjIuIXS5wbJxVzkUEZwZ8vuSdLYDhhUSP
	PDNzHclUcr5qhNCGAZl14k5Mw/bLR5BLMgq5gzm5V0BPoNs3+bwl6IG7G700lfva5Efy4UtwmYE
	rQTcW5iWNi+PsFc6LjoPhREgFPSABkb384o2IX7WPCReDS4Ky14dSa3PhzROC9TBJA4gCsbI3HV
	3nFFvvy74N68h6xbTQuIlVELCQdMzZwWPMcfCt76v7gG7OBhB4xze0KfCx6de4gXUpE1+E+UakX
	HBIQXJV7yCdYye9uh4oDlP3rBM2xYJVqrCXRCTDe9SlrjhzITrL0jR+3oWxvG07iwxYfncm6Cos
	AY5oxo8kPPabiqkH2d/mvtkNgr6CLPqpT2DCbEs2YKo8tdZctwO83+ABiVL9WDT0xdJACzcAlAD
	6/TiE6Gwe23gxXKuq2EV/c60aHj3T4QXrR8BoxRWp8OcCiw1BDpTXf5huec3Zyj9Uh0ydEEb9yl
	+z4QxGJGDnD1X2Jj347QEsJ7y8kPmGZJmthrwaN83c+5Xa501jFnSgGYok9scExJNDwf+z6icWy
	4t2ODMzEwcvu28Xxyn2l47GpSLGAxH4zS+ZoJrg==
X-Received: by 2002:a05:6000:290d:b0:48e:75f:477d with SMTP id ffacd0b85a97d-48e6e2dba63mr36517267f8f.7.1793816477063;
        Wed, 04 Nov 2026 10:21:17 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:16 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v4 05/14] dt-bindings: net: dsa: renesas,rzn1-a5psw: Disallow ports beyond port@4
Date: Wed,  4 Nov 2026 18:20:53 +0000
Message-ID: <20261104182105.1102555-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261104182105.1102555-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Restrict the A5PSW ethernet-ports node to ports 0 through 4, matching the
hardware configuration of four external ports and one CPU/management port.

Although the schema pattern limits port nodes to port@0 through port@4,
additionalProperties: true allows other port nodes to pass validation.
Set additionalProperties to false and explicitly allow #address-cells
and #size-cells so that ports beyond port@4 are rejected.

Existing in-tree device trees describe only port@0 through port@4 and
are unaffected by this change.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
- Added reg items validation for ethernet ports

v2->v3:
- New patch
---
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml         | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index 9c477ceb170b..250c59e58439 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -63,12 +63,22 @@ properties:
 
   ethernet-ports:
     type: object
-    additionalProperties: true
+    additionalProperties: false
+
+    properties:
+      '#address-cells':
+        const: 1
+      '#size-cells':
+        const: 0
+
     patternProperties:
       "^(ethernet-)?port@[0-4]$":
         type: object
         additionalProperties: true
         properties:
+          reg:
+            items:
+              - maximum: 4
           pcs-handle:
             maxItems: 1
             description:
-- 
2.56.0

