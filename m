Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53594 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933024AbcJ0HGV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Oct 2016 03:06:21 -0400
Date: Thu, 27 Oct 2016 09:06:15 +0200
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
Subject: Re: [PATCH v4 0/7] Add R8A7743/SK-RZG1M board support
Message-ID: <20161027070615.GA7706@verge.net.au>
References: <2719479.geOc9vqcRS@wasted.cogentembedded.com>
 <CAMuHMdUNgnYc1O7DATNH1r9SQ72eqtxwFvqcen08Tq+Er3LuvQ@mail.gmail.com>
 <1a85f851-29ec-1c14-8905-8b0645f5bb1c@cogentembedded.com>
 <CAMuHMdWQegsEf_C=UGXpQiEAX0YQqy335teuvCZxBY6C=7QozA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWQegsEf_C=UGXpQiEAX0YQqy335teuvCZxBY6C=7QozA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 26, 2016 at 03:27:14PM +0200, Geert Uytterhoeven wrote:
> On Wed, Oct 26, 2016 at 3:23 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > On 10/26/2016 03:08 PM, Geert Uytterhoeven wrote:
> >>>    Here's the set of 8 patches against Simon Horman's 'renesas.git'
> >>> repo's
> >>> 'renesas-devel-20161021-v4.9-rc1' tag. I'm adding the device tree support
> >>> for
> >>> the R8A7743-based SK-RZG1M board. The SoC is close to R8A7791 and the
> >>> board
> >>> seems identical to the R8A7791/Porter board. The device tree patches
> >>> depend on
> >>> the R8A7743 CPG/MSSR driver series just posted in order to compile and
> >>> work.
> >>
> >>
> >> They depend only on "[PATCH v3 1/2] ARM: shmobile: r8a7743: add CPG clock
> >> index macros" of that series, right?
> >>
> >> "[PATCH v3 2/2] clk: renesas: cpg-mssr: add R8A7743 support" is not
> >> needed,
> >
> >    How would "clocks" props _work_ without this patch?
> 
> Sorry, I was focusing too much on "compile"...
> 
> Got my coke, switching brain to overdrive mode...

As we are talking about adding support for a new SoC I would be happy
to queue up code in my tree that compiles under the assumption that
in v4.10 the bits to make it run will appear in other branches.
