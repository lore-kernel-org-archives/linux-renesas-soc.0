Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134363;
	b=B3hDA3gUddUi17sRfHcXsfszUTFl3FM8K0hGyHHtU0soaybWDeoOMsyY/iED5MDFyM3J
	 LoJ7OZgePtN2nOIBGTTooFUPsi/8tgVB3QdVf/3+kdZVBLXOF3dUN2R0k826j3lSPQCBY
	 wp4x1oMNqV/w7h5u7+AfYAFVv7yfa2UAeameeHkEUq0fBDVA/2xxmy1WhC80iGu+BLcyU
	 3ZOBZEuPm5CzepOwN49TZaGPOe29uIXt2wnPZefbOHYnV9GfCpP96ObWpmYWzExGG2ke8
	 tzn4+33ltIQzT2wrfINr4p++Wh6L9awucJTnu1MTEA55USNVmylYPC/U6Jc5yIPO07g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=38mkUJp2ZF3+5o9oePZ/JYajnMnmk84M+xZPI8KqhQg=;
	b=wJcVa1MJoVaBcPc1fTE043W5iXDKeB0YdZCj+jvEwooYt0ukefES7+xjh38yJuceQjeH
	 v54rTMafq/z6Bi0VuH6bM2NtGw2pOvfFmxnuc5n6SiyeIiH5WNf5noi/8JfR0kQteBrUW
	 b6S5nWiVsJ3TMFCHAUQNm4lqBnVTX4QT1ydUH3hV2GhSnG5IKaz3NXqmgDpUuk6KLXw3g
	 UN8+sJfeKZf2EWECBRXRP7Ncexvqg8outOvcFb4XfUB8ise8A5AeCi8hmiXePZ3/tkABO
	 RxJuwMRzjLtVTKFdUU4K94swu3PqZapswNFE7PaVcpbYUX60uc7rhRAy8qbE586XuVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HhLIC0Ks;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF747606A331
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF747606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HhLIC0Ks
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-49d64a88222so984153f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134361; x=1795739161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=38mkUJp2ZF3+5o9oePZ/JYajnMnmk84M+xZPI8KqhQg=;
        b=HhLIC0KsGgt0LEWcR5XuMA9Tl1gPM+5HBXY3dGeCM8bivITyBijOVBo+zzhoCqkh7C
         7mPs2j9sxSFYS3qszG5vD5fz69PpDpe/aF528zANi4bbQTgSwnxd0aTrgDiAbzoYXp62
         tRw5u5Vg2RqU4m4o+46zGhJGkXX/zDUXB1j1Is5nN/KfLas0kIs3FJF0PKJpPVx7TY9Y
         2IuPwOquedzU4+M3FrHASrGReZ51mRmJoblmuFRv5RtxQYdrJ1ZlayyhggJvQUkVhAkW
         dXl672Jk+kquah+rxm/7odgAvXqJtkHBmFiUynlYXirgwp7jDkpLCf+IwgA01z3zLnXl
         9/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134361; x=1795739161;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38mkUJp2ZF3+5o9oePZ/JYajnMnmk84M+xZPI8KqhQg=;
        b=xEaiIue8xvDe4BWMVIyej4XfxMsseGAko9xQI4teOxe2CAvtyBqprPPw4fDBw5G4pa
         cXi/frNuPe9I5CCHrIpyWzl4E3jHZnVLQHbyfgu4i3bXz0jH61dJDuSWMXV2zR5qn70W
         g9znplnYNMTbP9CzBo8BPbMEByhvMUkJYeZ8HHjFCPShfk8t0R8zurcGPxAZa1scjC0g
         rYjh1F8Dj6lWg17BFjHyUFAjyndHXQzY1D6FETZCWeeo2WiKOi+BwDvvBsDHVS/oXu2h
         l2OPlnE0tXrCW5fqSeBjD2fQZiXeHm7q2J7M+OM/MVJnJFyTY8trnaOH+piRy77yp7fw
         6KGw==
X-Forwarded-Encrypted: i=1; AL+hErETNrjULRq+Wgs9xRPJzfP+/AgLNbfNtjA2RFtMTuC27fzEMNbOqnY/DCDBwDLc33m93piaPGR0Hept9xh63KMftw==@vger.kernel.org
X-Gm-Message-State: APuU4Z84Pylcmn4norh7uju7wSg5ph4inH9NMhfbr1JcC6WecnSJNU0p
	zMNzolvAchyh5poeKYq8Ti+AKJhWP0267WTTzIgO9MMVn5D8vq6oztI+
