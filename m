Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40997 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932133AbcIFKPc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Sep 2016 06:15:32 -0400
Date: Tue, 6 Sep 2016 12:15:26 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: dts: wheat: add support for tactile switches
Message-ID: <20160906101525.GB16304@verge.net.au>
References: <5383928.8UnDsUpmkz@wasted.cogentembedded.com>
 <10465663.8teCsXZU7y@wasted.cogentembedded.com>
 <CAMuHMdUyF6+T3EumGy5eyfqcio+n506fCTn1N40LEsbD2o_UYg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUyF6+T3EumGy5eyfqcio+n506fCTn1N40LEsbD2o_UYg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Sep 06, 2016 at 09:11:41AM +0200, Geert Uytterhoeven wrote:
> On Mon, Sep 5, 2016 at 11:33 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Add  support for the  tactile switches  SW2/3 (on the debug board) as a
> > virtual keyboard like it  was done with the Blanche board).
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> DT syntax looks OK to me, I have no board schematics or documentation.

Thanks, I have queued this up.
