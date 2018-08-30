Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40261 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729008AbeH3SkC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 14:40:02 -0400
Date: Thu, 30 Aug 2018 16:37:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Rob Herring <robh@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: shmobile: Convert to using %pOFn instead of
 device_node.name
Message-ID: <20180830143730.dw26fj6dldfeajjn@verge.net.au>
References: <20180828015252.28511-1-robh@kernel.org>
 <20180828015252.28511-2-robh@kernel.org>
 <CAMuHMdV9QeMRSTzcbCeUHFi_a77ceumEW6mzoC+zrpEUsZEM=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV9QeMRSTzcbCeUHFi_a77ceumEW6mzoC+zrpEUsZEM=g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 28, 2018 at 09:24:20AM +0200, Geert Uytterhoeven wrote:
> On Tue, Aug 28, 2018 at 3:54 AM Rob Herring <robh@kernel.org> wrote:
> > In preparation to remove the node name pointer from struct device_node,
> > convert printf users to use the %pOFn format specifier.
> >
> > Cc: Simon Horman <horms@verge.net.au>
> > Cc: Magnus Damm <magnus.damm@gmail.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Rob, thanks Geert, applied for v4.20.
