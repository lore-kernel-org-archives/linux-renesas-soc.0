Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816478;
	b=tioLrBDyY0dq1D0bY7tR+88Ln7ZXTwX0OxJcZlPccYT8wk/j7LKdqukL+dGbjIvXKoNc
	 t6Zn4bdfWb4WgZyJxQ6fSLbkYh1HdsOfYrU+kg1nCeD2ydvBzlzzQH7B2Y/TI/TMRpga+
	 a+y3xLkALwbNsSOT8UDR7lKc2q33OX8vjIcBnx//b42MVHXcrbgOZ0zHOTXLSvlg+6l56
	 1ni+7iYLb0t2B3rIl0xZAqMFhMjHtvZYAbXLChdgGIpc/gpZ5jrjpM3sXEVWsIcXXvOgX
	 MKYaDkY8rS3fHcthy/PzlkYVWUbIXWthGP73n12jG2N5VI12+u+8YQ000DElSQYy0Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Q+kakf3+bGYR/XpLFDDkxjLybCV6XrtHH6WOIPQu1A0=;
	b=WISjuN4hsSk0E0xzxD5S9WU3s1GtwYa8dp5ik0HE9odlK47p0IYXUVXQfX90xwXS7QCK
	 nWTO25dtwh1xSD4eOChwff2MysKVOsN+ZyW0yi7y/aMIYhKqqpozvxQkrOP67o56+aB5x
	 e1d+4+j/WQB4X/bQddKSy3g597tV/ACM3klMEVptckQVUY5FAVJ7yksJin19Xz4Rs8IHy
	 sOHaMjA1bII8KpzCcjrwQ+jcSiAp+0AGtGkRBkKrIdxz0BLATSXduMvoGH379MBgS+DYc
	 ryalEtxxbCazUlcWcVB8BzJNPQOZLgqv9PWXNHiZORg86zGnM6GZ3hpxAf371xJaLAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAJJNu23;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E066082BC8
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 18:21:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E066082BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iAJJNu23
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48e10a70540so648750f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816476; x=1794421276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q+kakf3+bGYR/XpLFDDkxjLybCV6XrtHH6WOIPQu1A0=;
        b=iAJJNu23CPWLdbMHHLohwld1D5Iq0H3WizJY08Cj5VAeuOddC9clsyvI7rB66WUt98
         dy6pTFjIawIbQIbhudn5TDxpFBV/fjcvwhGzl6Ee+3T4pAkxhVBxVbcAd1S/vOg9Bhln
         PzanBZjK7SGNdSpnWfovET65qjh9FQIPy3xlCNZ1L8qUKcx1KvQCkeuwd0RTojXoaAtV
         ookjBWFVN8Hxo3LQsWXifYUYHasJar2ogNLEvjtUkghFlDVL1vv1Ya5FiU6cJI//V1yH
         ICnj5RnICtljg8BmGifR2hHlT80ahfbRROT6t2qE+Cihd70iIlsd6eVmkHYQykUDJ5YT
         racA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816476; x=1794421276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q+kakf3+bGYR/XpLFDDkxjLybCV6XrtHH6WOIPQu1A0=;
        b=GwsMcbkavt95b/E/nNSz2LF+1hGBaMHkiEO0Jm777JWzfbRBdb2cZWgDnpkphLlsX9
         ImfeRtY4bKVqNaE6Kkb+jPoKwq/x9BUIqoFeAAMgTRmXi00TnSC6vvbwSspWFhtACoTC
         aKedlKclM8CY4/4yowwDEUt5dYqftpFTNTSmd0k9dcvBHCb2hoaNyoES3hy4Mq7t25Bl
         8KRCDqP2rIH5yDKjektnfBnMw32LaT9ekOiu1+obycJfzOH5Hk6vIvxuZXc4ozbn7Y8B
         4dDoKySShHcmiUd3ChuC0Ps6CxeIvLZEGxF+IsMeY9xyG0JEopIREzaasIPaMOFRzaTG
         FHwA==
X-Gm-Message-State: APuU4Z8GdCsjtYmOapxokZcehp1YFXJ4N9eYdqdXffnewcIsyAYSvW+E
	i1gwf+PmZA9fq2fEi2zlPkpu1v5Y2g7eg9fAdROK5/FxsJNJ/lJaz6RJ2t31dBjWOCI=
X-Gm-Gg: AYBFou0+Ljb9mXPEfRlrsKPltrZAVTFoNrFfu0PtVq1/UiXlRn/IODYC7Gd3TAkwRzy
	/0JmpmHU54BVk/YagABm1jrwGi0INUquhsqui8RCzzMwIzl3equwJnbz4kNJrkkmXvgrGqZz8zu
	XYqfssDQzRAdWfRI04sI2eg7zOEh/a2ZsviPByY5YSCDJ771ktm2sVktJg7NiJwU6JhV1SrvN6r
	7d162aJBiAxenXN8QFmyC5J2Wxc69bKauHb3IBfSXIzw535tW3/p1UOpt9wra6KrcUaXdsopI7z
	Oj1jsCFJY37tO8j0vorVANqSr3jqb7gdYYVTRaNfEpx5QTt/wbI7gDxU/+34kS35YVMgDhYnthJ
	OpmLY2T8Rbsd7ef32k1ST33Ep8aBi1ymcSA/dw2aDXi9eyX2Rvn9OZyMw52U3cQfJrPSbhMJLdc
	qf5EObx/5BOjbXeHC5WEr3ciz3ipU/KV+z3ar20j+KADQicmyOLD1Hn3KpU2aaIaKpIjRoiDQB2
	kADPmzrlKypokvuGyQLHKJK44zUAXBAv94rAatwzN0a4JHSbxJRtV1sImAYZNHxzb27zZkCKYIS
	It4tIv0C3E6lBos6ShzCIB+INRVA9RpxegbzqZBSQppckxWb0m4rmKrsMUXH2DHZqZ8RGsfcHcl
	/sJyKa4Z1WZaTkSWVGpX1UJcmWGDJl9+akOIgHpW4kbGpU8y3ufAMWBWbMoQ=
X-Received: by 2002:a05:6000:40cc:b0:48e:5ea7:b1b9 with SMTP id ffacd0b85a97d-48e6e30543fmr40091601f8f.31.1793816476315;
        Wed, 04 Nov 2026 10:21:16 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.15
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
Subject: [PATCH net-next v4 04/14] dt-bindings: net: dsa: renesas,rzn1-a5psw: Reject the "ports" node
Date: Wed,  4 Nov 2026 18:20:52 +0000
Message-ID: <20261104182105.1102555-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

dsa.yaml accepts either a "ports" or an "ethernet-ports" property. A
devicetree using "ports" therefore passes validation.

Replace the top-level unevaluatedProperties with additionalProperties
to reject the unsupported "ports". Also explicitly declare dsa,member
to keep existing devicetrees validating.

Also Add ethernet-ports to the required list.

Existing in-tree device trees use ethernet-ports, so they are unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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
2.56.0

