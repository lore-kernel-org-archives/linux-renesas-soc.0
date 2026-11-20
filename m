Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134361;
	b=y4i5xLA3Ciw5gE74lpVpL85vmzLXzZNV1gky7RzMXxwVP9yzsvTlrq4DlD03C4Fnvtbg
	 Jl+3ESJaBqGst2AUS5LWrDAiW9425lvb2NDIA2N/YPAC8R78CO5+niMEDFIe8cd6VWTpd
	 A2b+uXM6lZWxQk0o08SNEZ2s7h17OQYO1gySw/taYK6PeY/9MNV2ryMO/I0VuKkHCH5EU
	 icMdZhpn9F/sbkDEMB2bMIpt6BRYFkYbQk7yJxzuszfubIzZxQhfbnZMWpf749YwWufK8
	 NBGKvNo7yHjOVGKZ/uffn+/mdEqlIQa55rw6aqQtJ9ADbC1EwS/z6gNu0I0DcpKOxQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134361;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GGWXXbC2MXXklgsFeFJyGdh+7D3X93VCJjfHDj6ZHnQ=;
	b=C/9QEbSiyspBJFF4f17KCwK+M5d9bzDFP/XnU+UWtNM4AU71atKwautF41a4eRlNpivW
	 eO+NrzjQZuPO3Tpr+FX3Q3EJ2FeanCZYdM4x3ZGTfpw1eWo48f/N0cAB5+s9TPOHZcCEJ
	 cV+T6x5r4jhRQqRNX4Gb6J6GK7AJKDsCsGsO3eaI7MpsCycTAZH3N8wN+uXB5vFX67D20
	 oGTTPwdxd6vX2eHtsb3TKbMwgIVOqUTIXy3AzD+dXUAP/3R9mB2T2BKGHryuZQI8xNjfW
	 ZLtKJw/iksPxacavHpWwHBBV2o7f4Q11TjA2IpPqwiZ9ZAuSKNzD9npfXKuq9dV42oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="yes96F/A";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DCF60A2605
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07DCF60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yes96F/A
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so2083605e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134359; x=1795739159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GGWXXbC2MXXklgsFeFJyGdh+7D3X93VCJjfHDj6ZHnQ=;
        b=yes96F/AWcke++2IhWE9S1GYVPvIXwQVG6b/67QK1Dtq+GI0p979xDnhwZF7MYRYUV
         F7q/FAavAX5OEsE3akSi6OSoO4SdmRPvImkns6ZK7JPzMNEB1dQlC5DpaxOJRpwvD1sS
         w0dE6AGEYfAtR38BmhAXGRLUrDNHUMYlP2vvUGXTTbybQr0+OFkG9w0Ym6aMxdLsrcpn
         2u5vPd98/Vv4RylkQ5SrtWhMLkeWxSPadMS/W6Y10MMCkDCACELP6h78N0gRvO7v8J61
         PfLMW3z/fv5y+pH/0AG36zPyG/bQXD854lXzXEksKn0NEg8DcbVEyBtjec+MKW4KYR4V
         67xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134359; x=1795739159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GGWXXbC2MXXklgsFeFJyGdh+7D3X93VCJjfHDj6ZHnQ=;
        b=Qg2H194nf8U+0x2dxoVfGSywzke/NOfc09tOFy23odO17Zcsn4MqanmFBAkQcjcX/z
         oqxjT6xIzKMNIEWpuw+14rQ4ytf8ZwrlgUHsa5TcKcQhN4vvAzFG8gCmfzXE5h1zAXVD
         nojKqONV8D0RY0JyfmO4Ri2FwlgKXa+jgVW7nIxOo9bdEvle8qRhcRpBwIPeE3xWKcbi
         5GL68eT5bHGmRMs85QJVs0Ev5N0ENeT1dA2qjngkjogMGl2R7aEHnDdZzle05PRtZhU1
         YG8XkQ9/kbz8Jukmxx0ZJymYN0usx6UdiDaYPX2n50XGJPaMjSMkpVlW9A78fyVFXpjY
         DCZw==
