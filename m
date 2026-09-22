Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B7F559CA5;
	Tue, 22 Sep 2026 13:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084049; cv=none; b=bQXnit98zhZMKkJFRmVECF2hDXqAP7iCNhNYwIaskA2NpAUhK3v24clSbg0bHeQuGl+76TxmJzqBH7Nd4GBsyXZ59nAeflzox/UQFTQwFapb6bEtv0FwqA5v43jaqCUid4Oi2NAdeS3CaBJNA8Gpl+VPLsRbVI9qDdt1X90u+NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084049; c=relaxed/simple;
	bh=ai0Toy+WU8sdOoThCuvp2c8Zpuwn253dNDp24dziflY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NDpT898ncDRz0fotnwU9isXQytaM9FU5A/HIkOfmR0zyV0/98MOFS3aPl+1Xp0owS5CWTv51Askwr9LUBtlz6B1PlJdly+ETGSW/yKiuBgiazeED3tA8uLyHnA7x3Aihy5KIkyzyRvkXTknebfCEGSqAfwtBbQsQHcPJWW5NLgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNWe5axZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNWe5axZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E62C1F008A2;
	Tue, 22 Sep 2026 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790084046;
	bh=B+uHXpSZG46rBURy5ACalMl5LLiXGZH/jrnw58pSYEw=;
	h=From:Subject:Date:To:Cc;
	b=XNWe5axZK3PN+gJ0x3zlwYD+ZBL5Y+unloQ/5Z35Fbhwiyxle7f073O+LaIVIuYXe
	 yHIRda0w3FPEpJRjjMYKcyOSZRgquMSp3jIodPI8Ps+LTrID1Kz5JgP2mJy2H43hJj
	 7XK04ow/x7Zf5K9Msy/tLFErKaXD99CA041MY11P+mNWknJKprIssP0oBfES6HAb9Z
	 /81zTYxh5/jXE/h+62sp+KPOMoC3KV22u24ubKQ4ekGH+tYbFYm9aNLFslGiVn5cHA
	 KORAI3j8pCBfsKTqtGRp7iqR3BD5YemCeyaSCd4pttd9oD6Dl7VKinnRghFMNZIV9s
	 I15TYpI0xK5mQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H EVK
Date: Tue, 22 Sep 2026 15:33:59 +0200
Message-Id: <20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBG4auUWTtQh8ZQryIuYvJXRzRKppVC6
 d0bdfkt3lvIUBRGx2ahgo+avnLFftdQvIV8BWuqJmnl0PYi/AwP5egcF2RYME6jse9S58UProe
 jmr4LBp1/29P5b5sud8Tx+6J13QDlpfSzeAAAAA==
X-Change-ID: 20260922-mali-c55-renesas-dts-74d4727f59e5
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
 Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect their video
endpoints, and enable both blocks on the RZ/V2H EVK.

After these patches, and enabling the right Linux drivers, we get
this in the console:
mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0

This was done in order to enable booting mainline with mainline
device trees.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Daniel Scally (2):
      arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP and IVC nodes

 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 52 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  8 ++++
 2 files changed, 60 insertions(+)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260922-mali-c55-renesas-dts-74d4727f59e5

Best regards,
--  
Linus Walleij <linusw@kernel.org>

