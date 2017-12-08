Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:46389 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753786AbdLHPge (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Dec 2017 10:36:34 -0500
Date: Fri, 8 Dec 2017 16:36:21 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "David S. Miller" <davem@davemloft.net>,
        Niklas =?UTF-8?B?U8O2ZGVybHVu?= =?UTF-8?B?ZA==?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] net: sh_eth: do not advertise Gigabit capabilities
 when not available
Message-ID: <20171208163621.0c8f4e7d@windsurf.lan>
In-Reply-To: <efb99078-3156-666b-0b7e-6c2d1976c89f@cogentembedded.com>
References: <20171205092952.3455-1-thomas.petazzoni@free-electrons.com>
        <efb99078-3156-666b-0b7e-6c2d1976c89f@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On Tue, 5 Dec 2017 22:02:20 +0300, Sergei Shtylyov wrote:

> > +	/* mask with MAC supported features */
> > +	if (mdp->cd->register_type != SH_ETH_REG_GIGABIT) {
> > +		err = phy_set_max_speed(phydev, SPEED_100);
> > +		if (err) {
> > +			netdev_err(ndev, "failed to limit PHY to 100 Mbit/s\n");
> > +			goto err_phy_disconnect;  
> 
>     Er, why do we need a *goto* here at all? Just call phy_disconnect() here 
> and be done with that...

Thanks for the feedback, I've sent a v3 that takes into account this
comment.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
