Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D024756CA;
	Fri, 25 Sep 2026 12:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790340999; cv=none; b=IEhKM8pInENv7OzGuJ15xvvsqUyDiCUVEJ/3LYxKMTKDUFswKSuzoE1lQfIYoTLzxuHJbVNv+lU4bPkGkHGTKGaOPWWqlCiNyVHvrE9jdr9VDJxX/TgmlV8/fpMrdnZW6e15cbkusDgL9NFHsnNz6KgjNCZEwLlckJSy6+6zfLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790340999; c=relaxed/simple;
	bh=RJOdlPKD99zBCe3I0ZjY/0UikSSiho4vLgF9s3puGyc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XcLpZXw7jUZcqHbvEGgEOSdYQ6LTcg08z4caS6OHTwOitJYxvyLwASa4s22vNmvbOWU0+tPCVy7F8OcVUsuCtm2va8TZDvut8NDaGmpvwBTinzLbYFRxc9NsUQPTrtbsLnP34NnxwJGRSOfbbwKDAQSXC9jVNl2WnvNGUJSt4c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5g+IjHZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5g+IjHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 848FE1F000FF;
	Fri, 25 Sep 2026 12:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790340997;
	bh=RwUU21k3GvyLCLlNlBpF40VOj4ke82XJUNcezXwe8Kw=;
	h=From:Subject:Date:To:Cc;
	b=f5g+IjHZ58l9Edhe4jyEPSBAKH8KYmn8pOYgUkt6rR1tb31GOFIL4DJun5H9HB3Wl
	 CZPnAFfP/xyPkKqaRu1iGBSyk0lNkS0ItHEAkSLVOUwglq/OAQdvo3PmTOwrASofhp
	 WE3C32ODMQFrhLWKqXkWvatIb+qBXw5fP2IMMVP211KP/wv/4OZDreXKhoUFQYZ7dg
	 65MfoZmtqieBsQWxnw6B99B8AJ96IuJw2JiWMVTcuhxw/UowqV90ZzHJOO90s3omk/
	 aQgbScTdC7gYz38vccWrG5QO98J39D77VEc4XmFBWh3Tw0SXYDgdRAgS+4d/lDK8JV
	 sPpPPEkI4V4kQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/4] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H
 EVK
Date: Fri, 25 Sep 2026 14:56:31 +0200
Message-Id: <20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7ZhSKARX3MOwgHaAUSymg0RDu
 LuAB3D5kvffX0AoMAlcogUCzSw8+g30KQLb174jZLcxaKUzVWiNj3pgtMZgIE9SC7pJME9dmuu
 8NQUZ2KbPQC2/j+y1+rG8mhvZaW/tRs8yjeFz/M7x7v25mGNUaF2WWNeYWCVJeafgaTiPoYNqX
 dcvY96y+MsAAAA=
X-Change-ID: 20260922-mali-c55-renesas-dts-74d4727f59e5
To: Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Linus Walleij <linusw@kernel.org>
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

Linus Walleij (2):
      dt-bindings: media: renesas,r9a09g057-ivc: Describe additional interrupts
      dt-bindings: media: arm,mali-c55: Describe DMA line-tick interrupts

 .../devicetree/bindings/media/arm,mali-c55.yaml    | 11 ++++--
 .../bindings/media/renesas,r9a09g057-ivc.yaml      | 11 ++++--
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 41 ++++++++++++++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  8 +++++
 4 files changed, 67 insertions(+), 4 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260922-mali-c55-renesas-dts-74d4727f59e5

Best regards,
--  
Linus Walleij <linusw@kernel.org>

