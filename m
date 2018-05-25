Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43101 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935638AbeEYKJN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 May 2018 06:09:13 -0400
Date: Fri, 25 May 2018 12:09:09 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marek Vasut <marek.vasut@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: porter: Add missing PMIC nodes
Message-ID: <20180525100908.wybt74b5l4wro4gb@verge.net.au>
References: <20180523114340.10216-1-marek.vasut+renesas@gmail.com>
 <CAMuHMdVCPEChhbHsc1Tcp-zkBY5v8Mz+8qq-v3GVFifL_uLyeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVCPEChhbHsc1Tcp-zkBY5v8Mz+8qq-v3GVFifL_uLyeA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 23, 2018 at 01:52:32PM +0200, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Wed, May 23, 2018 at 1:43 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> > Add PMIC nodes to Porter and connect CPU DVFS supply. There is
> > one DA9063L and one DA9210 on Porter, the only difference from
> > the other boards is that DA9063L is at I2C address 0x5a rather
> > than 0x58 .
> 
> Ah, so porter needs the regulator quirk, too.
> 
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
