Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795803326;
	b=KaOT9/80KuwVmv4HmrIRPJMzqm5APsBap3Q6nnWNdFi3/U7NrjbGFvcdmmD1An2ZZjri
	 7S4oQ2dLbhE9U9pRsWCv/q6c2NgruXOb0g8L9Wa+V2vtoN77ZbG2+WGUr+XbUNRvKa19b
	 zdXJCRspAkMUANorhjI8byGJLrA5BrCUYAb1ZvhNSSCYl8+FvegoWTHYDKEL/0FwE28yK
	 eTFj0jvEJphLvgjttNNQQlhgRs2bQFCpIYPFhUNE2/ty9822ATYD5os8xCyt+/FBtMYUb
	 /trFUXIIfo8RvA1sGWJx7782rkG/eFvARNeQKtNDt3dNhp2MWneL0kD85rlDPTRCFOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803326;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=47ronz9/gcsD9bz5yzNQgEXoqsksImANIoSU7oiUS90=;
	b=ojPv7eo1T/fKqA+bSWRX2T955394fU4jU/6XO8awhHEWoDsPhqbrPhSgVV/sCHNKMnTh
	 c+6hxQmtTvYeC9Lbc2oncvrTbm+mkt8dvP4leRzg/1+BnSGMPJEZ2itYrkivkRVf/nO5j
	 LtXSIsGUrFbCmhqE1OM6Yqkz+VQSr1BEPUjjuWg4tmXrz3QM0FvpNWsi9YGfTLmI2NAIg
	 TwjD+KLByx3ug4k/hahKGOC0Evb89Nfc7iX5DvzCPpPu63bKLsUqoe8wUPFqMKju7fgNF
	 IwXazSawII6tWlrDsm6U4X4SLDtQLwtg6+qdba8VRM2U9zO16dvJmZxM7nM4qRewxHw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eh8gPpt0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A40F4606A324;
	Fri, 27 Nov 2026 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eh8gPpt0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795803326;
	b=PZGygl+pOZulIwOFZGuX1pYo+gN2nGlt+aZJp8DLrTcKxtC3EUUhQbZ3RZdygKE68JLm
	 Xqxg3kFXmb0wRDNFJicKwPciBdCQdQ3IoQNX0/XSq/HNERUu4sldic9xX0HS+p+ysLjwf
	 /vvpvs7RyfIEqi0isJ9+xuhW6WS5IgSSH2OWHG9ShJiALU9r2V1aeenRYQO+GAs+ZC8bM
	 3nreYKsakSPyq77YRcqqoyoxI6rTJZk6s+fCc3UmHq/NwYpbX88wmvBuo1I11iFH8TkQ5
	 zk0YXB7ys2hDQaup96Rke08IujGXa3VX3gLwprFIq8S/mVBPdfexQNZll26sQZOAbTg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795803326;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=47ronz9/gcsD9bz5yzNQgEXoqsksImANIoSU7oiUS90=;
	b=lQ1Sph9ptysoQiMJmzIFA4vuKzxvSrQEldjFQsiOjpTU3zXBZMf3vsnoCHQrFJfRw6bC
	 1mlTJheRHxJQWEwuxsusThLAJjbUod5cfwA/8fnoOKP90SAfj4UWRiwF95PreuRZVRg9K
	 2VEgXFXH8QYEWwrptYZOJ/N+zMCApDeRINunBuGeaIaHZNRlnyCRE1reMbR7rFBbeBwdW
	 95A0+U6u0A2aeulUHkh/9MArc8WmO5CtU1ejHSywojI8IMXj+yldxC6WUxKY8tFZ1vFzm
	 wa9pIsTCD4M1CqdZSkAq233hv7fPSFmlLsLv/g6EUl21vrzcWKyPIQvG7WnbSnMYtqQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4DB41F0089B;
	Fri, 27 Nov 2026 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803326;
	bh=47ronz9/gcsD9bz5yzNQgEXoqsksImANIoSU7oiUS90=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=eh8gPpt0/+wsmY0FNl6Aw2IaS8ON7CIxYGu+3kdPmtFs8JQNHtDOYD2g1+zwopREx
	 3I2lms91jhUOH6L8LX0lYJ7IoM8FB7KtzjUf7RaHCi/iNK6RKaZC5R9K+iU0yNDPgj
	 6hBUmXwa98pADvanIFHHv9jt29IXnDNxpQR1pKu9vLD73Unl9s3q05kS+wMqu7a85p
	 HKClcN9GwiQH0e6yrMH5MWfVrjsKDOZ4aVkClPhubCUjw+5j6oJHjuj3Ts6Z5JUlJr
	 y3mlyHi6gDX81eslQT+z5kqLMLV6z4QLvS1aCM/XuxpyEsNaZs0X/B+YGqhNEPJ2Vb
	 ioLcZbM0cfF6w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 407654DD13;
	Fri, 27 Nov 2026 18:15:13 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Date: Fri, 27 Nov 2026 10:14:27 -0800
Subject: [PATCH net-next 3/3] ARM: dts: renesas: r9a06g032: Add resets to
 mii converter
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
Message-Id: <20261127-miic-reset-consumer-v1-3-3cab78b94e23@reliablecontrols.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795803312; l=858;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=ZBaHSFr71t1pKyCTBE4kMOXQIuAsyn3xFeo5+Tn5MSI=;
 b=DHaRzMwkYulCSs08qZt/fJgZXEdTzttvlTd6v6hJbzmDjJihwrfQ3SOlCKVmCMEBALo7ZAPVf
 zTjlHzmSOmGAt1hpriWQXZo2qSie23LBP66CbbTpMovkoISBDpaBrBQ
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com
Content-Transfer-Encoding: 7bit

From: Kyle Hendry <khendry@reliablecontrols.com>

Add references to the resets in the system driver that the miic needs

Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 8645bab7ee23..12b8795797cd 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -462,6 +462,9 @@ eth_miic: eth-miic@44030000 {
 				 <&sysctrl R9A06G032_CLK_RMII_REF>,
 				 <&sysctrl R9A06G032_HCLK_SWITCH_RG>;
 			clock-names = "mii_ref", "rgmii_ref", "rmii_ref", "hclk";
+			resets = <&sysctrl R9A06G032_RST_TS>,
+				 <&sysctrl R9A06G032_RST_MIIC>;
+			reset-names = "rst_ts", "rst_miic";
 			power-domains = <&sysctrl>;
 			status = "disabled";
 

-- 
2.53.0


