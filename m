Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CB336A03F
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Oct 2026 15:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869435; cv=none; b=jTQfWZpUUrJ8JGDwe0x+aZ18AyroBB7tulfx6r0h1OnLGKFBur4UQKTHdFzP8u8g2U1tA4ZxMHeR3C53GrhIeApqpr54FgGHvhy9tcXVWxP5skt1OQrdgTZv5aHDW8lQ0PmMdbfI40ZowCpoDwOO0gr7FqvpdEZVVYAXsiZq80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869435; c=relaxed/simple;
	bh=1CsJrL5dv0jqsIRpjcW9K6WQKh7GIcyCFtOvsqLHxU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d/grsNwlKmBkk5hkFS/HTrSNLjcG4hKPmXUjZJwiOS+A6ouVPsE2doGtByU+kT4HWmPKWMGvfVgaNwIMQFHhv/XKJQ+QRcRAmQvm+mu8dJLWDfHDQl/7nQX17AptHI5pZl1p5AL5RELA7/sZt82DQis58AzJS8ixd6ii0XaidqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtdR7XHP; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtdR7XHP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6350f91so3913159f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Oct 2026 08:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790869425; x=1791474225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoAP5G+rK5YjhZNDe2tKfnhAIi3bqkkWc3AxgLgsr9c=;
        b=qtdR7XHPTV41oF5Bso5O6zlM1uxmq8TSlUvYkmad0WWuzXza04T3aedE27V0O6f+OK
         d7na96qlGbz2fPOnQfIJAiPvLEoJtT5repQ3f0jHD40QK9nHKGLngrb4QmqMNGcBFU4d
         m1aYNsBnctpJsMXst6t40WnO72WuL7QsT+9Hvk1aYErNBoJSM7E+8VUG2lkQK5tW0XNA
         bt25JLQckGBke+U77aweAZV9KUqe18S3H6108NBRRIIL60zcp/oloT7lvxyRoTbB4rcS
         NFEqMnBDoVgmbpyHbqIrU8wgDSutHDHRwNZ/K6Fl0kYZDhb50+xa71iVZSvG/5+O/bW/
         buVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790869425; x=1791474225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VoAP5G+rK5YjhZNDe2tKfnhAIi3bqkkWc3AxgLgsr9c=;
        b=rDcDETmXve1HTSvhz7JDB5L3RJvthWydHuyNMlTmVzD/1ChG2pC5E7UlUR81qWL1tF
         +0L/eWKv9rQmlkjX9Fg/czc73hX67AHEp/KiVY5CdyK6s0zTEcW2T7KYv67z50Z85zL/
         Mgc80b1FzwKK+S44vI5wEYIbsZd3D1guLTRsmLeYvP9PGW404ms9Slxa1xfKS94j7rR/
         bm2KxAjOzcNejXZchQQ+v2+Vw8BDZEnPxZn0608AsI+20ZfVvRys3k6zC/CSyfKa6L0y
         hyoXA8Y7d5vzATM6AikUXrWtIsPkrjYMz6FxjPHosUC8BHxMJjmmbH1Cx9oENrXWkBWi
         8jNw==
X-Gm-Message-State: AFuF++kj7XO+AvklU15MhfzytZAeZhsxxBInug2ofk+7d4cY2QBdEoQ9
	oHB6pBim/U2mBn03V9gOnfpaxL7XlNdKFepiyKyf7z4kuZSmJWoUd5oHZECT7JxPahw=
X-Gm-Gg: AYBFou1N6ZMgyaT5EeF6MDzgmzF64qGb7t+7/kO7Ob+Rt6flgZRBLKkY96zGd73qbDt
	YyGjSW2vg+3eGHf37B9V44ZFV9LSQaYno8KuynUPtpKlgajpW7ensgb+pYGvZUanBud1A993ClL
	t+tf35jATNyfUHcmdn43fWIplGiBUxKOSbhMnUXE8gNZhy/W17OL7EOX90n7KAfgC9XG5+MOspe
	tXTZY/OMDNjtAIAXSrz/y9XRVQTpUFt/FFotKuOpEHc2TZgfSm4IC7zVkzJbyf15xBK0HFCQ7Sq
	HrUQxFxeAe6wZmzMoBklunwxV5eAFTcbJnkHCWM5mBzHmktzN5MPDcdTSTy+bFYXRmQ9xHRmBTS
	G3f7AzLVb5ztJH9if9QsH8jdfrqRS+bedxQYhJr4jD8vuRcUL9Dn3FZqRabM8qghK3wW9S7H5k1
	6NleahJCHCFGZSKw0bAl7w5sv5UFlHaIx3dSz6G5Iw/rGJBPC9J5IA+nV4tsAx6ou1Uk5R30HQr
	Y1My7anJh6AAq3akDGSYAaIJ0+xv+fC2Pm9k1MPsjJwHlPOCfyIraGZjNf5+ADp3GKeBqkurG/6
	HYE4tIij41c1oJ65Nvk=
X-Received: by 2002:a05:600c:3152:b0:4a0:2500:2cd0 with SMTP id 5b1f17b1804b1-4a0275977eamr262145e9.18.1790869425065;
        Thu, 01 Oct 2026 08:43:45 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:1be5:ad57:d5e0:f854])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f6db98fsm65195615e9.0.2026.10.01.08.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:43:44 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
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
Subject: [PATCH net-next v2 11/12] net: dsa: rzn1-a5psw: Add support for RZ/T2H Ethernet switch
Date: Thu,  1 Oct 2026 16:43:24 +0100
Message-ID: <20261001154326.754314-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261001154326.754314-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add device tree match data and configuration for the Renesas RZ/T2H
SoC Ethernet switch. The RZ/T2H uses the same A5PSW switch IP as RZ/N1
but with four ports, the DSA tagging protocol `DSA_TAG_PROTO_RZT2H_ETHSW`,
and an additional 8-byte management port frame length adjustment.

This prepares the driver to handle RZ/T2H and compatible RZ/N2H
Ethernet switch instances.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index ce931442d49f..1d5ce18b560c 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1334,6 +1334,14 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzt2h_of_data = {
+	.nports = 4,
+	.npcs = 3,
+	.cpu_port = 3,
+	.tag_proto = DSA_TAG_PROTO_RZT2H_ETHSW,
+	.management_port_fixed_frame_len = 0x3fff,
+};
+
 static const struct a5psw_of_data rzn1_of_data = {
 	.nports = 5,
 	.npcs = 4,
@@ -1342,6 +1350,7 @@ static const struct a5psw_of_data rzn1_of_data = {
 };
 
 static const struct of_device_id a5psw_of_mtable[] = {
+	{ .compatible = "renesas,r9a09g077-ethsw", .data = &rzt2h_of_data },
 	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ }
 };
-- 
2.55.0

