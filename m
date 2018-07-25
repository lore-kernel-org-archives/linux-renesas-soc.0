Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 25 Jul 2018 18:08:36 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77980: add RWDT support
Message-ID: <20180725160835.4z3zmrfnfwrca5st@verge.net.au>
References: <20180724114552.aybrijeonsj2tmcw@verge.net.au>
 <8f72716f-75b4-e8c0-3a77-9d709959e45d@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f72716f-75b4-e8c0-3a77-9d709959e45d@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 25, 2018 at 06:08:21PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 07/24/2018 02:45 PM, Simon Horman wrote:
> 
> [...]
> > On Tue, Jul 24, 2018 at 09:01:59AM +0200, Geert Uytterhoeven wrote:
> >> On Fri, Jul 20, 2018 at 9:21 PM Sergei Shtylyov
> >> <sergei.shtylyov@cogentembedded.com> wrote:
> >>> Describe RWDT in the R8A77980 SoC device tree.
> >>>
> >>> Enable RWDT on the Condor and V3H Starter Kit boards.
> >>>
> >>> Based on the original (and large) patch by Vladimir Barinov.
> >>>
> >>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>
> >> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > 
> > Thanks, applied for v4.20.
> 
>    Sorry, still not seeing any 'devel' branch updates... forgot to push?

I did push but, as discussed elsewhere, it seems that there was a glitch
in The Matrix. Updates are now there after repushing them.
