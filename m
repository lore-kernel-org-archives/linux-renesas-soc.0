Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:42117 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752689AbeBEIYy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 03:24:54 -0500
Date: Mon, 5 Feb 2018 09:24:50 +0100
From: Simon Horman <horms@verge.net.au>
To: Rob Herring <robh@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] DT: arm: shmobile: document R8A77980 SoC bindings
Message-ID: <20180205082450.wjd6gbmfna66jy5c@verge.net.au>
References: <fbdd08a3-1ab3-8e70-20f1-d9c41493b11c@cogentembedded.com>
 <d238e77a-e304-1fca-7ca6-bb99f6e55a68@cogentembedded.com>
 <CAMuHMdUJtCjkSGFTWKhCgCmfDsA7hQ+T=-dZwaeLEZ2L1qvGJw@mail.gmail.com>
 <20180202085100.ptwsx7esrfjlmgpk@verge.net.au>
 <20180205060841.ogtnqtshd3fp62qp@rob-hp-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180205060841.ogtnqtshd3fp62qp@rob-hp-laptop>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 05, 2018 at 12:08:41AM -0600, Rob Herring wrote:
> On Fri, Feb 02, 2018 at 09:51:01AM +0100, Simon Horman wrote:
> > On Thu, Feb 01, 2018 at 09:01:54PM +0100, Geert Uytterhoeven wrote:
> > > On Wed, Jan 31, 2018 at 8:56 PM, Sergei Shtylyov
> > > <sergei.shtylyov@cogentembedded.com> wrote:
> > > > Document the R-Car V3H (R8A77980) SoC device tree bindings.
> > > >
> > > > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > > 
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > 
> > > Some people may complain about the subject prefix, though.
> 
> By "some people", Geert means me. :)
> 
> > 
> > I'm a bit unsure about what to do about prefixes for that file.
> > I've gone with the following which seems sensible to me.
> 
> This should make it somewhat clear:
> 
> git log --oneline -- Documentation/devicetree/bindings/arm/
> 
> > 
> > arm64: renesas: document R8A77980 SoC bindings 
> 
> "dt-bindings: arm: ..." or  "dt-bindings: shmobile: ".

Thanks, I've updated the subject to the following when adding
your tag.

dt-bindings: arm: document R8A77980 SoC bindings

> But then I don't make folks respin just for that, so
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
