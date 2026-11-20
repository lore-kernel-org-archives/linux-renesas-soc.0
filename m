Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134362;
	b=qU83acYiNRgp33HcqHis9lusxTy1Mm5WupMjoY0DtACXTnS4xN6niOfu44XOWQ4ukq5D
	 c6mmaJi0thG3dnifcQrz1b41upu7+RsTEoUJUJ5gf73o82hBayr7vb1/sCbvaBR8vMxLt
	 o7Q01zgVkx2TBRvuCazr7Y7YlKvNncJ/Hb674hvQ3YL6lCN0TmgogIglopac9glETBmQ3
	 a4RCeKvker14uE0xCdHSlL5FoxUi7nTBEM4i4dCCHyEKKxwLBOgLkkaiHL8b7jBswAL7v
	 aHfs6ghHfJLPJt9cnoS9fNpO6lFX2zYsSM0m/0u8xj6hhllY5IuN2zfqYeUm59HH10g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134362;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6w08ojKvpQJFXR8rAUWt6PkCv2RVjEVYZAF28er5FZo=;
	b=VRWY8tu+2BdXMUS3LOdT1XYnVInlM3j8vjpS2bwMD22fAWswZxWgtdJnqM8IBMJQ4uGG
	 yTmwdGll1Mqh/Cry394Woc9Pyi1HFTnR+rCCBqVbo1ydKhfSWL5aiJL5AOGMp0VBD6UVC
	 3WzFNci9VwC99O56bLTi6DgC7wIX9HskfWzCv/XxRteaOY/cjmkP4R57Y0V1mjDvKK7H7
	 a7O4H2Sfb2WfO0iGOd0lb3rA/778foNlZA9XsUzWLxCEdARjcD6P1RfPylUFoBeyVSaoP
	 NVYWw1TPAx6Jma9oKgCJYmET5RrT9iimgVoV1QHoeL3s6baAgt/dyDlFm39+5FBjBkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="O/p/TIxM";
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B2460A3808
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B2460A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=O/p/TIxM
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a68190a2a7so258831f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134360; x=1795739160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6w08ojKvpQJFXR8rAUWt6PkCv2RVjEVYZAF28er5FZo=;
        b=O/p/TIxMNe1VZNL0tb69pZrpgTyXAasD93YyWm4O4g0OxXiQ3RSyP+C1k2XJcpnnWZ
         57wQmpgoyFahDY7mHlhUmAqXIeRyltFF6XLfMNAnPR+Vs+7LdI/jtzJQztOHkRlITWbJ
         VXgmmiEHRdCou5t1ST1xNBJxZk4gGYchsXSXvc9BAb7nbZLlZAC09xdqLBwWcpIoGE0Q
         XzwajEO2ph+fICyEmYZsaln5bJzkr+Nu+MF/c54njKpwSNJ49uOl0yWg8s3box/C0mIY
         bHPqK18hIDiiVTHrTtEo8IwXNQWgDXP7AOfifUyqRv4PPHPEY8AmczehAFIY67maiQFi
         8cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134360; x=1795739160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w08ojKvpQJFXR8rAUWt6PkCv2RVjEVYZAF28er5FZo=;
        b=NVFBLfHt1GY5INoGDHO4Ah3NyfmUFbX4pv9F3u0xV7RjTMxMvhxjC2EmNAKSAfuSbC
         2h0xga47AsOGy4eVD6C8qhsLnQQrMQ8zw1fWRBBC9VoGsPpnJUxBYbxL6kbwehtIlneu
         W2q+6mxPelZNaLZ5rC83ZSBhO71MgFg1EiMdzUSS2F9jpqvZTb2Gy9FI3NHmz8F/SEcY
         UDgOIYzM5NhwVnrjl/yHz7AKOiG5qnvsuyNQ0bgYVmlwPtjF5OEBjd3RHDkhhJzyB2dT
         kQfn1b4ByZTnWBmBPexv3pKjNCn5VCIMC4Npqe8/MYUCQp3Bng26wPWKmbhxNeSfYoyR
         6Agg==
