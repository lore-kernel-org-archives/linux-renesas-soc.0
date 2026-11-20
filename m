Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134368;
	b=O7WdPzl0rOK3NlWGEX8Y0IfB1nH1/kDwcHoVM0woUOdwb6h5aNRjGe4Z4qJJjiMMOVh7
	 tXThlUX/3+sqE+J1/CCz+qwTjijMudPs5bOGSrRjtuawJPjMP0Cn2l2NCGpPGIEUBQvyY
	 NBk5V9QfDSUWQmiBuPKWB4f+i7JKnVLaHnXeLNx075hcQjl1PHx+4XX0Pc2XZwvQ8S79h
	 rWgcM8sbhLG1s+G8oPWbAiyX+5r6cAmeIzqOXtwmuz7KCvzbOjyqcEf/OjSMmP2qPnSaw
	 0xjepu226yISqquf0t0RYaHI5i22jbgIttQNq8jbxFbd/z0s8cBXhmav16TKAxcFsLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VK1fNNRgahgZ5UbyQMtX297sn1lHlnpRVOZJQu9znQU=;
	b=NzfuHgt3f5PsmQpBmbxi+Sw8lEHZUk4aUulAvUYQbbcRuPpeUwypM9xwg8wpOcyeN3ZD
	 AZ6fl7wS3rPj5X40pck8cfp+xhKd1fiRrug1AZMCVEp7JHWrJUDN7dbgba4aIZiqw/YTs
	 kOT8wbuuyDvihwCE34Ksfqrd3MEWOtJyTAYLcBAhyAFVn6fcA+U7k6aP6KPKmUYXxvHuX
	 AjtSQrT9+WCO2T8SkNSyBdqbKcufxeXbc7MXBPXVjftEXnMff0KY3/MZgeMPGVlLGabYM
	 Ti8K24fPrBGiOu2VSbNVQIPLiRCv4nZ4CS+WbMNQI//WheUgWFNOPrx0fqIqBSHfpeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFR4Urhh;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C945260A262C
	for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Nov 2026 00:26:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C945260A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hFR4Urhh
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so1056107f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 16:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134366; x=1795739166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VK1fNNRgahgZ5UbyQMtX297sn1lHlnpRVOZJQu9znQU=;
        b=hFR4Urhhy5pynmaEn2XSWln1vfQRlQu3rV95ts7/CSzJHMgltu1s5vMK+GlZFtabnL
         uhEcjM1QoN+HW0NKsZxsJfRpPZFJDUgxZhvCw+mYjKBvEIThRt1KOCbN8txky8IUY+d6
         FJ8p1o3z0gp6qxxOZaRt+DWG11k1VrjQEvphx1igmfwBtK/YOagfh6f46fS7XZmi7Svl
         fU1wIXA/1jJ0WU3VSfIqYvEoLH7gJivUCtpwgiKtcLPzPjBHaZm3MHw4RU4ZpkFFA9o+
         1F1P/oAX9LdxiPLgAivCuOg9Js3YxNRAhBngMqEKisrmCXCwUbNw6g/dmulcZIoMS8wO
         vMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134366; x=1795739166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VK1fNNRgahgZ5UbyQMtX297sn1lHlnpRVOZJQu9znQU=;
        b=rnbK6+dTb6e97SP2wIN6wYHPkjHD0wS7Ff7BdwFsskjfCNyozkDHHvbRIXR4xPg6Nb
         l4TgWUcnFAVSBtnXkn8Lc+isS5kxb7EglFhbUlMT/w5zA+ar2bxAdbseAo+NKEaBmWdc
         huxLw4Yq8GtYL8qiPLv4jno9vj9pfhEGGf+JsFtFiNvZxpdC+2qODpE2Hp2PuicDQkve
         2CdDRTw5xcq3XyvngaJW+iJffnU/LgJDL72zsKb9/tiAGltSMzH1Vq9/3UHmP3qgwNwZ
         YfAiKDu0fPF+2EOEd1EI4cvyIxFd8YntDglkyRfzrEpgwvhHwuonLdyeeih1Ni7YQssp
         2gmA==
