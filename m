Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793117489;
	b=IKy5m5fMnQxm154zbd/giXD5F8sG5eEIfu5VbsL69IH6g83KYPsX3VHTA+w+Q2RbR8c6
	 EaOnnkERz0IoSA2/u7KWDjcmnZcPbISzIiBfyP5b/sH4tD2DYp3hmPAHd0KXMJdVE7Kbd
	 J9zTVv98WpsUH+4Rl/gr9X/oF4JSjNxtkBH1EaLixthxdgzizrDAij4ALXs6LINe/VwjJ
	 T2le8nKVF4RNSklYjXRx4lYKL2/74Dw+pMkMAGSRLZd0pFO7oj+97Wvb4mOeN7uUHD+5Q
	 A23NqtqSeqixj1QwNZqhoFdwQSt/Nd+FCeVX/qtScANr5M8Tq5MWWuPvayNbEwt27JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793117489;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=D1rdsulDw7RWj1Ih/pNXLSB+0U2zWU4Psnbf9sp2cLk=;
	b=rkXXnxyzwbUBRTZdZSbDMEdabxv1n3F+9awLfcR3J+wduKQiznsyYb+hZzcpH0PD9wN4
	 jHuxkHxZOxxOY2ON/7tU8gaMwYmHZvEkdSEvCWv9cafFQVWO2eSZhAG0gPAILd2bs+jJv
	 nq/Yyx9Fjo3TihpPzVdKbd7GyOyEUv405DmRtbJvL3mbefVO8kd6o0QUpHwRN1KqbPRvF
	 eNAbEWi+pR68bEcIfjc2fyMiyUYl2whMSmKzvWBVtToeEBI5MRY6gPK+JzM85slzFls55
	 JJL7ifgoUoy0bHYMjR0dsbg5GaD7rlZrVcx8WuaZf7ZyuQv1hpR56w/cAPrHSOiyrUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nom5AtKA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB940606A31E;
	Tue, 27 Oct 2026 16:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nom5AtKA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 897E41F01828;
	Tue, 27 Oct 2026 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793117488;
	bh=D1rdsulDw7RWj1Ih/pNXLSB+0U2zWU4Psnbf9sp2cLk=;
	h=From:Subject:Date:To:Cc;
	b=nom5AtKA4ozXB6mQnpt9Hd+HDiB/WgtelIj2WEqoKRSZsTvgCCY8ipXH4CxncNHOI
	 fc8z904CFETzH+v3wqex1xqXWYkHeVp28MWpf2aSlrSCzMkzWSX5Ae5GONKBEJR6rC
	 Ql/Pi5turRrec/D0lSbLlp8OzQc94vf83jgucj52pYfbL7YigHvhfxRQQdVQe2GiqM
	 +WCReKHyFqDuImoI3wlhShC7FfbW/xTgxWNg85LSQ2RLq8w3MMA/qI2FMSk+tXPJX7
	 VxLNS9Lzg5Y4W4mAXA0UN9yrJ+cSafniiq8Kip01eVJFVX3STIt9qmImiglpJvXbOX
	 PifJOMjsBGfJg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 0/7] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H
 EVK
Date: Tue, 27 Oct 2026 17:11:22 +0100
Message-Id: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XP3YrCMBAF4FeRXG+WZJI0rVf7HuJFfiaaXW2Xp
 BZF+u4mLogiZS8PnPkOcyUZU8RM1qsrSTjFHIe+BPWxIm5v+h3S6EsmwKBhHQA9mkOkTimasMd
 sMvVjplp6qUEH1aEi5fQ3YYjnO7vZ/uV8st/oxmrVxj7mcUiX++7Ea++fiYlTRp1vhPNWcSbE1
 w+mHg+fQ9qRujHBs6IWFChK0wUNrZFaGnhTxLPSLiiiKOCCRqtlg9a+KfKhcMaXPpL1I8kZQst
 sAP+izPN8A8KOUZidAQAA
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: b4 0.16.0

Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect their
video endpoints, and enable both blocks on the RZ/V2H EVK.

Two additional RFC patches replace bulk clock and reset operations in
the Mali-C55 driver with explicit sequences using named handles. They
reproduce the driver call orders from the reporters' working DT swap
while keeping the clock and reset assignments unchanged.

The Device Tree does *not* guarantee any sequencing of resources,
so these sequences must be handled in code.

Clocks are enabled hclk, aclk, vclk and disabled in reverse order.
Resets are deasserted vresetn, aresetn, hresetn and asserted in reverse
order. These are driver-only experiments: the CPG power domain can
enable clocks in DT order before the callback, and IVC may already hold
shared resources active. The physical transition order is not guaranteed.
These RFC patches have not been tested on hardware.

After these patches, and enabling the right Linux drivers, we get
this in the console:
mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0

This was done in order to enable booting mainline with mainline
device trees.

The patches were authored with the assistance of an LLM.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v5:
- Add two RFC driver patches for explicit clock and reset sequencing.
- Match the call order from the reported DT swap using named handles.
- Link to v4: https://patch.msgid.link/20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org

Changes in v4:
- Provide interrupt names in both bindings, their examples and SoC nodes.
- Use Renesas RZ/V2H interrupt numbers in the binding examples.
- Link to v3: https://patch.msgid.link/20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org

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

Linus Walleij (5):
      dt-bindings: media: renesas,r9a09g057-ivc: Describe additional interrupts
      dt-bindings: media: arm,mali-c55: Describe DMA line-tick interrupts
      dt-bindings: media: arm,mali-c55: Add power domain
      [RFC] media: mali-c55: Sequence clocks explicitly
      [RFC] media: mali-c55: Sequence resets explicitly

 .../devicetree/bindings/media/arm,mali-c55.yaml    |  27 +++-
 .../bindings/media/renesas,r9a09g057-ivc.yaml      |  22 +++-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  47 +++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   8 ++
 .../media/platform/arm/mali-c55/mali-c55-common.h  |  11 +-
 .../media/platform/arm/mali-c55/mali-c55-core.c    | 136 +++++++++++++++------
 6 files changed, 205 insertions(+), 46 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260922-mali-c55-renesas-dts-74d4727f59e5

Best regards,
--  
Linus Walleij <linusw@kernel.org>