X-Gm-Gg: AZFdTZd6ecfIsrkhE1qCOtjxbc/P2eNcruQ3EdYqxvppR9ncLkmeRD3mAkrsATGoRa5
	EgrOsxJt3DuwFad4pYsZEMFmxZDRdEt8q0Q5U1URH/WFpW4hoZtPxyemlFIgfxKH7YFpLDTcmym
	o7GxesNN3Hj4DbXcT1ZRUL3FfoDPdsp+U6oOtSEh2/gbuZ3xBSKamz1KjS9AD1Ntmk81FBMjJY2
	FidYAattN7iZJ77gRJUzbVdykeSgGkBs/Kb4up1zwbklwIa/Zy2Uck6Rg145GwDT7a75DmG07vR
	hhWsCz4P3icy/FFIJ5ehSWKRXjYBd/Ie0M4+edDZlCmLp+JSjwuxPIm1iCLoBxcmybtqCQrj8mF
	7ff0pyMRSCcjAMFnKYzBpytpEADFVvhqLnlmsGlBgf/8C0APEBQp5rrYaTTWnWJz6PQRbVleSpq
	F+Ii/OGcsJqs7JsN6KGaLFOy5Xxsc5gFHqAk3N7uODx23NfGZHZAJWQnAa87u7TraWfV8ErMLI0
	AgaYT80xUPeBaYpIlzhzGzwYzqi8Gu4IIG7xsFo1f2JLbnuEXSDFxLQ0WKGDCg1rW7hRNTiqaje
	z6fSad9Eti35ZfpZ9g9SWuaFCvxHHSwertf43tML5Ne4tg5HZz8zBmb7VMD8tj+/Sz/c2wvd3+6
	T43i1JDyLyEfrQLEKRiaAERwDob7ddkkZjL0H/ShFkkHS9eEQWwkmtsc5LzRGKGyu3q5pI5Bo
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr6828586f8f.11.1795134360987;
        Thu, 19 Nov 2026 16:26:00 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:00 -0800 (PST)
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
Subject: [PATCH net-next v5 07/24] dt-bindings: net: dsa: renesas,rzn1-a5psw: Add RZ/T2H and RZ/N2H ETHSW support
Date: Fri, 20 Nov 2026 00:25:17 +0000
Message-ID: <20261120002549.1908299-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Extend the A5PSW DSA binding to cover the ETHSW variant used on newer
Renesas RZ/T2H and RZ/N2H SoCs. ETHSW is derived from the A5PSW switch
found on RZ/N1 but differs in register layout, clocking and interrupt
topology, and exposes four ports in total (including the CPU/management
port) instead of five.

Update the schema to describe these differences by adding dedicated
compatible strings for RZ/T2H and RZ/N2H.

Use the RZ/T2H compatible string as the fallback for RZ/N2H, reflecting
that both SoCs integrate the same ETHSW IP.

Add myself as a co-maintainer of the binding to support ongoing work on
the ETHSW family across RZ/T2H and RZ/N2H devices.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
v4->v5:
- Rebased the patch due to previous changes in the binding
- Replaced the patternProperties expression for ethernet-ports
- Set the maximum constraint for reg values on ethernet-ports
- Restored the RB tag from Rob

v3->v4:
- Restricted the reg property for ethernet-ports to maximum 3 for RZ/T2H
- Added RB tag from Rob

v2->v3:
- Added a restriction to disallow port@4
- Updated commit message

v1->v2:
- Added full names for SoCs
---
 .../bindings/net/dsa/renesas,rzn1-a5psw.yaml  | 156 +++++++++++++++---
 1 file changed, 134 insertions(+), 22 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index 30f25b06d62c..c08729136176 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -4,43 +4,108 @@
 $id: http://devicetree.org/schemas/net/dsa/renesas,rzn1-a5psw.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Renesas RZ/N1 Advanced 5 ports ethernet switch
+title: Renesas RZ/N1 A5PSW and RZ/T2H, RZ/N2H ETHSW Ethernet Switch
 
 maintainers:
   - Clément Léger <clement.leger@bootlin.com>
+  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
 
-description: |
-  The advanced 5 ports switch is present on the Renesas RZ/N1 SoC family and
-  handles 4 ports + 1 CPU management port.
+description: >
+  This binding describes the Ethernet switch IPs used on Renesas SoCs:
 
