Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843189;
	b=WroxG7MnPpnm2ZJx3wV09kpz1GZ8SYfCMU98MD7MJwYxVaQD/CsGTv0hsNjgzsOgwPEr
	 N25IEaSmHONDDR0tQRh1AfYqvKheiTKR61ylsu/gLCiHX6XvPBtcpENfhQbwPUkafv1g6
	 Q3y4f//ICyymUtgf+cmeYH8K46RFlmjxgs5vXRgHN9kCWY52YLc6ibASXvrO9KxMszAxg
	 1sKn9QhsnsBor+nScd7ZjXNOUB7bjM+lZ4CJcyDyQnrSGKz61atMYm+3ce9pRZ+wiO8Ow
	 dkCEmbjgTtpCJ99FRu6JlUVFvov+DSW13GyzU7ZDJ24MDBxoauIEtFywACRdUq+Ar1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843189;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=StVqFurT/wQrRDKjt1hr+U29vy1fhAKDYGXtf7ZTQNQ=;
	b=F3x2K8lfFiL3nC8sXE9Mx6kgqixkxp/XzRTd7k+J7bNYcFhFBwl8SGFueIlNVzg4cIi5
	 53qrMWLE6TNhiaNW/hKMSSHQUJ0t13L/i71i7nu997HYoKbUvJx13TVG2pz7uKZ8yaj8t
	 /wSQb0EWFRO+8J7MM0rVi+0l3OKP2s0uPkuj5Jhi6kaC4pHFyJmVmGrp5Z+xBA9YNEoMY
	 YWqRSp8rVlr2CMWiSyC+X9WWXj3zL5nyTPu456Xnr0v03G+VzCBVfeYHOE3p4dNhQo0pz
	 5fAZj9Ej35YD0iiYeHRwsKMeaFkgmfaTcNy0umg+58eGONKWAqUdmSR7+v2QWnTbj2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=joM6uKyo;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F07606A333
	for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 15:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F07606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=joM6uKyo
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so38099935e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Nov 2026 07:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794843187; x=1795447987; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=StVqFurT/wQrRDKjt1hr+U29vy1fhAKDYGXtf7ZTQNQ=;
        b=joM6uKyouT8sPrX51vhCW9/0H0T//6PvlGhtPq11U+ncfMyXfcPZRyS9D842iZpDqu
         puYYGhCu+LjC1pJxdlYrnh5hD6JMJanBaL+ErfSsnqbUktBgNlmDokWPw9KR0bu4w4sY
         Wd28TjVzQeF+QM37PPAkiSE0NdfV9A0V92eIxhEPJ0MehBei/UCQXVgfT1GmTaD6cAVr
         Gt5fEEmOsVNVG9k/osNDJjKh2k1M8WmF559w1YA/OeJpcf6IDv03uA+SxPoE7zTdC/ed
         bFAG4x0LaK0KkJ6be7x710jwrzNJLoVCzdjIuSCmWdxweFfxmS6Z0JcOAsSlf1E1U4Hs
         kWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843187; x=1795447987;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=StVqFurT/wQrRDKjt1hr+U29vy1fhAKDYGXtf7ZTQNQ=;
        b=v9pY84QhTDvS34BCrJti4M1TaKEKyJyW4dD/YJT16U9PpMHqL2xxHY+stsaIQnLG++
         1aMUP1Euz+TBRUpMl0lP29Abf+S13L5fkLmnhJYf4W65e0VyJXO//S69agKJ6CR7iAiZ
         rC1UH2jVKmRQKvmBnMWdpm+VNtjoHnzOEEot8hISt1/YROGEEGSGq9cL8k5e+k1BFZ94
         BpteA3RlHmqleL9OphsQj5Qm0LTfLANnz9vOswcgWLgHyoi7Dym9R/fP+vuj5zxHWfXv
         PO2/W80J8WCzajCp9gmnUxo+sAz5yo289NekyXHACJSh3YchDWhcitDuD4VcwflDZoXf
         KFSQ==
X-Gm-Message-State: APuU4Z8KBovsIrpP8F4F4R/KvuKP5fZs9uWC4wE+W7vjJeHAiqGmPWsz
	DvCeWL59tv0CT0JLVMG1ZFoaem+buSaaq5DcwfoKp91uQbX/MSTyt+BF
