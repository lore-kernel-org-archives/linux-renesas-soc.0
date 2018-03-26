Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 26 Mar 2018 11:01:46 +0200
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
Message-ID: <20180326090146.7f7esysp5uhd5z3i@verge.net.au>
References: <c42c9e9a-8fe8-5cad-0eeb-0c1fbd09f83c@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c42c9e9a-8fe8-5cad-0eeb-0c1fbd09f83c@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 14, 2018 at 11:30:34PM +0300, Sergei Shtylyov wrote:
> Add the (previously omitted) EtherAVB pin data to the V3M Starter Kit
> board's device tree.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against the 'renesas-devel-20180314-v4.16-rc5' tag of Simon's
> 'renesas.git repo. It depends on the R8A77970 PFC driver patch adding EtherAVB
> pin groups (posted yesterday) in order to work properly...

Thanks, I have marked this as deferred, please either:
* repost or ping me once the dependency is in an RC release or;
* let me know that its safe to apply this change - that is, it won't cause
  a regression - without the dependency
