Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795803324;
	b=m5vFeiJ28eaFf4e34kjUfo7pL62JszTs5hA0jNbD6L3MXpF6K3Le4VGl/RHQWAkrjmUQ
	 FKHfKesXfH3YIZTd47xWjlsE8q7iLTmXxuVe1KcuvrYd6CU077a/GFkjpntKw6GQuD/MN
	 3263aaI+q6T5iM+Zf1h9/c73UV2fE5xnWrOpETjwMiH68DqBWZZZSmPjEDH9uuedLbCAR
	 YGkvO05ZLWPXdRT/ilNlaPXaiMICw33FXvj707E+bYwyEsgrKCeG5WkeHyZqzHqCOPCQ4
	 LPcmzo4jMdsUOImw4+rln24RTgxVQ+H2m3vpa47xL2Wyc1J1mkTu66muptMJf0emN4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803324;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=Qs5P87Voj2KjrPx/vedKJAHbEdJ48LB6qEkkbs1MPS4=;
	b=GiPyPSFm36ZvNULjU2RxRHwyB3g6uylNol4pf8jUZ50LaAccy/Q+mtrc1lp4n9w2fRj0
	 ZCoLk4TmudsDdfAvNDtrKMSla1YIUn7aoTCn1ZyVYSV294YrdXPSxde7B0qHuMXR0QCcv
	 kXFPONSBtk1vbtnwHfVK/kUT3OI3KHTwdXHBbPKS+j45Zw6vmtw3uSu8/86qp+BeBatIn
	 Vo+eu+NpDZJ3eYgxgfn1lbBVSINBZkIkeDe2KnOrKcrVAhsZuByFzA0ILspNRRqLrLKsp
	 ZM0ianPxrOBApzjVYCD63nPTROLLCB4owpfgGAwWlLKts8+boliIE/wW8SOC05EZAmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gjkI4/jN";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0DF606A324;
	Fri, 27 Nov 2026 18:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gjkI4/jN
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795803324;
	b=pFJNxsE6vlDWhGVl97ZyBOrPa87iGGMdCKMOhVENKD4VcFg0dWtgjZICOnqDZz0jATln
	 zODqmjYBHfwmy9lKckS0vsGfGKcIEmfzesx5dihoA2hjxwDITCyeCSBg8sTGiVX4j0Dru
	 1fFPA7zYBIa8w7mFeiWRJpGlnAABqMYHS2EwDH3TvhaYO1VnhwMjGLnTnhwjBEdfU1k22
	 ggsoCgAZ9FZZ5WmQAZDfuqUCwVbUqZ9VWAc3i4YMFumsxhsPlv2CZrD/mQpkrqVL1MV6y
	 TOsWFgm7XzH2q3MBZWUwhb149xVOllgvgnOUxx3mjw5zG6eqCQtK9WchshmHIcpt0Qg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795803324;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=Qs5P87Voj2KjrPx/vedKJAHbEdJ48LB6qEkkbs1MPS4=;
	b=EBP7ot/GTwFzTrGttvTy15A9xalNg7dfAVlFUmK2qOjmuYAS00CP9RokSJYrF5+GdpOH
	 UY+4h3Fvid37RtnU9xABkdAxAMi4P9Yk9bGYIIXuJOmxHPXKhIdZtdbK+nj/EkrH832ZN
	 beMlcnTVsjLgdJuKVXq1Abb3rW8/qzsER148cGHA12x+m14GK1V+lK9M8obfbJaqvh1+2
	 x38KEHZizQkHg6dAxPiroqDfTKMzupCcs7Yw+vlBf5JDmdeF320S+k4VjFHKf5FgqvQRl
	 QxzWxj036bjAfJO7NkpisTv6tMENVKqxEt0ZiMEKdCn+2X4amk+bcT6iXW7mC4HHTkg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 324921F00897;
	Fri, 27 Nov 2026 18:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795803324;
	bh=Qs5P87Voj2KjrPx/vedKJAHbEdJ48LB6qEkkbs1MPS4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=gjkI4/jNSsuwWcSMZ2gOkDQG4UDO9+CUJSSFfmNOFe+d00HDXqF0ROzjjq3ppDz+Q
	 IAfIXVPMRw3WJ6N5GvNdJYWOF5j78JYchsWwgA6I57tcrMBqWgFvuwHczPiM4xZN6D
	 UTtMgGCUNqeIRQMThfbcKw/NgwIaKcwbOTNEqr5U9quBsZKbGH7TORDxpVS+CpBior
	 IhVlQZ8AEva2/qgUb93U/paq8wbxdNiY4E+LC1Lnb0ORaILWFssQQS36FQtA3AzlMG
	 WWfbsUEFRb/ESJOVUydgv+221PF/aph3Ru63EVBsLZ20JyMCvJIJTKe5cIZEGPmVh5
	 t1+DaO0pgFS7Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A34A14DD0B;
	Fri, 27 Nov 2026 18:15:12 +0000 (UTC)
