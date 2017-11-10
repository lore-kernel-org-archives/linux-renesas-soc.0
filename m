Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55199 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750975AbdKJMHy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Nov 2017 07:07:54 -0500
Date: Fri, 10 Nov 2017 13:07:50 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77995: Add IPMMU device nodes
Message-ID: <20171110120749.rbh7dzknbaatrqjb@verge.net.au>
References: <20171101103508.7721-1-horms+renesas@verge.net.au>
 <20171101103508.7721-2-horms+renesas@verge.net.au>
 <CAMuHMdVS_5_iouNei_HvgUtWTVS_NuLcbpua_K_VUQqr7Pt_QA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVS_5_iouNei_HvgUtWTVS_NuLcbpua_K_VUQqr7Pt_QA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 07, 2017 at 11:13:36AM +0100, Geert Uytterhoeven wrote:
> On Wed, Nov 1, 2017 at 11:35 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Add r8a77995 IPMMU nodes and keep all disabled by default.
> >
> > Based on work for the r8a7795 and r8a7796 by Magnus Damm
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> My comment for r8a7795.dtsi about IPMMU-* comments is applicable here, too.

Thanks, I will drop those comments.

> My comment about power-domains properties probably isn't, as R-Car D3
> doesn't have I/O power domains, which table 16.2 doesn't take into account.

Thanks, I will not add power domains at this time.
