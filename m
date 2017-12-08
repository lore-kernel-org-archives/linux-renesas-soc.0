Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:46588 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753691AbdLHPk3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Dec 2017 10:40:29 -0500
Date: Fri, 8 Dec 2017 16:40:17 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: "David S. Miller" <davem@davemloft.net>,
        Niklas =?UTF-8?B?U8O2ZGVybHVu?= =?UTF-8?B?ZA==?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] net: sh_eth: add support for SH7786
Message-ID: <20171208164017.3e9a7cc6@windsurf.lan>
In-Reply-To: <a35c703f-9546-d4b7-25c4-681726bcea92@cogentembedded.com>
References: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
        <20171204141744.18599-2-thomas.petazzoni@free-electrons.com>
        <4c0c70ac-6db2-7c8a-4e5e-9364919e5012@cogentembedded.com>
        <20171205084945.384ea35e@windsurf.lan>
        <c334c622-9381-3bb5-eced-9a2ea6485fbd@cogentembedded.com>
        <a35c703f-9546-d4b7-25c4-681726bcea92@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello,

On Tue, 5 Dec 2017 22:49:10 +0300, Sergei Shtylyov wrote:

> >>>> This commit adds the sh_eth_cpu_data structure that describes the
> >>>> SH7786 variant of the IP.  
> >>>
> >>>      The manual seems to be unavailable, so I have to trust you. :-)  
> >>
> >> Yes, sadly. However, if you tell me what to double check, I'd be happy
> >> to do so.  
> > 
> >     I have the manual now, will check against it...
> >     DaveM, I'm retracting my ACK for the time being.  
> 
>     Starting to look into the manual, the current patch is wrong. SH7786 SoC 
> was probably the 1st one to use what we thought was R-Car specific register 
> layout. Definite NAK on this version.

Thanks for the feedback. How do we proceed from there ? I don't have
access to a lot of datasheets of the different Renesas SoCs, so it's
not easy to figure out which IP variant the SH7786 is using compared to
other Renesas SoCs.

Just out of curiosity, which specific aspect makes you think the
proposed patch is wrong ? Have you noticed a specific register or field
that isn't compatible with SH_ETH_REG_FAST_SH4 layout ?

Note that my patch makes Ethernet work in practice on SH7784, I have
root over NFS working as we speak. This certainly doesn't mean that the
patch is entirely correct, but it definitely means that the
SH_ETH_REG_FAST_SH4 is close enough to what the SH7786 is using :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