X-Forwarded-Encrypted: i=1; AL+hErGeNlDJ997EGA/3O4vNSrCuhuvjgy4yrW7s/l1IBfJTyF+ROhADMb8mRaEOnKrh/iViWcYiHX9g3zkmX9OwXPrkug==@vger.kernel.org
X-Gm-Message-State: APuU4Z9392ndUUYTStD/8fnoN3oeXrFpB1UduMwN7vfP30beJCnTdihN
	F5Gh0qVmGlEyqPYcuKV/BJNrjnCSdZrz0nVYaomzWd7j1++DuZqealpx
X-Gm-Gg: AYBFou1Q+rNlGwDjLeolVem1NiMCS6HsbCn5/me8M9oS2f8JFEqa22ObY6kOdT2lNJv
	XQ9YKSrCXl4SPHUS13PjXU5qGaoFvn88Sah3hL36JORlQkb6tb5AQKPsqEVV4IA9h+KCCE/b4UO
	xDGdL1njehGJh9/hPCZfn5MFl6DJfGEwNO/fGtL5UM1GLTlaV4qHNH0mcY86r0WzYdePi24ly6D
	tl2rQBNh0XSx4uWwwlf33BI+PEPlyPtAjcLbgiMm5hBtiY76H4MejQS+odpqoxo+EFtfPjB8qkv
	BignXrVfSKSM2G5ohBs/1fMleIZ37D1YAb4rGL7BPhJvG2gwiwY/aAolnncCUmPVExWAk5Nl5F7
	8M1Smq563rEH/FQ2kEzMkEAZTQbSwo0Bop+2oebSJmqzjXmew072IygD4g4oYp1+4geKPK0DjAo
	3TBLKM4GbQIT+MDjd/OnE+/cf26qlv5Nr6CWEnD3glC+WuhwG3N86PKPQCoONtpouAY4tol14rq
	OcUu/ddyOMP/Xnh3ygyi80nl/SKRYnwYPfv0el7mDypPcEfgV/wY8t8nPANRMwQ0Ot3BAtYiJiT
	oRCfjscvzBjj2/NFg2sH4EWmOdXMNKe7zxjKzN9f9I4KtKuvJHSwAuyl1S//ETw/OsDvW+2KOXo
	MIzVC/kUxptgo4mJPu1ln7RbLDMdCQwFmJiAlZmvUo4yhPd5XDtOKd57TyxfMCv0AkVOJa7aklA
	==
X-Received: by 2002:a05:600c:848d:b0:4bb:6687:5386 with SMTP id 5b1f17b1804b1-4bb8880c7f1mr29095585e9.19.1795134360078;
        Thu, 19 Nov 2026 16:26:00 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:59 -0800 (PST)
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
Subject: [PATCH net-next v5 06/24] dt-bindings: net: dsa: renesas,rzn1-a5psw: Limit port reg values
Date: Fri, 20 Nov 2026 00:25:16 +0000
Message-ID: <20261120002549.1908299-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

The A5PSW has four external ports and a CPU management port, using
port numbers from 0 to 4.

Previously, the patternProperties expression only matched port nodes
with unit addresses from 0 to 4. This allowed port nodes with other
unit addresses to bypass the port-specific schema constraints.

Update the pattern to match all port nodes and limit their reg values
to a maximum of 4. This ensures the constraint is applied regardless
of the unit address.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- Replaced the patternProperties expression
- Added maximum constraint for reg values
- Updated commit subject and description

v3->v4:
- Added reg items validation for ethernet ports
 
v2->v3:
- New patch
---
 .../devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
index 9c477ceb170b..30f25b06d62c 100644
--- a/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
@@ -65,10 +65,12 @@ properties:
     type: object
     additionalProperties: true
     patternProperties:
-      "^(ethernet-)?port@[0-4]$":
+      "^(ethernet-)?port@":
         type: object
         additionalProperties: true
         properties:
+          reg:
+            maximum: 4
           pcs-handle:
             maxItems: 1
             description:
-- 
2.56.1

