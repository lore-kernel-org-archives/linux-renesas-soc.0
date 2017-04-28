Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:35433 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1035855AbdD1MoT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Apr 2017 08:44:19 -0400
Received: by mail-lf0-f43.google.com with SMTP id 75so33197961lfs.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Apr 2017 05:44:18 -0700 (PDT)
Date: Fri, 28 Apr 2017 14:44:16 +0200
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/10] clk: renesas: Add r8a7792 CPG Core Clock
 Definitions
Message-ID: <20170428124416.GH1532@bigcity.dyn.berto.se>
References: <1493139200-27396-1-git-send-email-geert+renesas@glider.be>
 <1493139200-27396-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1493139200-27396-5-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On 2017-04-25 18:53:14 +0200, Geert Uytterhoeven wrote:
> Add all R-Car V2H Clock Pulse Generator Core Clock Outputs, as listed in
> Table 7.2c ("List of Clocks [R-Car V2H]") of the R-Car Gen2 Hardware
> User's Manual rev. 2.00.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  include/dt-bindings/clock/r8a7792-cpg-mssr.h | 43 ++++++++++++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 include/dt-bindings/clock/r8a7792-cpg-mssr.h
> 
> diff --git a/include/dt-bindings/clock/r8a7792-cpg-mssr.h b/include/dt-bindings/clock/r8a7792-cpg-mssr.h
> new file mode 100644
> index 0000000000000000..72ce85cb2f94b0ab
> --- /dev/null
> +++ b/include/dt-bindings/clock/r8a7792-cpg-mssr.h
> @@ -0,0 +1,43 @@
> +/*
> + * Copyright (C) 2015 Renesas Electronics Corp.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_R8A7792_CPG_MSSR_H__
> +#define __DT_BINDINGS_CLOCK_R8A7792_CPG_MSSR_H__
> +
> +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> +
> +/* r8a7792 CPG Core Clocks */
> +#define R8A7792_CLK_Z			0
> +#define R8A7792_CLK_ZG			1
> +#define R8A7792_CLK_ZTR			2
> +#define R8A7792_CLK_ZTRD2		3
> +#define R8A7792_CLK_ZT			4
> +#define R8A7792_CLK_ZX			5
> +#define R8A7792_CLK_ZS			6
> +#define R8A7792_CLK_HP			7
> +#define R8A7792_CLK_I			8
> +#define R8A7792_CLK_B			9
> +#define R8A7792_CLK_LB			10
> +#define R8A7792_CLK_P			11
> +#define R8A7792_CLK_CL			12
> +#define R8A7792_CLK_M2			13
> +#define R8A7792_CLK_IMP			14
> +#define R8A7792_CLK_ZB3			15
> +#define R8A7792_CLK_ZB3D2		16
> +#define R8A7792_CLK_DDR			17
> +#define R8A7792_CLK_SD			18
> +#define R8A7792_CLK_MP			19
> +#define R8A7792_CLK_QSPI		20
> +#define R8A7792_CLK_CP			21
> +#define R8A7792_CLK_CPEX		22
> +#define R8A7792_CLK_RCAN		23
> +#define R8A7792_CLK_R			24
> +#define R8A7792_CLK_OSC			25

The last two are called RCLK and OSCCLK in the Table 7.2c ("List of 
Clocks [R-Car V2H]"). I'm sure this is intentional on your side, and if 
so:

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> +
> +#endif /* __DT_BINDINGS_CLOCK_R8A7792_CPG_MSSR_H__ */
> -- 
> 2.7.4
> 

-- 
Regards,
Niklas S�derlund
