Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41032 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754403AbcK1KYS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Nov 2016 05:24:18 -0500
Date: Mon, 28 Nov 2016 11:24:12 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH renesas-next 1/3] ARM: dts: r8a73a4: Use SoC-specific
 compat string for mmcif
Message-ID: <20161128102411.GA23112@verge.net.au>
References: <1480018514-31718-1-git-send-email-horms+renesas@verge.net.au>
 <1480018514-31718-2-git-send-email-horms+renesas@verge.net.au>
 <CAMuHMdVGXQMRU-tn2EtrSAZXMLhBMNkHsxOtvUJ9duxR_Tnsxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVGXQMRU-tn2EtrSAZXMLhBMNkHsxOtvUJ9duxR_Tnsxg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 25, 2016 at 09:58:40AM +0100, Geert Uytterhoeven wrote:
> On Thu, Nov 24, 2016 at 9:15 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Use the SoC-specific compat string for mmcif in DT for the r8a73a4 SoC.
> > This is in keeping with the use of compat strings for mmcif for other
> > Renesas ARM based SoCs.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued up this and the following two patches for v4.11.
