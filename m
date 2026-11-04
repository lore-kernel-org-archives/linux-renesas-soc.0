Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798907;
	b=zO5PoJGPfNVud3Y2lBMcS4XbOWaq2e3n5AFGXlBCujevzg8i9Fi8sGZUYOG/kF6Nv97v
	 xAHxa2Q1S6EmmGFBhFnnpMwDt8DVFCnHgWpVHfjS7H0zx5Qrsw8DGBpYM6M8RzAXxJyyQ
	 gbfhJOlgzxKSQA20mr0K81vPIA2aCKIX85BF+DzBna0mSv/N2qcfOFmvYZhzW8GTvXbod
	 yCwLrqGiBJ7WmEouhhm7OJVWUmxNECr6YEH1v1+/UY3QxMYU5HEvxsgJzFmOTNhxw//6U
	 rmYgONo/FGcW9DxozipXRHphK/r1qFpiunGUzIi69RRjhYj7rHQv8ORLdB/vo/cgKSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798907;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8i8Gt1iQa78D7XvWjNqKDdpDP87VjZn0P4Fq7WSVPeY=;
	b=fdtYX7U5vuYDv7Bjk+Q59Tpdo5yOnCVnMA2dg+tUPkCSzM3e1QFZo8NMWomUQ7zH5Nb2
	 1KuuTU7AmymFGoRdnLFBt/dBSIJrcKz29t4xt4O7hWIP/FV/KtXIHfvayfYz1MmhpQMtW
	 e1UjLE1as4VgKVp1x/4ShqdisZ0wwTFUBgprVMFjPd6xj59guTEZTbptkcuTACgNQo5Ge
	 Ow+trJSBYFtlWe/FOONS/p7BvFZ0pF4cTIhq2KjVVYCi+UfPozORiizTMIhHwc0m3NvYe
	 zEW9tHMIWlmLYuXg8kLgk3hpDBppRGsdTcPKJm+V6540a8e4rP26xFXFZ8/qMOmj+xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=p2Ohc52d;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E83606A31B;
	Wed,  4 Nov 2026 13:28:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49E83606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=p2Ohc52d
Received: from [192.168.33.24] (185.221.143.99.nat.pool.zt.hu [185.221.143.99])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFDD8BE;
	Wed,  4 Nov 2026 14:26:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793798766;
	bh=nle8zh40simosNCAgBe8q75lC3RldexvgyWriSXG2RM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=p2Ohc52dt0m80OL1Gr9OJC3EQquraG8Rh4/BuTvyYdVE+BO1STm47R76Ryx1VcRWD
	 xNdnX2vJIOWtYOX6wFe/EIgGvB2Zh3bt/lMhNi/PALWo6QXTAzzP4VxWNR2tpDi5Wy
	 8Cg0ok+sboE7PX5EqcV5IICX+zVUePYBNXIIzjEQ=
Message-ID: <a4923238-e911-4da1-939e-f888d8d0a01d@ideasonboard.com>
Date: Wed, 4 Nov 2026 14:28:19 +0100
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Post: <mailto:linux-renesas-soc@vger.kernel.org>
List-Help: <mailto:linux-renesas-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-renesas-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/7] arm64: dts: renesas: Enable ISP and IVC on RZ/V2H
 EVK
To: Linus Walleij <linusw@kernel.org>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Conor Dooley
 <conor.dooley@microchip.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
From: =?UTF-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>
Content-Language: en-US, hu-HU
In-Reply-To: <20261027-mali-c55-renesas-dts-v5-0-51bbb43969c1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

2026. 10. 27. 17:11 keltezéssel, Linus Walleij írta:
> Describe the optional ISP DMA line-tick and IVC frame-start/frame-stop
> interrupts. Add the RZ/V2H(P) IVC and Arm Mali-C55 ISP nodes, connect their
> video endpoints, and enable both blocks on the RZ/V2H EVK.
> 
> Two additional RFC patches replace bulk clock and reset operations in
> the Mali-C55 driver with explicit sequences using named handles. They
> reproduce the driver call orders from the reporters' working DT swap
> while keeping the clock and reset assignments unchanged.
> 
> The Device Tree does *not* guarantee any sequencing of resources,
> so these sequences must be handled in code.
> 
> Clocks are enabled hclk, aclk, vclk and disabled in reverse order.
> Resets are deasserted vresetn, aresetn, hresetn and asserted in reverse
> order. These are driver-only experiments: the CPG power domain can
> enable clocks in DT order before the callback, and IVC may already hold
> shared resources active. The physical transition order is not guaranteed.
> These RFC patches have not been tested on hardware.
> 
> After these patches, and enabling the right Linux drivers, we get
> this in the console:
> mali-c55 16080000.isp: Detected Mali-C55 ISP 9000043.31032022.0
> 
> This was done in order to enable booting mainline with mainline
> device trees.
> 
> The patches were authored with the assistance of an LLM.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Changes in v5:
> - Add two RFC driver patches for explicit clock and reset sequencing.