X-Gm-Gg: AYBFou1G8MhSiqnevCKiI1OQ6vd2IO6/PxAtqbns++27Qt10cEW9iYLl8O1RnbCIhGZ
	nBgxAIuytmlfSwHCBVUP7LD1bSOvMwe95WTwwoPgc9HpiXCz3rewcrnNdqjnIpXaZ4uvPwT+OAM
	etbR6PtxK3myU5maR3Q+kI/DUB2+riBcx3k4PcSfYcPtYDhGnqqrEFrZ0XH9fYhMbsdjl46F+pY
	uswc/7TKtra4WiVD0GNuwzBd21WKRIJx5jNEqsDD+iE5o9vkHkZ2HKrgeuqKtf41JOyq7OeW1Wl
	U/i4VyvmFCkUPpDOdJNrdQ2SK2SZRTqJkJO9sUten82cMQA/GcBlIxy/56hIB6vEKBtBeCuIvfA
	XCMWwznmUPqIgohKV3nwiaZSfqGwnJjLK8II+J4LWNzkfoIYkHld1gLtBRKFlxXpJZKeWCjxIsj
	HrylM51VlDWJdOp8YTG66PAgL74lxQaRKDfKcc3WjXSsBUV2rKtECUoeMfEys1K9J1JKuObIW7L
	tiANy79vCMpeuXpQlJIWxL/oPuVu2UUuv5xfpwJJb7ksebi/YV47wpU+o/ZAssIIsnBHkk801aO
	KX0sCzF/uq56x5qvYncJ08sNj4zR2q2WKIRNPaZT4nIhGW5Q6cixqM+9+z0BNp7Gag==
X-Received: by 2002:a05:600c:4691:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb5e8c13e4mr203665575e9.7.1794843187061;
        Mon, 16 Nov 2026 07:33:07 -0800 (PST)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6889:eb24:5e57:83b1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ae5299sm315407665e9.11.2026.11.16.07.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:33:06 -0800 (PST)
From: Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 0/2] Enable Renesas RZ/G3L CANFD
Date: Mon, 16 Nov 2026 15:33:04 +0000
Message-Id: <20261116-canfd_rzg3l-v2-0-89e06c46f40b@bp.renesas.com>
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
X-B4-Tracking: v=1; b=H4sIADAi+2oC/23MSwrCMBSF4a2UOzYliZqiI/chRfK4aQOalFwJa
 snejR07/A+cbwXCHJDg3K2QsQQKKbaQuw7srOOELLjWILlUQgjFrI7e3fJn2t+Z515ZrQ5aOw/
 tsWT04bVp17H1HOiZ8nvDi/yt/50iGWd8MEc04sQH7y5m6TNGJE29TQ8Ya61f0ETkUqsAAAA=
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794843186; l=1116;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=1E9jtcPKoXKYQWT8BUmqPghEaqnxjRl4UbnqpWuP5OQ=;
 b=rCN7b4yqOJoXWhXuPRSc93S6eqjMojRN6j1QL7sMvLhQtRLpIOzJGCU9jJnyzGmS2UMqPTJV0
 sK1sIeFfukYAI6m0hjVG6qMxoxNfdWeFi8wuaVhjmvWsAPBCOKCmiaB
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

This patch series enables CANFD channels{0,1} on RZ/G3L SMARC EVK.

This patch series depend upon [1]
[1] https://lore.kernel.org/all/20261112-sdhi_rzg3l-v1-0-ca30b209615d@bp.renesas.com/

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Dropped fallback compatible based on bindings.
 * Retained the tag as the change is trivial.
 * Reverted the order of the SW_DPI_EN and SW_SD2_EN, to match the
   signal flow order.
 * Added missing check for !SW_DPI_EN in standby-gpios.
- Link v1: https://lore.kernel.org/all/20260921131951.187981-1-biju.das.jz@bp.renesas.com

---
Biju Das (2):
      arm64: dts: renesas: r9a08g046: Add CANFD node
      arm64: dts: renesas: r9a08g046l48-smarc: Enable CANFD

 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 43 +++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 46 ++++++++++++++++++++++
 2 files changed, 88 insertions(+), 1 deletion(-)
---
base-commit: 52f785639824bf2386d20ad8735f9792b81d818f
change-id: 20261116-canfd_rzg3l-f0f6ca64aadf

Best regards,
-- 
Biju Das <biju.das.jz@bp.renesas.com>

