Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4E14C1502;
	Mon, 19 Oct 2026 10:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792405390; cv=none; b=BZawT3wbbgJpIyWKJZMTXiNekr0QBGYAAjLWNSdophAOiYXLwdgxqEo8tdh1JUTD7SM2f2w90NLbm5VVBLUOzR72s+n1nehq7G+7RRQPe3dIa3Wt72sCZP4UNcQBkFX1Y/5gI7ehSL5eLoavsh7r26JUgN8ZrR6lMSOK0UQ5hCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792405390; c=relaxed/simple;
	bh=ELgmHtyUZK6LxZ9ZkLKbgrwvuThezsxfji8fEKzAf+E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oe5DQgGGYXDYwwxqS/5h4fQxCQT1Azshd1/EQz+tKc3GG/v0SyJqTYbaYqZ/YTdVnbqukzrqaIqHJPXwaAjs1i+koPY5kzaXFfRW3yVkwINTZ+aFcNxQuc9WsC8Q6vOpCDomIqP1ygQWr3UyF7y+iCf/XvDQrhftWCNznh8gS/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lOhO8DPz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lOhO8DPz"
Received: from ideasonboard.com (unknown [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCC5B56D;
	Mon, 19 Oct 2026 12:20:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792405259;
	bh=ELgmHtyUZK6LxZ9ZkLKbgrwvuThezsxfji8fEKzAf+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOhO8DPz95h3dpArngaTT90NUp108nwPFN5QsOnlDo8JHBOtjbyfFfsxebbx99NTB
	 J3wKXdY2yEKHsX9wcPDZeFRSfek51H/Wu12C/vn60tx2KTCc/EmY4wsc/3JUkv2rRL
	 arRK+qcLbYCEHXg/UEvFHCm7MbCZZ64Jij/IlWTs=
Date: Mon, 19 Oct 2026 12:23:01 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 4/5] arm64: dts: renesas: r9a09g057: Add IVC and ISP
 nodes
Message-ID: <atXol9eFjLKxgTpg@zed>
References: <20261012-mali-c55-renesas-dts-v4-0-c410e280bf2d@kernel.org>
 <20261012-mali-c55-renesas-dts-v4-4-c410e280bf2d@kernel.org>
 <asz8oEtow_lrUU7K@zed>
 <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLnnSLXeYzxonkfnZA3OxLE9Hssma9fHsL=U=NmVn7ZVOg@mail.gmail.com>

Hi Linus

On Thu, Oct 15, 2026 at 02:36:00PM +0200, Linus Walleij wrote:
> Hi Jacopo,
>
> On Mon, Oct 12, 2026 at 5:39 PM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
>
> > How was this patch tested ?
>
> I was using the TPG only so far, a camera module is in the mail.
>
> I do have the RPi camera module 3 but didn't get it to work, this
> may explain why...
>
> > > +             ivc: isp-input@16040000 {
> > > +                     compatible = "renesas,r9a09g057-ivc";
> > > +                     reg = <0 0x16040000 0 0x10000>;
> > > +                     clocks = <&cpg CPG_MOD 0xe3>, <&cpg CPG_MOD 0xe4>,
> > > +                              <&cpg CPG_MOD 0xe5>;
> >
> > Compared to Dan's original patch I was carrying my tree the first and
> > third ids of clock and reset properties in the ivc and isp nodes respectivelty
> > are swapped
>
> OK
>
> > -                       resets = <&cpg 0xd3>, <&cpg 0xd1>, <&cpg 0xd2>;
> > +                       resets = <&cpg 0xd2>, <&cpg 0xd1>, <&cpg 0xd3>;
> >                         reset-names = "vresetn", "aresetn", "hresetn";
> >                         status = "disabled";
> >
> > Fixes the issue for me
>
> OK
>
> > Why is this an issue it's not 100% clear to me.
>
> Can you try this?
>
> diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> --- a/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> +++ b/drivers/media/platform/arm/mali-c55/mali-c55-core.c
> @@ -703,6 +703,12 @@
>                 return ret;
>         }
>
> +       /*
> +        * Allow the ISP's 2500-vclk reset recovery time.
> +        * 200 us cover the RZ/V2H's documented minimum of 20 MHz.
> +        */
> +       usleep_range(200, 300);
> +
>         /* Use "software only" context management. */
>         mali_c55_update_bits(mali_c55, MALI_C55_REG_MCU_CONFIG,
>                              MALI_C55_REG_MCU_CONFIG_OVERRIDE_MASK, 0x01);
>
> When we now retrieve the reset and assert it, it matters that
> we give the hardware time to recover. (If this works I will make
> a separate patch.)

Unfortunately this doesn't help

>
> > I can't access the "additional documentation" from the Renesas website
> > where the clock/reset ids are reported. Could you please check ?
>

I mapped the dts entries to the clock/reset signals.

This is what is implemented by your patch:

* means the clock/reset is only handled by the IVC/ISP drivers
** means the clock/reset is handled by both the IVC/ISP drivers

(why the IVC has three entries as well, it's not 100% clear to me, but
this is unrelated)

ivc:
   clocks:
   - reg: e3 (227)  -> CGC_ISP_0_pclk         *
   - axi: e4 (228)  -> CGC_ISP_0_vin_aclk     **
   - isp: e5 (229)  -> CGC_ISP_0_isp_sclk     **

   resets:
   - reg: d4 (212)  -> ISP_0_PRESETN          *
   - axi: d1 (209)  -> ISP_0_REG_ARESETN      **
   - isp: d3 (211)  -> ISP_0_ISP_SRESETN      **

isp:
   clocks:
   - vclk e5  (229)  -> CGC_ISP_0_isp_sclk    **
   - aclk e4  (228)  -> CGC_ISP_0_vin_aclk    **
   - hclk e2  (226)  -> CGC_ISP_0_reg_aclk    *

   resets:
   - vresetn d3 (211) -> ISP_0_ISP_SRESETN    **
   - aresetn d1 (209) -> ISP_0_VIN_ARESETN    **
   - hresetn d2 (210) -> ISP_0_REG_ARESETN    *

As libcamera calls start_streaming on the IVC first the sequence in
which resets/clocks are bulk_enabled is:

* = number of time the clock/reset signal has been enabled:

        [IVC        ][ISP          ]
        [e3* e4* e5*][e5** e4** e2*]

        [IVC        ][ISP          ]
        [d4* d1* d3*][d3** d1** d2*]

This results in the following overall ordering

        e3: CGC_ISP_0_pclk
        e4: CGC_ISP_0_vin_aclk
        e5: CGC_ISP_0_isp_sclk
        e2: CGC_ISP_0_reg_aclk

        d4: ISP_0_PRESETN
        d1: ISP_0_REG_ARESETN
        d3: ISP_0_ISP_SRESETN
        d2: ISP_0_REG_ARESETN

Now, my proposed patch switches e5 with e2 and d3 with d2

        [IVC        ][ISP          ]
        [e3* e4* e5*][e2* e4** e5**]

        [IVC        ][ISP          ]
        [d4* d1* d3*][d2* d1** d3**]

What I don't get is why this should make any difference as the overall
ordering wouldn't change. When the IVC resumes the 0xe5 clock will
anyway be enabled before the 0xe2 one, regardless of the order in
which they are specified in the isp node.

        [IVC    ][ISP]
        e3 e4 e5  e2
        d4 d1 d3  d2

Unless I don't understand something about the enablement of
reset/clocks with multiple users...

Also the only indication I find on the V2H manual on the expected
enablment ordering is:

    All clocks should be turned on and off simultaneously.

Something the doesn't happen today. Maybe we're *very* lucky that
enabling e2 first in the ISP driver matches some window that is missed
by enabling it last, but this seems very very far fetched, isn't it ?

> These changes contradicts the manual so we can't change things
> like this unless we know more, it'd be too much trial-and-horror.
>
> The manual says:
>
> Video/ISP core
> 0xe5, isp_sclk
> 0xd3, isp_sresetn
>
> Register-interface bridge
> 0xe2, reg_aclk
> 0xd2, reg_aresetn

Do you maybe have any information on how the above signal maps to the
C55 clocks/reset and if there's any indication that might help better
understand the issue ?

>
> Yours,
> Linus Walleij
