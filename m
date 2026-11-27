Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795803322;
	b=wVgMBKLCczDSlwU/NkQPh7/GzmJHB0I7rmO1Yh1imrmhINSEAhKHiKE8c0WA+nm0JRud
	 7X/fynT6einDVk99hKhIa/jLjl6i7TDFC33Ha5W3/Fj8HVLHK3AyV3uEbRZPMoCz5sIhA
	 nALUZaQaA66nLAR5yY+XXiUVkgQB+k61jHX4UQpWx5gVAl9InEwnouXchj0GR37M6qj2E
	 Mqx3nrxl6at6noJvZhA3fcWr6l9jAOqgVKJrcJ8A0cPqZsXv+p1hSCNe7q0HULbJ0g4cx
	 WzAGDtZYSjBnUTDRkZxy3hLBJMkoeAmtou2GnGZpxdDEJ8oHZeWasyX9j+AWSdZO+8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803322;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=W6ra3HxnsSrE16LG5PH4BW4qjM2tzXXpcxkdlQ/bPd4=;
	b=vQX/ppJsJ85H0JS7YCj7mjPpHZbSxizlA2Ca0rSuxDzST6UDEo1lihWLJGzIFmS5wrQc
	 q9bsPz6HWy9dWFq3k3sUyBf/eWRcAYXVaFqHlV1lQBx0hJdp57dn/VOy9Iw5kccRNLNlq
	 +kV9iFSm48OR/IWRRHKklU+plpJiRB6hu5xIt3R/xv7fItKo3Ptu+vrgMZ+3rOxsR/Twn
	 oSPBxxFClNrNvKFzQSP61BX3p5Rq7HHXrwOSJizLAMIyGRRtgmjt5Ww3kp1VjtLv4foHN
	 mMll/Qmnh5eMbXIpkhuHzrJypjSAN2Hy5AomC87PF1YXOSK1hc7UXdunrYSflNNUazA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CBUGau81;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11715606A31E;
	Fri, 27 Nov 2026 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CBUGau81
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795803321;
	b=v9/TmFcjDbf91tdeU359uTEpYywToK795HSptQqxYfQmk/i9eQYtuICEgifugtyMlORv
	 taPSKXDNSXPDXTfpCMwE4v0hjIALGgqW+eU3tGlyNapsiHjBlHbaSMjd4+aOF+o4s6gwk
	 +oHLUNNL+gzXGXq0fmJrSFz54c7DBmvlN34QwRpHPJ3wn0zS8bcFkLw+bKtgqOObsWykU
	 d+xMwbuqnxGcrc/0wtX+2YDJMx9hvNR0G+uWY64tbfM9kLS2WJYr0GmNEuIacsnS1CgFa
	 e/Seff3Ij2rEqoKLQaw5S5Znob2jWOSl6nKqqcF3woYaQuI0M2qVXf4TRvOZkuWYnKg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795803321;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=W6ra3HxnsSrE16LG5PH4BW4qjM2tzXXpcxkdlQ/bPd4=;
	b=NClEwHQw3HOpJtD4oMZ7KvuT1G5/yev3xzQGw1x0csKr+eoc51Dpf2ZUnVYqudvMx5xM
	 bdPekXCnV4VTO6sFdk80EpcuTPkWrs/tNjThifa+qpH2JSy4wqOjSJ4Z/o1ghndwkGDDT
	 vpnM3IeNeuX6EiNaM9y/cCnsAZAexmkq1WMqxqW7F4nlk0WPbTXVg2Eluxsqk/7yrMnFs
	 5NFJ1gIq++/8X1gw9qWKGzY9PNudxUTNmR5Fo1uCb5PWtUCHEEFtiDmf7HhVLXKZUvor7
	 8iJ45jEu8fpEjMbjmBKs5ml+3cG7sJqzUT5dsIj4zNLK9+ZrD70IYsV7AvmUnZL496A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F93E1F00898;
	Fri, 27 Nov 2026 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803321;
	bh=W6ra3HxnsSrE16LG5PH4BW4qjM2tzXXpcxkdlQ/bPd4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CBUGau81TWxMmZUT/203+unOO9XcFUWiCYIa4rwpN81Et9a/aTArNGSTOLsbXYpXk
	 NBEg8tmBNAd57D6TthtTWYtUlpulbXKa4coNlV8GuOhss4Hm0uqPgfpovSfmt4blsd
	 jKIoPpXGNAk/ZKD9juAyb6Xe79SrUWBHK+sz6qW28WahMwi6vPS8RT/KXLsb6su+TV
	 IX6QKzR6+36IEhqDVnQAUm4utCtQ0uMBh8I3M0SUVRKnk1mDJv8i6Es5pBLP+2h0uy
	 pas+uYBxmTW96+GldU3I5ntgsQ8+urzb9NFOjW87KXz5KwSJPGJqnbp/R1Fa29WcYg
	 Eizj2tzepMJ4g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F05B94DCEB;
	Fri, 27 Nov 2026 18:15:12 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Fri, 27 Nov 2026 10:14:25 -0800
