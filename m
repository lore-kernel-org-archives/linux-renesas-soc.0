Return-Path: <devicetree-owner@vger.kernel.org>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Kevin Hilman <khilman@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 4/7] soc: renesas: Add r8a7791 SYSC PM Domain Binding Definitions
Date: Thu, 10 Mar 2016 08:58:12 +0200
Message-ID: <27503872.R73ke9ZNPh@avalon>
In-Reply-To: <1457551122-21838-5-git-send-email-geert+renesas@glider.be>
References: <1457551122-21838-1-git-send-email-geert+renesas@glider.be> <1457551122-21838-5-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

Thank you for the patch.

On Wednesday 09 March 2016 20:18:39 Geert Uytterhoeven wrote:
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - New.
> ---
>  include/dt-bindings/power/r8a7791-sysc.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 include/dt-bindings/power/r8a7791-sysc.h
> 
> diff --git a/include/dt-bindings/power/r8a7791-sysc.h
> b/include/dt-bindings/power/r8a7791-sysc.h new file mode 100644
> index 0000000000000000..791bcdc0df1c6c04
> --- /dev/null
> +++ b/include/dt-bindings/power/r8a7791-sysc.h
> @@ -0,0 +1,23 @@
> +/*
> + * Copyright (C) 2016 Glider bvba
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; version 2 of the License.
> + */
> +#ifndef __DT_BINDINGS_POWER_R8A7791_SYSC_H__
> +#define __DT_BINDINGS_POWER_R8A7791_SYSC_H__
> +
> +/*
> + * These power domain indices match the numbers of the interrupt bits
> + * representing the power areas in the various Interrupt Registers
> + * (e.g. SYSCISR, Interrupt Status Register)
> + */
> +
> +#define R8A7791_PD_CA15_CPU0		 0
> +#define R8A7791_PD_CA15_CPU1		 1
> +#define R8A7791_PD_CA15_SCU		12
> +#define R8A7791_PD_SH			16

The power domain is called SH-4A in the datasheet, how about naming it 
R8A7791_PD_SH_4A ?

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +#define R8A7791_PD_SGX			20
> +
> +#endif /* __DT_BINDINGS_POWER_R8A7791_SYSC_H__ */

-- 
Regards,

Laurent Pinchart

