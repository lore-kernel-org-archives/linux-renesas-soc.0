Return-Path: <SRS0=APCG=RB=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D986AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 10:08:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 78C952173C
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 26 Feb 2019 10:08:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="As/SFm8R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728123AbfBZKIc (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 26 Feb 2019 05:08:32 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34023 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727053AbfBZKIb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Feb 2019 05:08:31 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id EE97E25BE5E;
        Tue, 26 Feb 2019 21:08:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551175710; bh=OhQ55XBvz/ooihtIVs6wJwoGtefXctRaSKll8NQpmFo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=As/SFm8RlZJTy59ZArwrX7PfsV9zp9lUjA6fWkBxINGak9C0LqLz2NqNG3/me0ZG5
         +mQ0ajdTYKCEWfA6xj267LM4B1p44iR1naXsEe7CPwfR9ko0O2AlHUEQcDWOmu+uF6
         bANIKjuPI2GXowyywTBRJWdxR45PHF1yp5yPJmUI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3389F940373; Tue, 26 Feb 2019 11:08:28 +0100 (CET)
Date:   Tue, 26 Feb 2019 11:08:28 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator: add dummy 2nd port to
 rcar_sound
Message-ID: <20190226100827.ulpdghtq74nb73yp@verge.net.au>
References: <20190225093604.25753-1-horms+renesas@verge.net.au>
 <878sy3bdzh.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878sy3bdzh.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 26, 2019 at 09:28:53AM +0900, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> Thank you for your patch
> 
> > Add dummy 2nd port node to rcar_sound ports node to satisfy dtc
> > recommendation that #address-cells / #size-cells is only needed.
> > 
> > This addresses the following warning:
> > 
> > arch/arm64/boot/dts/renesas/salvator-common.dtsi:703.8-719.4: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> > arch/arm64/boot/dts/renesas/salvator-common.dtsi:703.8-719.4: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> > 
> > This change should not have any run-time effect.
> > 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > 
> > ---
> > Build tested against renesas-devel-20190214-v5.0-rc6
> > ---
> >  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > index a225c2457274..20b35991bc17 100644
> > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > @@ -716,6 +716,15 @@
> >  				capture  = <&ssi1 &src1 &dvc1>;
> >  			};
> >  		};
> > +
> > +		/* Dummy node to be overriden by board DT
> > +		 * Satisfies dtc recommendation that
> > +		 * #address-cells / #size-cells is only needed
> > +		 * for graph nodes with multiple child nodes.
> > +		 */
> > +		rsnd_port1: port@1 {
> > +			reg = <1>;
> > +		};
> >  	};
> >  };
> 
> This solution is strange for me.
> I want to solve it, but I couldn't reproduce this.
> Which branch, and how to reproduce it ?

Thanks Morimoto-san,

I see this on renesas-devel-20190225-v5.0-rc8 using:

ARCH=arm64 make dtbs W=1
