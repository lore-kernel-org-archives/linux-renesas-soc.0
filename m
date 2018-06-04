Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50643 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750886AbeFDJki (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 05:40:38 -0400
Date: Mon, 4 Jun 2018 11:40:19 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: Add all HSCIF nodes
Message-ID: <20180604094018.aegvkw2cpsghl7am@verge.net.au>
References: <1527513379-18913-1-git-send-email-geert+renesas@glider.be>
 <20180529124129.wcffkbta56vqbuyk@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180529124129.wcffkbta56vqbuyk@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 29, 2018 at 02:41:30PM +0200, Simon Horman wrote:
> On Mon, May 28, 2018 at 03:16:19PM +0200, Geert Uytterhoeven wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > 
> > Based on a similar patch of the R8A7796 device tree
> > by Ulrich Hecht <ulrich.hecht+renesas@gmail.com>.
> > 
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 88 +++++++++++++++++++++++++++++++
> 
> This looks fine but I will wait to see if there are other reviews before
> applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied.
