Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45009 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935467AbeEIStC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 May 2018 14:49:02 -0400
Date: Wed, 9 May 2018 20:48:43 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH 00/10] ARM, arm64: dts: renesas: update register
 properties
Message-ID: <20180509184842.b33k2sviyj7y4p4y@verge.net.au>
References: <20180426102951.8683-1-horms+renesas@verge.net.au>
 <CAMuHMdUBtNrny+DPqamKSL6nmiyuF38BQdD0eqc7kzDhuMSQqg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUBtNrny+DPqamKSL6nmiyuF38BQdD0eqc7kzDhuMSQqg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 02, 2018 at 03:10:18PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Thu, Apr 26, 2018 at 12:29 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > this series:
> >
> > 1. Drops unnecessary address properties from VIN port nodes
> >    on Renesas R-Car Gen2 SoC board DTSes. These are unnecessary
> >    as the nodes to not have bus addresses.
> 
> I guess the example in Documentation/devicetree/bindings/media/rcar_vin.txt
> should be updated, too?

I have sent a patch for this.

> > 2. And adds address properties to R-Car Sound port nodes on
> >    Renesas R-Car Gen2 SoC DTSes. These are necessary as the nodes
> >    have unit names.
> 
> Documentation/devicetree/bindings/sound/renesas,rsnd.txt doesn't say
> anything about the presence of ports?
