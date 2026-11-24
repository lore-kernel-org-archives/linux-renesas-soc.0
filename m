Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526897;
	b=LiTrkUNgfgccTmIQKEshqMbgg5rTpD639zDtQ4SQM+UaIr7YcdOSTFqbAIjlPG9AZnWI
	 6xeIh7baCaUE0GHPgtyqmGvUfPe74OMfpwY6lLk85/sVt7PGm4+oSabCjsdZ1MFrdmkDH
	 vq4WVyHCKc/2ojZiTVi0uGehmmYGeeMJ7CEW1BnIB0nlB8z9aNJcw/ZT5aKG03vViTWK5
	 Ld6v3f2ZlrVGQ/6HLjk5tvbbKApyhTt1ep0pRAkCvglL1XXXLWXl4ZGGia7cnJXGQoesc
	 7AqCV7a2Vr0dqQfK2TZjgDdcHzc9Qp3kVPWyiQRgflUhRcHNHPKh7kXJ89LP/fQoSCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526897;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JT2uC7qMkTRa47GGYeiS4hj8nXfSMLBZRiQ/uyjcVpY=;
	b=cW5NW2X64Q2YHsBSQ9wG15I/AzCsZr2lSfGhLQk/Wm0TMWS9MOH2VwbRjIj4iM1Un/2j
	 9Wn3/b+eGLqnM36Fd3Sf7uXNDw1fgB1e71bJoNl8ZxxEKjQGF384t2OConqlBxX1CivYv
	 CDOOCA1bkuE6BMlsXbPTOuiqGBj1OElXP0X2WMxNWpcH0YTvaWSvEKfBSjHokEF9klXDz
	 F1ynytXQjZOyXkBCELyHuVi3NR7ttyP8yAlHRXPhTOod6XY1oPtmD/dOTDKQTTV2mnfyi
	 ylZkc9UvcejJEF3E0G7iiVj45JyNqyzpq2TaYdLIjrHGS4Yy4/DIPLme12Q3PfSPNhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVeZZl2N;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF6606A31E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 13:28:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3AF6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVeZZl2N
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so2910800f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 24 Nov 2026 05:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795526895; x=1796131695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JT2uC7qMkTRa47GGYeiS4hj8nXfSMLBZRiQ/uyjcVpY=;
        b=lVeZZl2NwyUaG2U7IBIaU9daivsWdX/Xdy/lVTivmmkemufLwiDtPMJFjo9CRqGBbb
         +sGwCL+zWTWiu6T7oyqnwyz65V8xyifG3uzbXk/Sxbl9cN97DsCZLXXAferAXaqkChSf
         6nKc+GAbPdtoQMBDpr1qzRy9ikMlkbnbGmyxpXtPr/4Ew+25ay/jHgsUYzxccdMQGj3Q
         vxm6e4/NWQtN7Pzc8QL6uIAfmpCOZ//Y5bLv//IVUdJt36VaYJ8h8+y0GLd8L46ul3Ys
         7q/JU7lOYOnhizjYGOfkUxWe19W5U0zav+SA2nI8/Vbo+oCfvLvrU3CqysNbT5o9jif0
         umiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526895; x=1796131695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JT2uC7qMkTRa47GGYeiS4hj8nXfSMLBZRiQ/uyjcVpY=;
        b=UcXz/Jn2JV3Y3BTUgL/yYvdCP2Vch/FN+HBqLreQLF8lvnlDYXZp+ZXsW1VeXUZ3cA
         9SaX+asL8ANUfH3k/hWXyP58wgGJVC9LauMKvUZXwuXFZgJ1lD0nx2xczCaH+2hNdyz2
         MAPDgGTewRaqTh/MJHubTVPUtSgg5XbKp9J9v2ro7Alqm3jrGqFzrQ8eLtpazzx+dfFF
         TjGplST6Hh8ehBK7G8JQPnBGlhXqr19CjVosqJZofKewjRkMp7vfboQxTDlt9mcvyrhL
         erg4XcQN3t8JzXch0hfZ4ipsjvNeqUedMy6aUnhrpfLHlLg4ZalxffpVJ0kEtnbh4Tlz
         DAXA==
