Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48363 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750957AbdEBIg1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 May 2017 04:36:27 -0400
Date: Tue, 2 May 2017 10:36:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH/RFT v3 renesas-devel] ARM: dts: silk: Enable UHS-I SDR-50
Message-ID: <20170502083622.GB32059@verge.net.au>
References: <20170426080024.8391-1-horms+renesas@verge.net.au>
 <20170426081334.11846-1-horms+renesas@verge.net.au>
 <20170502082247.GB2640@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170502082247.GB2640@katana>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 02, 2017 at 10:22:47AM +0200, Wolfram Sang wrote:
> > +	sdhi1_pins_uhs: sd1_uhs {
> > +		groups = "sdhi1_data4", "sdhi1_ctrl";
> > +		function = "sdhi1";
> > +		power-source = <1800>;
> >  	};
> >  
> >  	qspi_pins: qspi {
> > @@ -338,11 +345,13 @@
> >  
> >  &sdhi1 {
> >  	pinctrl-0 = <&sdhi1_pins>;
> > -	pinctrl-names = "default";
> > +	pinctrl-1 = <&sdhi0_pins_uhs>;
> 
> This must be sdhi1_pins_uhs.

Thanks, will fix.
