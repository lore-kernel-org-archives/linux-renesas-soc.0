Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6A33262B;
	Mon, 12 Oct 2026 11:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791806190; cv=none; b=u8JmBRdLi/mPIe8pYCNoToKkeRE/chZpYrsF6qqqF4ahI/skWbLUg5AkR2b71uxeeRxVCoEKiD8OuFbOfkuHfODeKei81cuyXsd5ccLu3Di+NWs9MLGZhB8pz/VhsEbXIfqcsgEixC4eW4corEh8UQGvUkmGhRmmsDLjqx4vAVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791806190; c=relaxed/simple;
	bh=zSCPQB27psGP/j4AT24rouHwMrDJK97jxuJP1rVdz2A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DD0WT/Xb1ZTfsQGX3OosecVj9l31/kXNYW7lr+WJaD2GFc4b9RarvZlwZFSiHvELf2XYWIj1zsAS5bSAaUaWZrJzlHtdMbs2OTnxdJfqfI9CWuB02bN11vIE3OUzi7QCKXzDobmIs4C2Ohyl+9kWwLJ59Bhijiv7pfSIv/0licY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i3s2iQcQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i3s2iQcQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE871F0089C;
	Mon, 12 Oct 2026 11:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791806188;
	bh=AnW2m65M44wQcLxliLkvKtQrb3sozst0u8XPfhd5pFA=;
	h=From:Subject:Date:To:Cc;
	b=i3s2iQcQi5NCIWzAEjZqRLIvnINxEzBfVjRBMYVaZrW4NeRGr8pxVoOVRGB1nCzsQ
	 8T4ChDaK1jZK1/zg3wyDE8qMI7cVSZ9VeuAXXIJZRjuiVhSQ0savDalJRzhr+cu5dv
	 t+94+CqffWkU8UQ8FpGeg/dhJ/2El8mF7La5nUEEfD/75uAVYuvNsffXuqJBXaMdoA
	 6PzMZ4+AtudoiLKzin5W6TCYfpiHjS4kEuONpVVx3hXlmbzhS8SPKaI6Slwxp41MhN
	 suBk5fMtpT0c8IR3nYxP4E+hRw5k+rlMDQE+MHNSAS2HKS68Hkirh/3fAen/bN8TU0
	 7DY0sDgYZeDSw==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v4 0/5] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H
 EVK
Date: Mon, 12 Oct 2026 13:56:22 +0200
Message-Id: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XNTQ6CMBQE4KuQrq2B15aCK+9hXPTngVUE0yLRE
 O5uwQ3GGJeTzHwzkoDeYSC7ZCQeBxdc18bANwkxJ9XWSJ2NmUAKeVoC0KtqHDVCUI8tBhWo7QO
 V3HIJshIlChKnN4+Veyzs4fjO4a7PaPrZmhsnF/rOP5ffIZt7fy6GjKbU2JwZq0WWMra/oG+x2
 Xa+JvPHAGtF/FAgKnlZSSgUl1zBl8LWSvFDYVEBU0nUkueo9YcyTdMLsq5KR1cBAAA=
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

After these patches, and enabling the right Linux drivers, we get
this in the console:
mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0

This was done in order to enable booting mainline with mainline
device trees.

Assisted-by: LLM
Signed-off-by: Linus Walleij <linusw@kernel.org>
---
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

Linus Walleij (3):
      dt-bindings: media: renesas,r9a09g057-ivc: Describe additional interrupts
      dt-bindings: media: arm,mali-c55: Describe DMA line-tick interrupts
      dt-bindings: media: arm,mali-c55: Add power domain

 .../devicetree/bindings/media/arm,mali-c55.yaml    | 27 ++++++++++++-
 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 22 +++++++++-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 47 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  8 ++++
 4 files changed, 100 insertions(+), 4 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260922-mali-c55-renesas-dts-74d4727f59e5

Best regards,
--  
Linus Walleij <linusw@kernel.org>

