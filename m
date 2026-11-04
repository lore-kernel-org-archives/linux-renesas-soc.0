Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816482;
	b=BA88+dUC/pFD8y6Sn+AsSWTG7E4r9Dv11Hi+ucDemV7vcGGrww4+Eo3jtAOJL1mKyE/s
	 gNWrf0glAmFJDvYsgpN+sh3n1jiwqGRyyDE+2najiACvMVd/h0rtIU+2tIOtvIbTZTn/0
	 xerZ+hcAsdF6S24fLti6isaap3dXmbheMxhcVICNJvgro/IaBFBVFt+Wt+WxDa2uR2jtB
	 /EuyoFUHbfxfdSvLZMjKFpRwjbGV/7KziA0en5O37+5AcyeKu1Xy72b4WVbg6t3cdSBQg
	 X+R8tjX/QHKa+3BNHeKsxRM/X+7XHW8H+IGFc5SYRKwPpuMQwQk0cB0qW6xfnfsCEKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=A/vQp4Ob6tZK/MQFMF+LZw+BEhdevGHfoc7PehuPwmo=;
	b=g1zeYc+eUvEKq2SllhYTOcjBsRAae5+dgRE9LurrZ7PsC7qPs8O6ki1sdq1/AeekE+BP
	 O/DDdLBq/Y5LuWOD+WS94dTDrg2JtkaRUXCub4TP//wevGxGOpyyF7GXenGZn2mJazLXf
	 pjDb+LG1U/gfM+JG2sHEppVyGcTKB/AHcNqv1rk/5l36fk3EZhKwv56Q1/svEaVpGBmUh
	 K6C8OuxXEBMiIJ+JZmOZpeghh7AacbhzWOUrjhetyurpM+greJ95ASRW24PKytMvaRyM9
	 GNmcejjtmAT5WkDNaYulJBAzrL0JsNoZFJpNoT/IPfJikMYEvxwtc/wlNr221wIJyTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwbPKIq7;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9818E6083615
	for <linux-renesas-soc@vger.kernel.org>; Wed,  4 Nov 2026 18:21:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9818E6083615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RwbPKIq7
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48c4d99c32bso896035f8f.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Nov 2026 10:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793816480; x=1794421280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A/vQp4Ob6tZK/MQFMF+LZw+BEhdevGHfoc7PehuPwmo=;
        b=RwbPKIq7zMTbMLWlLYHeKDbhMe+TJSa8Op8YyT7vKpp+3wU4OAdCesEoDRWgVqkKXx
         ldR581ZfsIBClZ33PESVj6+InSbkRoRX0J9zRkxulpzh0xdJlkU2bOBt3NSmPaSLwQR5
         2ddmljiCAQ8rwDjfByTOiH5RxRdr8ghOzfIpJ0UqLWH9atfuAxT0InbkCDtbHTtHAO8e
         OfhQCRXS2m0W41ufCJvtIHRCZzBfffSgtsx9O/fgu6iCkSLBaiSGRo1709m9aLaTi5GN
         Ch8TET5QSaoltqkhw2ma1glWmm3uTQpmY5Z6xZNSM5q79TqtGAxAE0bsPdV4xDYJAvRp
         vvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793816480; x=1794421280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A/vQp4Ob6tZK/MQFMF+LZw+BEhdevGHfoc7PehuPwmo=;
        b=FvzpwsUkE3aY/2vFV5ETRdxvUAlwNwFCYEdISRijRUgibnMPU84jJk3eJ73Y2Ti3wh
         dBBnmkkMKZTkTofTvAl2vaSHfqjkQ3yYwy/mfR5W9KITBk7uWTIPP9fqiXhgadE7dt9p
         r29Um5+b75XjqMmZa4xy4cdZUkSxGQju3iSjFQdoauf/Waq3CkwV6Mykcl0T3hoRl2Uf
         4vyCYVuknsIqRdLx57iz8pTfy5/5AcMEzY/WqI3X6bSATXfnTr95vDleewBZ0D+UFHMz
         ms7qR5Msx0j8ERCfMWH77w1jaYyMN8BvnXOAEBGk8JdlogloYNdhx98fMVSf9UMf6JD/
         sLOg==
X-Gm-Message-State: APuU4Z9MKIOcaKw8ZZ+0qNKK6+TmBOlPpehX6lOws6D7MDgILLHggF9A
	o5P/AcoZMPsCKMClINnS7qH/u/cS83vDkenW/gL9ZhqA9gx44vyR41/M
X-Gm-Gg: AYBFou1MvSZXT3GWsuNPVsl1wxYPqJV2O+m33zaXy+73ATmEOwyPG1pNVh+BqVpgSMv
	xzsFhSbt7TnttXUXAKYOXcHaXzZAGyZ2WcJDq0jmXQYsc38fWny69R7FmSLJb6J+hU7XbTTZsel
	wlRf1k1aYz/LjedXJG3IZS1+riq+WgKLbLeiZqWhHkNqc/HU5jokYoWH0R9cunfZDITAoV6PWk/
	PqT8mDeLikL0DUTIoGyn3XnHYJILf+RuN2fjBJ9XpuVmYbVFdgHeJgAlCgt4MoJD4aUXMdF0Che
	DzqRmc23MhqhEpwU4QPQDVpkLSvoPaudpVgBn1ArSfGsArat/hefF+Qh5mzfvt2qywV0vhiRWgv
	/TOXYRjIqFRvXwSllluqNFh4IHmIs44wiERXIYTc/GGEZcjFr3lvW9goV8/7cceP+rzv/IPCo8/
	lWvO4iEf8Am/4yMysz+kRvP3QbWoxBLKbqQVGqovJfQIN/LC5g+Q5beBz97UPBxo1M5AayBt9Fe
	oCAtiydAM1qDplXPRy2d70Gq+tTBrh0w5Za4MboTNRYPUiR8/4DGXVzw7W9XoEhG6xboNqiHtRG
	hJtGBQDsbdLd6LnddFgW2el6G9QqH5DCaVnbFhJCidUE21qBZRxTgcgJg9Lw+mTySFdFkkxTZ7O
	iPMUUgIRiKOItkTEDzAerL9M9Q2oMp4o+Yt6l0A==
X-Received: by 2002:a5d:584d:0:b0:488:8525:4979 with SMTP id ffacd0b85a97d-48e6e50b5f4mr35431995f8f.45.1793816479972;
        Wed, 04 Nov 2026 10:21:19 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:b079:a2f1:caf7:b446])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed0844e2sm4073202f8f.28.2026.11.04.10.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 10:21:19 -0800 (PST)
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
Subject: [PATCH net-next v4 08/14] net: dsa: rzn1-a5psw: Add support for optional timestamp clock
Date: Wed,  4 Nov 2026 18:20:56 +0000
Message-ID: <20261104182105.1102555-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
index 9daa5d8245df..846216f22bc3 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -1212,6 +1212,7 @@ static int a5psw_probe(struct platform_device *pdev)
 	struct device_node *mdio;
 	struct dsa_switch *ds;
 	struct a5psw *a5psw;
+	struct clk *ts;
 	int ret;
 
 	a5psw = devm_kzalloc(dev, sizeof(*a5psw), GFP_KERNEL);
@@ -1245,6 +1246,13 @@ static int a5psw_probe(struct platform_device *pdev)
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
2.56.0