X-Forwarded-Encrypted: i=1; AL+hErFlRa95b4Kj5aPqbo/MmiCZHkg+M4DBn34NHxd8GP5WgGRhSeZopxI+Jxw9gpnYPRAVeCR/QIC7In3VzvjrERlVJA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/w9HD0GjzpNSenz4L8Flx1zJGWmsthIZNa8L2jR7sl5JxK3h7t
	Br9eqW2YEOhzy8192J/drs0G670cxBOjDg0NzoI01qrK7yvQwNINn0GH
X-Gm-Gg: AYBFou2rlTiqDa1Buj4e1Tzx+Wc19ak5QGFbez70Lb8bfNFCst77QfdssOmV4xXqJkw
	uMoOBHxELSPH5qds+ny3cE+EDcXICnbr09iPJesEKpke/EbPuqXt/yEzvpRS39j+8TO65OtCGM+
	qGGJGlBDoyRXfSWQ9A0exUdl/0DL0Vtl6GH1D4/d1UgdERPYVTqSavmmt4OtsZjBv99yzDXlYuq
	RVs62kxSxQaUu9+JpZYI/+fkAW3DOsD8CVoDa6BRaKGKGFSkPZKJg2kzrTRWMl2GFoCABw/Z1jJ
	/pQ9BcdBlNmWAZofHnhS86Nlm0hCCsvRMfhm8zAm6loLwwzZnUh1trUheMqYvI/46jRkcgYjk0P
	HfMuBOnHtGVy753WXKO+qLxiu8lRo8H7X1fRal9jmkhPthO9NU4H7vVq92nLpFpqSjKVDY40asU
	TZ42WLCZuZJRuUj+cntgqjQVpJQQXq0j/Yz13IYJSL8Jku614kRqhgNmTvgXTUOgO8ibabg2r/B
	sgB8+NvtNNDypiTCVxw+Z6sARgPQjjbmZ4tBRzrjPLGscsvHiYkJkFzg3341eoAF6E8v1t3is6I
	74w58i79dzQiDSD+dsIIqCCJe51xzctZjGkJCUJY6vuNQTdme/M9Ooix/dbyW05WODW2BjwU5Bs
	Sze2GC/74Zpkwtgdg1BjQ8dTiw84Y492PC/N6zEoT7dOrh1hHJXaIUdtQ2bd+AqaSU5EWoUtV
X-Received: by 2002:a05:600c:a085:b0:4bb:7bee:5496 with SMTP id 5b1f17b1804b1-4bb8880f04dmr31085375e9.13.1795134359239;
        Thu, 19 Nov 2026 16:25:59 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:58 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 05/24] dt-bindings: net: dsa: renesas,rzn1-a5psw: Reject the "ports" node
Date: Fri, 20 Nov 2026 00:25:15 +0000
Message-ID: <20261120002549.1908299-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

dsa.yaml accepts either a "ports" or an "ethernet-ports" property. A
devicetree using "ports" therefore passes validation.

Replace the top-level unevaluatedProperties with additionalProperties
to reject the unsupported "ports". Also explicitly declare dsa,member
to keep existing devicetrees validating.

Also Add ethernet-ports to the required list.

Existing in-tree device trees use ethernet-ports, so they are unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4->v5:
- Added RB tag

v3->v4:
- New patch
---
 .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml      | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index fab6aa6237e9..9c477ceb170b 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -45,6 +45,8 @@ properties:
   power-domains:
     maxItems: 1
 
+  dsa,member: true
+
   mdio:
     $ref: /schemas/net/mdio.yaml#
     unevaluatedProperties: false
@@ -73,7 +75,7 @@ properties:
               phandle pointing to a PCS sub-node compatible with
               renesas,rzn1-miic.yaml#
 
-unevaluatedProperties: false
+additionalProperties: false
 
 required:
   - compatible
@@ -81,6 +83,7 @@ required:
   - clocks
   - clock-names
   - power-domains
+  - ethernet-ports
 
 examples:
   - |
-- 
2.56.1

