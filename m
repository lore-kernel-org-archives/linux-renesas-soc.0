Return-Path: <devicetree-owner@vger.kernel.org>
Date: Tue, 24 Apr 2018 11:18:55 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: renesas: v3msk: add EtherAVB pins
Message-ID: <20180424091855.2ngzbiwvigragk5h@verge.net.au>
References: <c42c9e9a-8fe8-5cad-0eeb-0c1fbd09f83c@cogentembedded.com>
 <ed7ddd72-4e52-0b2b-d2ef-1d407f638745@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed7ddd72-4e52-0b2b-d2ef-1d407f638745@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 20, 2018 at 02:28:51PM +0300, Sergei Shtylyov wrote:
> On 03/14/2018 11:30 PM, Sergei Shtylyov wrote:
> 
> > Add the (previously omitted) EtherAVB pin data to the V3M Starter Kit
> > board's device tree.
> > 
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > ---
> > The patch is against the 'renesas-devel-20180314-v4.16-rc5' tag of Simon's
> > 'renesas.git repo. It depends on the R8A77970 PFC driver patch adding EtherAVB
> > pin groups (posted yesterday) in order to work properly...
> 
>    The dependency has been now met, please merge this patch.

Thanks, applied.