From: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>
Subject: [PATCH net-next 0/3] net: pcs: rzn1-miic: Deassert resets on RZ/N1
Date: Fri, 27 Nov 2026 10:14:24 -0800
Message-Id: <20261127-miic-reset-consumer-v1-0-3cab78b94e23@reliablecontrols.com>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02OTQ6CMBCFr9LM2iadAqXlKsZFGQbtgqItGCLx7
 jbqguXL+/t2yJwCZ+jEDomfIYc5FoEnAXTz8coyDEWDVtogaiOnEEgmzrxImmNeJ04Sx6F2znF
 Ng4LSvCcew/ZdPUMsycjbApefk/ixlpvlb/c+c1maprB0QhD1FoeGK2x75VkTGUMeyWhLirxTr
 dN2dDUc+TrxpVO6lekV8YCYpa2UbbDxXpPqnjVc3u8PwvRDBfQAAAA=
X-Change-ID: 20261126-miic-reset-consumer-1fd4999e4cd0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795803312; l=1416;
 i=khendry@reliablecontrols.com; s=20260813; h=from:subject:message-id;
 bh=JO2AL8nQm/4CThDoEoEqZG8cMRX9Fw2AqtMC/yqXsaE=;
 b=9QNZSFuzxGcaVgPGdtuz7Jqdawua3j0FN29mZ/5bemR5zmJgDPve5gruqIZ9bapync18DkU6X
 hr4kXa/5ITVD66KdgVQuPNa+6l3o2l5Y/BaEWeV/Ok8TCyEra5TPdRZ
X-Developer-Key: i=khendry@reliablecontrols.com; a=ed25519;
 pk=gbK6oghz3qBlBiaGCsEzALLOtj5VklmsuolHQNhDV5M=
X-Endpoint-Received: by B4 Relay for khendry@reliablecontrols.com/20260813
 with auth_id=946
X-Original-From: Kyle Hendry <khendry@reliablecontrols.com>
Reply-To: khendry@reliablecontrols.com

Two resets are held at boot and need to be cleared for the mii converted
to work. They are in the system controller managed by the clock driver and
are supported by this series:
https://lore.kernel.org/linux-renesas-soc/20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com

Add the reset information to the rzn1 info structure and device tree so
the miic driver can clear the resets the same way the rz/t2h does.

Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>
---
Kyle Hendry (3):
      dt-bindings: net: pcs: renesas,rzn1-miic: Document rzn1 resets
      net: pcs: rzn1-miic: Add resets to rzn1 info structure
      ARM: dts: renesas: r9a06g032: Add resets to mii converter

 .../bindings/net/pcs/renesas,rzn1-miic.yaml        | 36 +++++++++++++++-------
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  3 ++
 drivers/net/pcs/pcs-rzn1-miic.c                    |  7 +++++
 3 files changed, 35 insertions(+), 11 deletions(-)
---
base-commit: ccb81d5e317b0ae2cc66ca1c628c0ca907928f94
change-id: 20261126-miic-reset-consumer-1fd4999e4cd0
prerequisite-change-id: 20261027-rzn1-miic-resets-8308515aa2c0:v4
prerequisite-patch-id: be35edd6b8532456aa90c8b32fb7e1d7adbde798
prerequisite-patch-id: 077c1ad53beb244026822f9591c1808527f852db
prerequisite-patch-id: b56a4d7c0efa9bb17aa898bdc619733f30f9097c

Best regards,
-- 
Kyle Hendry <khendry@reliablecontrols.com>


