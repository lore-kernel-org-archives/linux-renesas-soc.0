Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 31 May 2017 14:45:33 -0500
From: Rob Herring <robh@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Vinod Koul <vinod.koul@intel.com>,
        Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dmaengine: use proper name for the R-Car SoC
Message-ID: <20170531194533.bc63tanffxjosuqb@rob-hp-laptop>
References: <20170528093051.11816-1-wsa+renesas@sang-engineering.com>
 <20170528093051.11816-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170528093051.11816-2-wsa+renesas@sang-engineering.com>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, May 28, 2017 at 11:30:44AM +0200, Wolfram Sang wrote:
> It is 'R-Car', not 'r-car'. No code or binding changes, only descriptive text.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> I suggest this trivial patch should be picked individually per susbsystem.
> 
>  Documentation/devicetree/bindings/dma/shdma.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
