Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:38163 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750949AbdILVTn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Sep 2017 17:19:43 -0400
Received: by mail-lf0-f45.google.com with SMTP id q132so29543595lfe.5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Sep 2017 14:19:42 -0700 (PDT)
Subject: Re: [PATCH 10/11] arm64: dts: renesas: initial Eagle board device
 tree
To: Rob Herring <robh+dt@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
References: <20170912210543.810219167@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d6f9d5ef-4864-3ffb-9406-acd65bff10aa@cogentembedded.com>
Date: Wed, 13 Sep 2017 00:19:39 +0300
MIME-Version: 1.0
In-Reply-To: <20170912210543.810219167@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/12/2017 11:37 PM, Sergei Shtylyov wrote:

> Add the initial device  tree for  the R8A77970 SoC based Eagle board.
> The board has 1 debug serial port (SCIF0); include support for it,
> so that the serial console can work.
> 
> Based on the original (and large) patch by Vladimir Barinov
> <vladimir.barinov@cogentembedded.com>.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
[...]
> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> ===================================================================
> --- /dev/null
> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -0,0 +1,45 @@
[...]
> +&extal_clk {
> +	clock-frequency = <16666666>;
> +};
> +
> +&extalr_clk {
> +	clock-frequency = <32768>;
> +};
> +

    Forgot to specify SCIF_CLK -- it's populated.

> +&scif0 {
> +	status = "okay";
> +};

MBR, Sergei
