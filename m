Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:37018 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751872AbcIBIaa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 04:30:30 -0400
Date: Fri, 2 Sep 2016 10:19:25 +0200
From: Simon Horman <horms@verge.net.au>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 12/12] arm64: dts: h3ulcb: Sound SSI support
Message-ID: <20160902081925.GC16669@verge.net.au>
References: <1472637712-14583-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1472637850-15053-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <87d1knumv9.wl%kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87d1knumv9.wl%kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 02, 2016 at 01:19:49AM +0000, Kuninori Morimoto wrote:
> 
> Hi Vladimir
> 
> > This supports SSI sound for H3ULCB board.
> > SSI DMA mode used. CS2000 used as AUDIO_CLK_B.
> > 
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > ---
> 
> Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> > +	audio_clkout: audio_clkout {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <11289600>;
> > +	};
> 
> I think having commont for AUDIO_CLKOUT is better for user, like Salvator-X.
> This "audio_clkout" is dummy. Actually, we don't need this dummy clock,
> and we should use "<&rcar_sound 0>" as AUDIO_CLKOUT,
> like AUDIO_CLKOUT3 as "<&rcar_sound 3>" which is used on ak4613. 
> But Salvator-X and this ULCB board has very complex connection,
> especially around CS2000.
> This means cs2000 requests rcar_sound, and rcar_sound requests cs2000.
> This audio_clkout exist to avoid probe dead-lock.
> This is the reason why audio_clkout and rcar_sound::clock-frequency
> has same value.

Vladimir,

please address the above and include it when you repost the patches
that I haven't queued up.