-allOf:
-  - $ref: dsa.yaml#/$defs/ethernet-ports
+  - The A5PSW (Advanced 5-Port Switch) found on the RZ/N1 family, which
+    provides 4 external ports and 1 CPU/management port.
+  - The ETHSW (Ethernet Switch) found on the RZ/T2H and RZ/N2H families,
+    which is derived from the A5PSW IP with some register layout
+    differences, additional timestamping support, and a total of 4 ports
+    including the CPU/management port.
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a06g032-a5psw
-      - const: renesas,rzn1-a5psw
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a06g032-a5psw
+          - const: renesas,rzn1-a5psw
+
+      - const: renesas,r9a09g077-ethsw
+
+      - items:
+          - const: renesas,r9a09g087-ethsw
+          - const: renesas,r9a09g077-ethsw
 
   reg:
     maxItems: 1
 
   interrupts:
-    items:
-      - description: Device Level Ring (DLR) interrupt
-      - description: Switch interrupt
-      - description: Parallel Redundancy Protocol (PRP) interrupt
-      - description: Integrated HUB module interrupt
-      - description: Receive Pattern Match interrupt
+    oneOf:
+      - items:
+          - description: Device Level Ring (DLR) interrupt
+          - description: Switch interrupt
+          - description: Parallel Redundancy Protocol (PRP) interrupt
+          - description: Integrated HUB module interrupt
+          - description: Receive Pattern Match interrupt
+
+      - items:
+          - description: Switch interrupt
+          - description: Device Level Ring (DLR) interrupt
+          - description: Parallel Redundancy Protocol (PRP) interrupt
+          - description: Integrated HUB module interrupt
+          - description: Receive Pattern Match interrupt 0
+          - description: Receive Pattern Match interrupt 1
+          - description: Receive Pattern Match interrupt 2
+          - description: Receive Pattern Match interrupt 3
+          - description: Receive Pattern Match interrupt 4
+          - description: Receive Pattern Match interrupt 5
+          - description: Receive Pattern Match interrupt 6
+          - description: Receive Pattern Match interrupt 7
+          - description: Receive Pattern Match interrupt 8
+          - description: Receive Pattern Match interrupt 9
+          - description: Receive Pattern Match interrupt 10
+          - description: Receive Pattern Match interrupt 11
+          - description: Switch timer pulse output interrupt 0
+          - description: Switch timer pulse output interrupt 1
+          - description: Switch timer pulse output interrupt 2
+          - description: Switch timer pulse output interrupt 3
+          - description: Switch TDMA timer output interrupt 0
+          - description: Switch TDMA timer output interrupt 1
+          - description: Switch TDMA timer output interrupt 2
+          - description: Switch TDMA timer output interrupt 3
 
   interrupt-names:
-    items:
-      - const: dlr
-      - const: switch
-      - const: prp
-      - const: hub
-      - const: ptrn
+    oneOf:
+      - items:
+          - const: dlr
+          - const: switch
+          - const: prp
+          - const: hub
+          - const: ptrn
+
+      - items:
+          - const: switch
+          - const: dlr
+          - const: prp
+          - const: hub
+          - const: ptrn0
+          - const: ptrn1
+          - const: ptrn2
+          - const: ptrn3
+          - const: ptrn4
+          - const: ptrn5
+          - const: ptrn6
+          - const: ptrn7
+          - const: ptrn8
+          - const: ptrn9
+          - const: ptrn10
+          - const: ptrn11
+          - const: tp0
+          - const: tp1
+          - const: tp2
+          - const: tp3
+          - const: tdma0
+          - const: tdma1
+          - const: tdma2
+          - const: tdma3
 
   power-domains:
     maxItems: 1
@@ -52,14 +117,21 @@ properties:
     unevaluatedProperties: false
 
   clocks:
+    minItems: 2
     items:
       - description: AHB clock used for the switch register interface
       - description: Switch system clock
+      - description: Timestamp clock
 
   clock-names:
+    minItems: 2
     items:
       - const: hclk
       - const: clk
+      - const: ts
+
+  resets:
+    maxItems: 1
 
   ethernet-ports:
     type: object
@@ -86,6 +158,46 @@ required:
   - clock-names
   - power-domains
   - ethernet-ports
+  - interrupts
+  - interrupt-names
+
+allOf:
+  - $ref: dsa.yaml#/$defs/ethernet-ports
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g077-ethsw
+    then:
+      properties:
+        interrupts:
+          minItems: 24
+        interrupt-names:
+          minItems: 24
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+        ethernet-ports:
+          patternProperties:
+            "^(ethernet-)?port@":
+              properties:
+                reg:
+                  maximum: 3
+      required:
+        - resets
+    else:
+      properties:
+        interrupts:
+          maxItems: 5
+        interrupt-names:
+          maxItems: 5
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+        resets: false
 
 examples:
   - |
-- 
2.56.1

