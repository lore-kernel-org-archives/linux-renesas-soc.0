Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793883200;
	b=JQmiMczCmdOm50ipOto3NDnfaynN14U07oX6LoyyK6ZpyFVvI6zpZhI+Ynom/c4G5SsG
	 alCYf+kcP8ZeA/pR3yFgNd7gmOhMGi2eVSUSQx30aZj/O85WBEwuglGpsWXtyi2wcyv8k
	 EENjqP2poHQtjMS8YUA/IHVacLAxBlZhSO4ydhNBClaI1U5erNwomVKiv+W5PWz6+yitt
	 or7B9gvg2hhiAJTs1K59jAuswySkviTC3d4ar1EGXWJgmWMv3DlFB6T933aOloshGYNuz
	 sWflB8w7u5DzmptCopaEU4es2fvetU/ldSWizT3YvLpqG0f+mtCBJzs7gLzAb7r8Dlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883200;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=ge+IZ+K3GiHt52j+D/w/wqVjWUipnFwvhfRFO4tyqqI=;
	b=q6NwdvaYOsBXqMDqKCB1Mq6JY5JrkpTBS7qHIZng7Mf4wRFg9QlhR9oAuCfga0J6m60J
	 8KbJjoGUI6MUlfSu53KNn1w6A/XCSVOSHJL3qS70zB7/PcC+Fpcr6wrBxTm+XoNIbdR0A
	 +fJM2ebmbXAL7T6dVSRZEgv+CH1EIxWktVLONYgSXJV31frkosePObGuCt84RO7Ao5Gkj
	 NZLip2DGiz5UxAY58M8tC8gpWhxTq1VolAncHVIw2wBkkn2qBFe/khpenMAnNPU7tBV1/
	 EcTugfRQrGnYd6vwm9ZlFVdVYSRZ0ib9yIzmiNZY/4AJMp8pUCPh7KyigYT3WF0faOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tg1G7dJC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123FB606D82C;
	Thu,  5 Nov 2026 12:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Tg1G7dJC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C912A1F000C1;
	Thu,  5 Nov 2026 12:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793883199;
	bh=ge+IZ+K3GiHt52j+D/w/wqVjWUipnFwvhfRFO4tyqqI=;
	h=From:Subject:Date:To:Cc;
	b=Tg1G7dJC02ZJeKdicRAJvdVe5n1JGPNFZZ/bCJs88PfS8Kg1X4f/Da13Gxn8Ux2/p
	 /lgnc8sfPQOneA/PNEDKAIGLDdigURyhgUNbwFzJ/lvYWcSISawqD3ApDIMQYHEd2V
	 FcXF4xKQU3a34CtyHhQoWYOStHaVTwUXUin6qPbl8vnBPguLPsyaJK1GkbNpSeo3bU
	 bC8GDauGB2OrIErtuNlZpZYaaK2bDsxEFHa1h8yf7O6w3NFxnkkOISY9pTcK2R7uMy
	 2nYKR7nBjBitgyUdmm6PstwDrxH7ptr8eum9+IOObVWhUK89zV1obREDXhPFnGnzqf
	 yxFGW+OSiz+4g==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v6 0/6] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H
 EVK
Date: Thu, 05 Nov 2026 13:53:13 +0100
Message-Id: <20261105-mali-c55-renesas-dts-v6-0-7dff41bf7107@kernel.org>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4XP3UrEMBAF4FdZcm0kmfy1Xvkeixf5mexG11aSb
 lGWvrvJClIpxcsDZ77D3EjBnLCQp8ONZJxTSeNQg344EH+2wwlpCjUTYKBZD0Df7SVRrxTNOGC
 xhYapUCODNGCi6lGRevqRMabPO3t8+cnl6l7RT81qjXMq05i/7rszb71/JmZOGfVBCx+c4kyI5
 zfMA14ex3wibWOGtaJ2FKiK7qOBzkojLWwUsVa6HUVUBXw06IzU6NxGkb8KZ3zvI9k+kpwhdMx
 FCBtFrRQwO4qqiuLOOSl63Xv+R1mW5Rt6+8Ov4wEAAA==
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

A driver fix orders the bulk reset names so that the register and AXI
interface resets are asserted before the ISP core reset. Prabhakar
confirmed that this avoids the register-access hang across repeated
runtime-PM cycles on the RZ/V2H EVK, including with IVC enabled.

After these patches, and enabling the right Linux drivers, we get
this in the console:
mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0

This was done in order to enable booting mainline with mainline
device trees.

The patches were authored with the assistance of an LLM.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v6:
- Rebased on v7.4-rc1.
- Drop both RFC patches; fix reset assertion order using the bulk API.
- Specify hresetn, aresetn, vresetn order in the driver's reset array,
  asserting the ISP core reset last.
- Link to v5: https://patch.msgid.link/20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org

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

Linus Walleij (4):
      dt-bindings: media: renesas,r9a09g057-ivc: Describe additional interrupts
      dt-bindings: media: arm,mali-c55: Describe DMA line-tick interrupts
      dt-bindings: media: arm,mali-c55: Add power domain
      media: mali-c55: Assert the ISP core reset last

 .../devicetree/bindings/media/arm,mali-c55.yaml    | 27 ++++++++++++-
 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 22 +++++++++-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 47 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  8 ++++
 .../media/platform/arm/mali-c55/mali-c55-core.c    | 11 ++++-
 5 files changed, 109 insertions(+), 6 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260922-mali-c55-renesas-dts-74d4727f59e5

Best regards,
--  
Linus Walleij <linusw@kernel.org>

