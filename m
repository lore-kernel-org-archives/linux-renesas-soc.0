Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEBC3C5DD4;
	Mon, 28 Sep 2026 12:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598117; cv=none; b=QChRMw72An8VTnMrL6pdvmeSmeTdWWWAMA0rmJzm8O36RoEc0MiMPbNdtenfkKR29lYCOEsrkAH6Za01RXimCzlkiUeMg/VDfh/u5NqNXghL/YqYRNvMUxYU/sWYEeS2zYk10Ou06iFr7U/ET2A1WmYQZiwkXwVeMwZy4EmhzrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598117; c=relaxed/simple;
	bh=KZItNTdX8NQtHbADSM1BT9zXePaN3sOIUQDC+3Yua6U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=difdgTpj+VMjh5mcZg5OFLXDbuNknNZJfZkEwBCLmfRHQSa0I0h6EbZZsbQtHnJfwBlmD9kgPYB7XYcj2mmw1eNNKcJ0GMoAbac9Y401IoWpn9RgLugWRGwTPk0FwVEHJv7LyE0AgfD73hq2LOv44vvGQd1Lsc7UonLo23QOOoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EIWqck5p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EIWqck5p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68371F000FF;
	Mon, 28 Sep 2026 12:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598114;
	bh=dQSSxDoUuWwKJ5+sJZf7yKzcmls88alEZ1yxQyhiNDk=;
	h=From:Subject:Date:To:Cc;
	b=EIWqck5pA59MuuDSCUnUXJBfF25+N89Pw5rXTM4vTHHzSGtKU/uEdNN5k+fQMVrm4
	 9xcWjKFuKtc25wbElE334ZLkNpC0r3TfOz31+Tl8z9Lefu8/quN3IlVgLNivRSHwxv
	 S4UobDLqaQOuQQQwYc6L0pbYsz7XdHWBy1MXvPG+0bdMRpw1OQIbRHX4H1oMPOtWhX
	 oyJMwdJhlHkv3OdMmoQXcB5QDLGms2qZfKB1vMEqyOEBXhv0xB6y4jYa+RJ5uXn4TR
	 7igEsbwOdoWse2NXLlyHYGaiqsqVT2QmiDzVLbP7tHqmHPLhSlSPxSk1RlHKl5ljZb
	 SQx+n60BrvYVQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v3 0/5] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H
 EVK
Date: Mon, 28 Sep 2026 14:21:46 +0200
Message-Id: <20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNwQ6CMBAFf4X0bE1ZWiqe/A/jobQLVBFMF4mG8
 O8WvOjBeJzkvZmJEQaPxPbJxAKOnnzfRcg2CbON6Wrk3kVmICAXBQC/mtZzqxQP2CEZ4m4grqW
 TGnSlClQsXm8BK/9YtcfTm+lentEOi2tZNJ6GPjzX7pguuz+JMeWCW5dn1pUqFVl2uGDosN32o
 WZLY4RPi/phgWjJi0rDzkgtDXxZ5nl+AaKKdNwRAQAA
X-Change-ID: 20260922-mali-c55-renesas-dts-74d4727f59e5
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0

Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect their
video endpoints, and enable both blocks on the RZ/V2H EVK.

After these patches, and enabling the right Linux drivers, we get
this in the console:
mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0

This was done in order to enable booting mainline with mainline
device trees.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v3:
- Correct the ISP video and register clock/reset mappings by swapping
  vclk/hclk and vresetn/hresetn.
- Add an optional ISP power-domain binding and attach the RZ/V2H ISP
  to the CPG power domain.
- Link to v2: https://patch.msgid.link/20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org

Changes in v2:
- Add separate IVC and ISP binding patches describing the optional IVC
  frame-start/frame-stop completion and ISP DMA line-tick IRQs.
  Show all six IRQs in the examples using consecutive mock numbers.
- Add the IVC frame-start/stop and ISP DMA line-tick interrupt lines
  using the confirmed SPI assignments, addressing Geert's IRQ review.
- Correct the IVC and ISP register sizes to 64 KiB and 512 KiB,
  respectively, as requested by Geert. GPV_VIDEO0 is a separate bus
  interconnect region.
- Compact the clock and reset properties and remove blank lines between
  properties, following Geert's review.
- Link to v1: https://patch.msgid.link/20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org

---
Daniel Scally (2):
      arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP and IVC nodes

Linus Walleij (3):
      dt-bindings: media: renesas,r9a09g057-ivc: Describe additional interrupts
      dt-bindings: media: arm,mali-c55: Describe DMA line-tick interrupts
      dt-bindings: media: arm,mali-c55: Add power domain

 .../devicetree/bindings/media/arm,mali-c55.yaml    | 15 ++++++--
 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 11 ++++--
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 42 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  8 +++++
 4 files changed, 72 insertions(+), 4 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260922-mali-c55-renesas-dts-74d4727f59e5

Best regards,
--  
Linus Walleij <linusw@kernel.org>