X-Forwarded-Encrypted: i=1; AL+hErFfeHBl/T1Ls5ku8o+XDqoTJKsHGJ8dhcGvl8kJjOu7MA6rh5WwxtOz/m3ML+j5vFq7df8ey37j73W+ZovQa6cXyA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9H4i/bJWpV4+bJv8Kda4tYz8pmoSJuG06o3A+F2+hAuwUk2Rm5
	1WwBv7BEgCV36DiJsww+OUBrSzgP04wABLUCaiYVZ+HUG7GM4qIaS2mD
X-Gm-Gg: AZFdTZf7ryn9CZj2Xu/B3rZPxVgoJmCEXybqPyIKOUHzftWmuodTRRl8AjpyWjWMnXX
	K+2quXgY/8VvNkBodo0g4eGm6DsFRR4rS1Wb7PUWqsFImtek5LVHF5FCwNK0blnV2mVats5ZpnW
	4rNrihYZYOzHqza4S2UwyAUJXOpPxhomb7GMVUQs/M7ByKhXCBILNGcUhsgd+wBoy1hUoRtnu0t
	txKUVmcRSx443ysUy9AOqmOXnSpfjmoPMFmoRg0iGAi3+ujqVdgOQCqzk59gl5QxcEgdgUyf8J7
	6Fqxgxs54DpqgNXr6U5OPgbsEIt5IuwYF01OO/p4E4lyHYNbRLyXwMnfPQM7F0yfmBNiZcFdzdm
	6pqp8kn/qFUe0mhcu/yUT27LYv+VLj/Ecj3peejOlTNVmoKpEQhSkezkRYdrHfaM0Olm8iIOjuJ
	xV4r1IWok+6cn1U5QI2mPNgFiyYHfE6sZ0JYCX8YLcHPKvj/agKEiikmJYRA1NjHEsQEZ4OqLAn
	mm8q0X+K1s44+1niTdUM4tX6Y8BQ0CYphUpVFKOubpcaeY0lkO+fjQcFDI31if60mmzI2J3DeF3
	05KpJ6MT4jnhZAlsk6tMoqZyvr8PwO6qKe71xOw8P0euOjUl/CrxJKxV9A02xjb9OoPKGeHSGJw
	ppK8mhIu5Xd5tkawl5ThkViKJtj4ELziiQnK2HBaOptf3kG4m1WlE7J3IkMtB5TeQeLWQ4c+SAm
	qqOLtS4hqy/r/edEuIig==
X-Received: by 2002:a5d:5f08:0:b0:4a7:1428:13f5 with SMTP id ffacd0b85a97d-4abb2448700mr2097188f8f.14.1795134366161;
        Thu, 19 Nov 2026 16:26:06 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:05 -0800 (PST)
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
Subject: [PATCH net-next v5 13/24] net: dsa: rzn1-a5psw: Add support for optional timestamp clock
Date: Fri, 20 Nov 2026 00:25:23 +0000
Message-ID: <20261120002549.1908299-14-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add support for an optional "ts" (timestamp) clock to the RZN1 A5PSW
driver. Some SoC variants provide a dedicated clock source for
timestamping or time synchronization features within the Ethernet
switch IP.

Request and enable this clock during probe if defined in the device tree.
If the clock is not present, the driver continues to operate normally.

This change prepares the driver for Renesas RZ/T2H and RZ/N2H SoCs, where
the Ethernet switch includes a timestamp clock input.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- No change

v3->v4:
- No change

v2->v3:
- No change

v1->v2:
- No change
---
 drivers/net/dsa/rzn1_a5psw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 669dc584e6f7..4b31a1d331e1 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1217,6 +1217,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
+	struct clk *ts;
 	int ret;
 
 	a5psw = devm_kzalloc_obj(dev, *a5psw);
@@ -1251,6 +1252,13 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	ts = devm_clk_get_optional_enabled(dev, "ts");
+	if (IS_ERR(ts)) {
+		ret = PTR_ERR(ts);
+		dev_err_probe(dev, ret, "failed get ts clock\n");
+		goto free_pcs;
+	}
+
 	reset = devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
 	if (IS_ERR(reset)) {
 		ret = PTR_ERR(reset);
-- 
2.56.1

