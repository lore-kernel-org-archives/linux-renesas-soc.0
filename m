Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32836 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752135AbeEOHSn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 May 2018 03:18:43 -0400
Date: Tue, 15 May 2018 09:18:21 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: document Renesas V3HSK board
 bindings
Message-ID: <20180515071820.n3juuxhnj2srcpij@verge.net.au>
References: <3923fc5f-103c-94c9-57ba-cb29e8c55d05@cogentembedded.com>
 <24039c74-d6d3-cac3-6c68-5dcd88ef8ecc@cogentembedded.com>
 <CAMuHMdV6HtW7L4HVbi=RSC-nmb4SDuNaY3-iVH0YYERBg3tToA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV6HtW7L4HVbi=RSC-nmb4SDuNaY3-iVH0YYERBg3tToA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 14, 2018 at 10:28:34PM +0200, Geert Uytterhoeven wrote:
> On Thu, May 10, 2018 at 8:09 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Document the V3H Starter Kit device tree bindings, listing it as
> > a supported board.
> >
> > This allows to use checkpatch.pl to validate .dts files referring to
> > the V3HSK board.
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
