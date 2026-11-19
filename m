Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795114237;
	b=vzQb2vr/I25PmxIA09ONqQZQWrnFnPbPwNLXpwxFkdEVEoTcN0Gq7SSBogb/NPcMZ+3+
	 MRNQl4sIoBz/ZpdV78bHuMH12lZZUY1uPJr1IaLnradhicOWHk3dc+o13RKEyGkNnClV2
	 Fl5TIbvyvOMgE9DNbiAoFlfCsh76VsyAK9au4oSm0af4EAJLR6rE55xDd+L4Zs7swQ2pE
	 94aACEBaUCa4xtN3J8NrzKgv2R/lJxM9gsmAVLKfnGLtcc4f/8Q0urDrhEsxEW6FtYWDD
	 3ybNUitQlBTZ+c+48Mvb4FPGPo7vkPVZsPWa2/jh7LdYEvFWkO8oVYRgaWezxterWvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=w0iUd6Uae7/9DsYoCpyTzPmzaHpxV8RPjMLG//AJIZk=;
	b=kwRyfDq2WXURxCKJyn5ouePmpazduzWte+DK2bw9tKburKemoT5KCTaj/6RwQkHmMcJ3
	 pAkxhuNNcvKT8huwQ4Ucl+V10J5B8iJNy+ruMUyGM4ChRQ3+4DKPR/Ik0lB228wWYjO9+
	 XiKxrAlLyzUm9yrJ6b1wWI9pzmFc2kgYFzBT3glG7B5M+R1wwGVqvRciYq6m1XVYgiSwh
	 9lk6iFPaGwTS4CfNM9MCrAnuCmgKVIpk07Wi0HnHf+K+2Vc7n21X23gH4+lsQjHbuDcvU
	 XnPW9sV1CX52bWKyiJkYH8+3/4EJneiDk7y55LQtKGGHV08yQQT41an45Z+kVbtTZBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbHZgpz4;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FDB606A320
	for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 18:50:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63FDB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gbHZgpz4
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-498f5fa5103so2967f8f.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Nov 2026 10:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795114236; x=1795719036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w0iUd6Uae7/9DsYoCpyTzPmzaHpxV8RPjMLG//AJIZk=;
        b=gbHZgpz4vVJ//vKAAUuZDXlJrfKwfiVjk6fUGe+eh7tJD4Y/e3f5+7CvDC8fx7x/Tu
         eav+eJdbHMIz5AexBAcy9CuyiuCH3cXssH2NWyPa7dH9EtqgvGCYzdWREK457Fk928VI
         GTyXCcvn/A2hO6+tgiCtvGqtEBTV32+E2hmolNj3/O1fl0mUlTwDHNSJMi7h+GLCfBU1
         sm5JwAheUZLBq4ChdUxhBeULwI+yXm1pQSH7mWD8anFcB+m8pR6/1f6ifAylXfw8/xvl
         wY5x3RkExpZi1xwzhmvmTMnq28e+jZDrzJDyujFP42Eym9kYdGKR+I7vpBuwGO7OxNaM
         KyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114236; x=1795719036;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w0iUd6Uae7/9DsYoCpyTzPmzaHpxV8RPjMLG//AJIZk=;
        b=UElPW7USuyDzTuzf4lfsxY+wBk8n4Y9KLXQ2HSgHdnz+6uxZMLk151Ye1ETxv5ZOMt
         8HlZ57DBwC5R9SpJ1rMcF0uTi/OgRLNuqDNr3pcRUcmTbPA30gX43sTciW26KPB0+CpC
         qp6/K8RxnCnkCwunqSQk28RdTc/1YC1mm4qfrKSIehfW2m+AiaPOtryZtbxrKqBd5L/U
         1uSzSS8dEm5ATBT0cJVnIiSjFqnqpo9WSSClnQW5kMWT+XoOTeCfKOhzhkuWDsBsRhCI
         ZARS6vfLdZjYkOwjmVoHWvNkoLNcJjTOg3NhdcS37bj6omfroBsTVOHHoW/bEjU1Se+d
         gwFQ==
