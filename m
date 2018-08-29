Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:37091 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726857AbeH2Eqo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 00:46:44 -0400
Date: Tue, 28 Aug 2018 19:52:28 -0500
From: Rob Herring <robh@kernel.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms+renesas@verge.net.au>
Subject: Re: [PATCH v2] clk: renesas: cpg-mssr: Add R7S9210 support
Message-ID: <20180829005228.GA5407@bogus>
References: <20180827162139.76196-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180827162139.76196-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Aug 27, 2018 at 11:21:39AM -0500, Chris Brandt wrote:
> Add support for the R7S9210 (RZ/A2) Clock Pulse Generator and Module
> Standby.
> 
> The Module Standby HW in the RZ/A series is very close to R-Car HW, except
> for how the registers are laid out.
> The MSTP registers are only 8-bits wide, there is no status registers
> (MSTPST), and the register offsets are a little different. Since the RZ/A
> hardware manuals refer to these registers as the Standby Control Registers,
> we'll use that name to distinguish the RZ/A type for the R-Car type.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---

> +++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
> @@ -0,0 +1,192 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*


> +++ b/include/dt-bindings/clock/r7s9210-cpg-mssr.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0+

The proper identifier is GPL-2.0-or-later