Subject: [PATCH net-next 1/3] dt-bindings: net: pcs: renesas,rzn1-miic:
 Document rzn1 resets
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-miic-reset-consumer-v1-1-3cab78b94e23@reliablecontrols.com>
References: <20261127-miic-reset-consumer-v1-0-3cab78b94e23@reliablecontrols.com>
In-Reply-To: <20261127-miic-reset-consumer-v1-0-3cab78b94e23@reliablecontrols.com>
To: =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <clement.leger@linux.dev>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>
Cc: linux-renesas-soc@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, Kyle Hendry <khendry@reliablecontrols.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795803312; l=2601;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=Ibwr9Byd7qZ2f5BKwWGgbhsxQYwHLNF4ceUXnYnnfDo=;
 b=yHlYztCF4RgXSb5SjpfwAO+1qVE3+hH6i1NxfDR86V8tK8v6w5SHRhjWYoNutBMn37o3oqb/T
 IivGNQJR3n9AAXvu1TfN9pDumxrsh3mnHondCJFjXi4uIXYVW6/BgV0
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

On the rzn1, there are two resets for the miic. Add documentation for them.

Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
 .../bindings/net/pcs/renesas,rzn1-miic.yaml        | 36 +++++++++++++++-------
 1 file changed, 25 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
index f9d39114e667..5ad1f993e8bd 100644
--- a/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
+++ b/Documentation/devicetree/bindings/net/pcs/renesas,rzn1-miic.yaml
@@ -51,14 +51,12 @@ properties:
       - const: hclk
 
   resets:
-    items:
-      - description: Converter register reset
-      - description: Converter reset
+    minItems: 2
+    maxItems: 2
 
   reset-names:
-    items:
-      - const: rst
-      - const: crst
+    minItems: 2
+    maxItems: 2
 
   renesas,miic-switch-portin:
     description: MII Switch PORTIN configuration. This value should use one of
@@ -109,8 +107,14 @@ allOf:
       properties:
         renesas,miic-switch-portin:
           enum: [1, 2]
-        resets: false
-        reset-names: false
+        resets:
+          items:
+            - description: Timestamp selector reset
+            - description: Converter reset
+        reset-names:
+          items:
+            - const: rst_ts
+            - const: rst_miic
       patternProperties:
         "^mii-conv@[0-5]$":
           properties:
@@ -161,9 +165,14 @@ allOf:
       properties:
         renesas,miic-switch-portin:
           const: 0
-      required:
-        - resets
-        - reset-names
+      resets:
+        items:
+          - description: Converter register reset
+          - description: Converter reset
+      reset-names:
+        items:
+          - const: rst
+          - const: crst
       patternProperties:
         "^mii-conv@[0-5]$":
           properties:
@@ -210,6 +219,8 @@ required:
   - reg
   - clocks
   - clock-names
+  - resets
+  - reset-names
   - power-domains
 
 additionalProperties: false
@@ -229,6 +240,9 @@ examples:
               <&sysctrl R9A06G032_CLK_RMII_REF>,
               <&sysctrl R9A06G032_HCLK_SWITCH_RG>;
       clock-names = "mii_ref", "rgmii_ref", "rmii_ref", "hclk";
+      resets = <&sysctrl R9A06G032_RST_TS>,
+               <&sysctrl R9A06G032_RST_MIIC>;
+      reset-names = "rst_ts", "rst_miic";
       renesas,miic-switch-portin = <MIIC_GMAC2_PORT>;
       power-domains = <&sysctrl>;
 

-- 
2.53.0


