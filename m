Return-Path: <devicetree-owner@vger.kernel.org>
Date: Thu, 31 Mar 2016 09:22:17 -0500
From: Rob Herring <robh@kernel.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Zhang Rui <rui.zhang@intel.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] thermal: rcar: Remove binding docs for r8a7794
Message-ID: <20160331142217.GA21794@rob-hp-laptop>
References: <1459228065-18674-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1459228065-18674-1-git-send-email-horms+renesas@verge.net.au>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 29, 2016 at 02:07:45PM +0900, Simon Horman wrote:
> The latest information that I have is that there is no thermal IP
> block present on the r8a7794 SoC so remove the corresponding binding.
> 
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  Documentation/devicetree/bindings/thermal/rcar-thermal.txt | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Rob Herring <robh@kernel.org>