X-Forwarded-Encrypted: i=1; AL+hErFHMyhQQUkdaiTTTdbiBZtlFk0rbJjCLWIWHNrdG0n+MOaxQSj5dzMuUXkHTfqYZSFTu3L/39TD/p9nrdsfzdbbPw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+R2SJBJQ5JVAxJx3B4KqF3Vwq+SqYPnJWkhmoCIp8RekBMmlsJ
	GOF+7LD0sVYm2uvIcj6UV/1IBIaBZ9mqkBmOSm9q6/aDDnQI1p4EnAvj
X-Gm-Gg: AZFdTZd8wzLQj97paQkP9zMimGdG5+rNo1L6EC9wDDt+rhaZ3hwxHHmlsYnWSBZNfiW
	0UE34o2Hqm9eld4M2QqinjeyZZFho6aJQXP/3OCdrnYauxJeTnNXl3tXSSOMRKn/qe3NCc82SaP
	omldNoLdCoJZde/qw4gszpBqw+XxkD2xTui+tLSzdXTo30O4/IjK2peFxDRRynPPKxUeax6yDi4
	pIG0tgpZMCuvjc71B1V3AOaXUfQ8vgnCLw3TrqJlblpXH8nw7TKiwXNXjyQmfIxwhmiGPhHZKis
	aC13Vvz6u5HG5lbQcPGbqRieTtqMdxH2rlLQwN+0oNk8/vPlDnqIqTcyuXcPc54YYxEUeVZLKx9
	FID/KveWIckNwsSPvtOR0xZeOtmHeMsjUKVzMrX0POW7k23Qb4TBsShfXgUI8VNCJGdUYjllhOj
	st7Xg00bMxMx/ldKZ7SETsO0Z11Z1kPp9EZRg6ZV0tFTRYw2cCcVKibzV0bLzXcCmBqHLNYAgO/
	22z29r8GzXrZ0qxIqUs3qptWZi385oo1s6sEidPmq5u1TGwuiYIrLKA2YiyDWxs0DcWf8Eswkml
	vlITCNPyhjj2Kqc3GkRaUBBj3rd3PO7Lv5VDHZD0A0lY8sTN1/nE255vRC8RoSYCZ3Elb8X5TBu
	ARE+tYEqLg95Y0VzZKosh4lJSPLErKXVDFDWmKyAXOgLgScZgUO8lcINFEIcntUzN27+U+Lcu
X-Received: by 2002:a05:6000:4b1e:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-4abb0f3c23bmr28439351f8f.12.1795526895084;
        Tue, 24 Nov 2026 05:28:15 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:99e:712b:4aa0:53aa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm29256157f8f.8.2026.11.24.05.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:28:14 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Corinna Vinschen <vinschen@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net v2] net: stmmac: Advertise TX checksum offload only when supported
Date: Tue, 24 Nov 2026 13:28:02 +0000
Message-ID: <20261124132802.2003605-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

stmmac unconditionally adds IPv4 and IPv6 TX checksum offload to
hw_features and copies the resulting features to vlan_features. When
tx_coe is false, for example in threshold DMA mode on hardware with a
capability register, stmmac_fix_features() removes the flags from the
active features at registration, but vlan_features retains them.

DSA user ports inherit vlan_features and can therefore advertise TX
checksum offload even though the conduit cannot perform it.

Only add NETIF_F_IP_CSUM and NETIF_F_IPV6_CSUM to hw_features when
tx_coe is enabled. This prevents the unsupported features from being
propagated to DSA user ports and reports them as fixed off on the
conduit.

The issue was discovered while using stmmac as the DSA CPU port on
RZ/T2H and RZ/N2H EVKs. The fix was tested with ethtool on the switch
ports of both EVKs.

Fixes: 6b2c6e4a938f ("net: stmmac: propagate feature flags to vlan")
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2:
  - Added fixes tag
  - Updated commit message
  - Targetted the patch to net instead of net-next
v1: https://lore.kernel.org/all/20261119185016.1789843-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index a685ce4638f61..d32d3e7b1b8c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -8147,8 +8147,9 @@ static int __stmmac_dvr_probe(struct device *device,
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