X-Forwarded-Encrypted: i=1; AL+hErGy1DB7I0I6ul0q7Z+2bmbH/v6POpEU6Qtz/s/1VLHePioDd9aseJqSMt3Ma9ZIo4m+rJL/cyc+tFtvN29h54OyaQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9MIJBhouZl9vaabNCu6zOqUxlk5+zEWj2HPXHEb0C5rntPoUnd
	NLdlsI3BUfvQ/RiW3BlMq0rFopQRcINgt/YuNPJnwnuJC+CHeUKxthTK
X-Gm-Gg: AZFdTZdxWmSBYwuAPwKmkpZbSVrJ9y0qvizVA3SeK7WQe/trTIbOoEEaW+IkPFsDZuL
	2cnxcYBQFDxkqT3wbs1+p41/ZLOTgPVJNYsBKzme4GmaTZLgTbvJNTQpJ+Bg4mb9Y6cwrL3mJNP
	BdibTIyG5n97tduf7RUW67zNi78/lh6j68+cE1dbRff+MVKdGXbia52Dfs9BCqyqlYfxIpxN7w+
	gq4aIw+7uz57oppOB0yRH/GA6EJb+jod2XScU9CgiyIBMrQVRAjzfzPdphBGBml8YkFjk8N7up6
	G6TVdiI+bowcN0oC449YkPyZOjMX//Z23u48xkIQCaTaPWR9Ah3mRvtCcP9WtvL1OrvAxAOM4lC
	80aBhvAXtz19wLP7FbL7kbyGtDNCVPJtcYRBQ3Vtfc4yuegk1IfEqXvzGTDX5M69rALwHYtHn7A
	4dj09Q0uC8+/J/iNGSX38/BtxHkMPZC6H2Z2srqDHAK3af1lHfaA35AwJxkFT0Qk9AgOuibv/Yq
	WZlAiUCyps+WPj7ktAHx6SGTW2LUpeeESOue0jPmXz1kOc1CvFjbFfTZYVeOqrBxh0K/SlHL+SQ
	lMMj/h1PXq3FbawPJrO5Wl+zYEsxOCQlqMapGsZghBeej++kNU199Q15nacB4n/nzPkRLroLmf9
	orwJL9M1kvIewpKMEAGxqWUidK/duXv9djhjullKvHaQm4k/SolTbiI7YCKlS80kjd/gxz0V/cH
	Xfb2ITcqxQKYZQWyg1jklnxxthzzw=
X-Received: by 2002:a05:6000:46cb:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-4abb42ea14emr442175f8f.24.1795114235494;
        Thu, 19 Nov 2026 10:50:35 -0800 (PST)
Received: from iku.example.org ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm1147674f8f.47.2026.11.19.10.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:50:35 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next] net: stmmac: Advertise TX checksum offload only when supported
Date: Thu, 19 Nov 2026 18:50:16 +0000
Message-ID: <20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
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

The driver unconditionally advertises TX checksum offload, even when
the hardware capability check disables it, such as when threshold DMA
mode is selected. This can cause DSA user ports to inherit checksum
offload through vlan_features despite the conduit not supporting it.

Advertise IPv4 and IPv6 TX checksum offload only when tx_coe is enabled.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4afe09d8fbe4..23d83b8376e2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8222,8 +8222,9 @@ static int __stmmac_dvr_probe(struct device *device,
 	ndev->xdp_metadata_ops = &stmmac_xdp_metadata_ops;
 	ndev->xsk_tx_metadata_ops = &stmmac_xsk_tx_metadata_ops;
 
-	ndev->hw_features = NETIF_F_SG | NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM |
-			    NETIF_F_RXCSUM;
+	ndev->hw_features = NETIF_F_SG | NETIF_F_RXCSUM;
+	if (priv->plat->tx_coe)
+		ndev->hw_features |= NETIF_F_IP_CSUM | NETIF_F_IPV6_CSUM;
 	ndev->xdp_features = NETDEV_XDP_ACT_BASIC | NETDEV_XDP_ACT_REDIRECT |
 			     NETDEV_XDP_ACT_XSK_ZEROCOPY;
 
-- 
2.56.1

