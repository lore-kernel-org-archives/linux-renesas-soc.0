Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 29 Nov 2017 10:55:59 +0100
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: renesas: r8a77970: use CPG core clock
 macros
Message-ID: <20171129095558.wvvcvfctwfmtrkq4@verge.net.au>
References: <20171128202105.552196002@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171128202105.552196002@cogentembedded.com>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Nov 28, 2017 at 11:15:44PM +0300, Sergei Shtylyov wrote:
> Now that the commit ecadea00f588 ("dt-bindings: clock: Add R8A77970 CPG
> core clock definitions") has hit Linus' tree, we  can replace the bare
> numbers (we had to use to avoid a cross tree dependency) with these macro
> definitions...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks, applied.
