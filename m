Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:46537 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753064AbdLEJir (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 04:38:47 -0500
Date: Tue, 5 Dec 2017 10:38:35 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "David S. Miller" <davem@davemloft.net>,
        Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] net: sh_eth: use correct "struct device" when
 calling DMA mapping functions
Message-ID: <20171205103835.6fb9192f@windsurf.lan>
In-Reply-To: <CAMuHMdVzzVZcR+oCJsHeuP-nyav=kMbjmipiJGfrY7s_DZ5qnQ@mail.gmail.com>
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
        <20171204133327.3505-2-thomas.petazzoni@free-electrons.com>
        <607df840-613e-b86c-2224-43815b50627c@cogentembedded.com>
        <CAMuHMdVzzVZcR+oCJsHeuP-nyav=kMbjmipiJGfrY7s_DZ5qnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On Tue, 5 Dec 2017 09:39:35 +0100, Geert Uytterhoeven wrote:

> >    Using 'ndev->dev.parent' (as in ravb) also should work... not sure which
> > is better  
> 
> That was going to be my comment, too. I also haven't checked which
> generates the smallest code.

Using ndev->dev.parent actually generates bigger code (44 bytes larger) :

$ size drivers/net/ethernet/renesas/sh_eth.o.*
   text	   data	    bss	    dec	    hex	filename
  27803	    696	      0	  28499	   6f53	drivers/net/ethernet/renesas/sh_eth.o.new
  27759	    696	      0	  28455	   6f27	drivers/net/ethernet/renesas/sh_eth.o.orig

.orig is my original proposal, .new is with ndev->dev.parent. I'm using
a gcc 6.4.0 compiler.

Note also that the driver is already using mdp->pdev->dev all over the place:

$ grep -- mdp-\>pdev-\>dev drivers/net/ethernet/renesas/sh_eth.c
		pm_wakeup_event(&mdp->pdev->dev, 0);
	pm_runtime_get_sync(&mdp->pdev->dev);
	pm_runtime_put_sync(&mdp->pdev->dev);
	device_set_wakeup_enable(&mdp->pdev->dev, mdp->wol_enabled);
	pm_runtime_get_sync(&mdp->pdev->dev);
	pm_runtime_put_sync(&mdp->pdev->dev);
	pm_runtime_put_sync(&mdp->pdev->dev);
	struct device *dev = &mdp->pdev->dev;

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
