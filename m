Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795803318;
	b=yU9HNxyFYuZAVdT84xViO/ATfoP84k79IXIX7XRP2CQcNzC8hXPvBDQgQ++KyuLEeQ2x
	 vmbG/+3pYAslOmc1xMK3qHpcm2IP6YDGGm3gh2EsnaLvTjowsVHT8hYtmPEZSf+l/9ChP
	 HxEzmcHKYQMg7nX8pIH4P+MQZyZer8Q4xSog+zHmHAHeLfVcsaFrpjHIe5C0NIx+taoi9
	 /UkpTmUBM3p8VRLNmFpEhC6SgiVaPh3Zz0+Topxez6XoLDlDnvW1t1u9Fe9bi5xs3sQAH
	 q+3QqhOcBqDD3vpdKrbc6N5MKxSzxx6y3V/swc5vUbeso6zWVcz6bN3mB5WJJrfCEvA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803318;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aOKDtIHYzpK8XOPw/UrOOGqNOS4Y9xScGsDn/f4z0/M=;
	b=QBcsHJ9FXjV0tuK8JN4IqkAqxzBCzZBdUnzeT3r0/0OXEQ16Mp4hmvHrvMHC1Wlu+GOZ
	 1NOr5dLJgmU27eI3HktRcdctaafDCP7SOz/bJCKQqbJx0ei2ApjeBlyHXJk/JYxPXNGAA
	 lh5es9ifzVWHeqJRw2wopBplt4Nq2L9mm2/bQ9PMFxRUM+v5WLu9yjrqJ7t3PYfr9Zp9m
	 w39h9eEc0x6XfdZ+W/8d3J6EkxsXtXEqyz+Iu7KzWa9OsVZ2oSFjxk6ETM+FC7VyxUyX1
	 EKdKBB50rYbYsSTC7ptu2Ga/gyCHirPnGHZl4QA7T42yKFy2BqQrlcM3rnLO6PxlBYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyZJl2tA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D914A606A32E;
	Fri, 27 Nov 2026 18:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hyZJl2tA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795803318;
	b=y0PaTxTHMdwLMRPPKaYmfp5i4vuh8+SC3vXVSswdm2KSOZG10479sYgG8gNzkQ7mTxS0
	 C0Y5D93SSm/fh3VXsY7tTkTdw4AT7YLJEOBZMVOf66ffOCJtSGxDE6wOrg61Ft+NrCK/c
	 /V9/DrhFBYzfcvQl83fV0H/vbpXTMM2rWTLn6JNcOA6Wkqffme/EIErYo6U8VSCBXDTrA
	 uInbATH1e14JDA0vS7knW3uhzGjf1D0cVInNtJIw32WWclEe/k7Nnk8B26CIJYsUBhUvo
	 GdB2COjA8782rKwDPkoxextsOgBLiPP074KXbwkWbMuxMRxb0HurMg72o6I9CXXUV4w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795803318;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=aOKDtIHYzpK8XOPw/UrOOGqNOS4Y9xScGsDn/f4z0/M=;
	b=ItcuYF80uG2B6WHmjoPS+v1PF5InOTBFylWKsWWAyzz2opNNHhF16VFuwCfQxAUFHWj9
	 oSwKxTeH7m3Rr+EQze9ptOj0n/CsiH1wkVvsRunWVaD38GFNeIBjq6MhcfnGzvPw4c7wu
	 PEucFaXrFNZ1SU8mmEaBgirJUJ59gOHSzk+49btSsqSxqrA7A3gMmNoqSfaWtUvF7XXYY
	 DBtUrAIYbrDipGSjsvqpxtR/xf0aTGHKAb0XdwMIVmbBG0ny9Hn6aB4EqMk1oirZjB/dU
	 83zXuSEQEm9mVc6xocReer5R9GA6V/99B7jokR6fMbd7t4aP9y55i5mI0y+HGC0Msww==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92AE21F0089A;
	Fri, 27 Nov 2026 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803318;
	bh=aOKDtIHYzpK8XOPw/UrOOGqNOS4Y9xScGsDn/f4z0/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=hyZJl2tAwfd+i8cxuJcYjg3wymWRbISudOeXEHBPLjrM1qwKjy6J0ZLgOXtHoHMv3
	 ZatTtP+xYoJwQsHRlU9KjVJ+8Mm8tmpcQ16anQ8xEsRoYyHfM4k67IfVdxIlKeRaZY
	 uh65LKQt/lobodoDRtr5cPWEbPBbdFOFeMKDbdtkI6FZ6yiI8GezDkFHp5R2L5Jicq
	 KBu2akuz1SM6+tbFpjrwDXMZTH10SRbEJe/PuVCtcog4GcFPGE3INahh/++tCXD99k
	 olOEpH9V9nZsEFJDAndAPDe08E/zSn7rNs9WMa9GU1ZOgHei5hLj6EsKAZ/f+0i/RQ
	 C0RY6d3y7r5/w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1F5234DD0F;
	Fri, 27 Nov 2026 18:15:13 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Fri, 27 Nov 2026 10:14:26 -0800
Subject: [PATCH net-next 2/3] net: pcs: rzn1-miic: Add resets to rzn1 info
 structure
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
Message-Id: <20261127-miic-reset-consumer-v1-2-3cab78b94e23@reliablecontrols.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795803312; l=1138;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=uXvzq8K1GwLVz4Zm+S7fkSbqGDz/YK8RnVr/EC7Kg6U=;
 b=kNKbvDURtTq1KRp0oPvz4GzQEeASaROscy29X1xlqRhEdZ+WVYus7OUUY3RN56EdHdrg9vo38
 vpgOMdue0ZNBPQt2hR6G3bylzCrRrqGX5Bd+a/DzRsMDf8ZQzDDSkcm
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

Update the rzn1 info structure to include the resets that the driver needs
to deassert

Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
 drivers/net/pcs/pcs-rzn1-miic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 682a73cf5a87..3c4eca8960bd 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -128,6 +128,11 @@ static const char * const index_to_string[] = {
 	"CONV5",
 };
 
+static const char * const rzn1_reset_ids[] = {
+	"rst_ts",
+	"rst_miic",
+};
+
 static struct modctrl_match rzt2h_modctrl_match_table[] = {
 	{0x0, {ETHSS_GMAC0_PORT, ETHSS_ETHSW_PORT0, ETHSS_ETHSW_PORT1,
 	       ETHSS_ETHSW_PORT2, ETHSS_GMAC1_PORT}},
@@ -855,6 +860,8 @@ static struct miic_of_data rzn1_miic_of_data = {
 	.miic_port_start = 1,
 	.miic_port_last = 5,
 	.sw_mode_mask = GENMASK(4, 0),
+	.reset_ids = rzn1_reset_ids,
+	.reset_count = ARRAY_SIZE(rzn1_reset_ids),
 	.init_unlock_lock_regs = true,
 	.miic_write = miic_reg_writel_unlocked,
 	.type = MIIC_TYPE_RZN1,

-- 
2.53.0


