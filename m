Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:35383 "EHLO
	mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751085AbcFFTDM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 6 Jun 2016 15:03:12 -0400
Received: by mail-lf0-f47.google.com with SMTP id j198so280605lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jun 2016 12:03:11 -0700 (PDT)
Subject: Re: [PATCH v2 10/11] ARM: dts: blanche: initial device tree
To: horms@verge.net.au, linux-renesas-soc@vger.kernel.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	devicetree@vger.kernel.org
References: <3446154.oZ24315zaL@wasted.cogentembedded.com>
 <13571934.l66Gg7Cpm9@wasted.cogentembedded.com>
Cc: magnus.damm@gmail.com, linux@arm.linux.org.uk,
	linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4fe5c4ec-11a0-7e8a-cad1-91c0c30702df@cogentembedded.com>
Date: Mon, 6 Jun 2016 22:03:07 +0300
MIME-Version: 1.0
In-Reply-To: <13571934.l66Gg7Cpm9@wasted.cogentembedded.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/04/2016 12:35 AM, Sergei Shtylyov wrote:

> Add the initial device  tree for the R8A7792 SoC based Blanche board.
> The board has 2 debug serial ports: SCIF0 and SCIF3; include support for
> them,  so that  the serial console  can  work.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

[...]
> Index: renesas/arch/arm/boot/dts/r8a7792-blanche.dts
> ===================================================================
> --- /dev/null
> +++ renesas/arch/arm/boot/dts/r8a7792-blanche.dts
> @@ -0,0 +1,44 @@
> +/*
> + * Device Tree Source for the Blanche board
> + *
> + * Copyright (C) 2016 Cogent Embedded, Inc.

    Looks like I need to add the Renesas Electronics copyright here. Pleae 
hold one merging this patch as well.

MBR, Sergei