I also had the same problem as reported in https://lore.kernel.org/all/asz8oEtow_lrUU7K@zed/.
So with the first 5 changes, the device will lock up when trying to stream:

   [  124.093148] watchdog: CPU0: Watchdog detected hard LOCKUP on cpu 1

but with all 7, it appears to function. And I have also tested without patch 6
(clock ordering), and things appear to function as well.

My understanding of the problem is as follows: previously I have used a device tree
that specified

   resets = <&cpg 0xd2>, <&cpg 0xd1>, <&cpg 0xd3>;
   reset-names = "vresetn", "aresetn", "hresetn";

while the order in the driver is:

   vresetn
   aresetn
   hresetn

and given that the bulk reset api asserts in order and deasserts in reverse order,
this would be

   assert: 0xd2 -> 0xd1 -> 0xd3
   deassert: 0xd3 -> 0xd1 -> 0xd2

whereas this patch series has the order

   resets = <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
   reset-names = "vresetn", "aresetn", "hresetn";

so the ordering is as follows

   assert: 0xd3 -> 0xd1 -> 0xd2
   deassert: 0xd2 -> 0xd1 -> 0xd3

meaning that the order is effectively reversed compared to the working configuration.

However, by sequencing them in the driver, the ordering is:

   assert: hresetn -> aresetn -> vresetn
           0xd2    -> 0xd1    -> 0xd3
   deassert: vresetn -> aresetn -> hresetn
             0xd3    -> 0xd1    -> 0xd2

which restores the working order.

Given that `reset_control_bulk_{de,}assert()` very clearly document the order
of operations. I would also be in favor of simply reordering `mali_c55_reset_names`,
as suggested in https://lore.kernel.org/linux-media/CA+V-a8vEub2y2gvXp8jkjVHOGuj1Eqkbq75t8Nezz95iidtL3Q@mail.gmail.com/#t


Regards,
Barnabás Pőcze

> - Match the call order from the reported DT swap using named handles.
> - Link to v4: https://patch.msgid.link/20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org
> 
> Changes in v4:
> - Provide interrupt names in both bindings, their examples and SoC nodes.
> - Use Renesas RZ/V2H interrupt numbers in the binding examples.
> - Link to v3: https://patch.msgid.link/20260928-mali-c55-renesas-dts-v3-0-2cf7eb746ebb@kernel.org
> 
> Changes in v3:
> - Correct the ISP video and register clock/reset mappings by swapping
>    vclk/hclk and vresetn/hresetn.
> - Add an optional ISP power-domain binding and attach the RZ/V2H ISP
>    to the CPG power domain.
> - Link to v2: https://patch.msgid.link/20260925-mali-c55-renesas-dts-v2-0-69f728a474a2@kernel.org
> 
> Changes in v2:
> - Add separate IVC and ISP binding patches describing the optional IVC
>    frame-start/frame-stop completion and ISP DMA line-tick IRQs.
>    Show all six IRQs in the examples using consecutive mock numbers.
> - Add the IVC frame-start/stop and ISP DMA line-tick interrupt lines
>    using the confirmed SPI assignments, addressing Geert's IRQ review.
> - Correct the IVC and ISP register sizes to 64 KiB and 512 KiB,
>    respectively, as requested by Geert. GPV_VIDEO0 is a separate bus
>    interconnect region.
> - Compact the clock and reset properties and remove blank lines between
>    properties, following Geert's review.
> - Link to v1: https://patch.msgid.link/20260922-mali-c55-renesas-dts-v1-0-cd63cdb51033@kernel.org
> 
> ---
> Daniel Scally (2):
>        arm64: dts: renesas: r9a09g057: Add IVC and ISP nodes
>        arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add ISP and IVC nodes
> 
> Linus Walleij (5):
>        dt-bindings: media: renesas,r9a09g057-ivc: Describe additional interrupts
>        dt-bindings: media: arm,mali-c55: Describe DMA line-tick interrupts
>        dt-bindings: media: arm,mali-c55: Add power domain
>        [RFC] media: mali-c55: Sequence clocks explicitly
>        [RFC] media: mali-c55: Sequence resets explicitly
> 
>   .../devicetree/bindings/media/arm,mali-c55.yaml    |  27 +++-
>   .../bindings/media/renesas,r9a09g057-ivc.yaml      |  22 +++-
>   arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  47 +++++++
>   .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   8 ++
>   .../media/platform/arm/mali-c55/mali-c55-common.h  |  11 +-
>   .../media/platform/arm/mali-c55/mali-c55-core.c    | 136 +++++++++++++++------
>   6 files changed, 205 insertions(+), 46 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20260922-mali-c55-renesas-dts-74d4727f59e5
> 
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>

