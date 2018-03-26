Return-Path: <devicetree-owner@vger.kernel.org>
Date: Mon, 26 Mar 2018 17:23:35 -0500
From: Rob Herring <robh@kernel.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org,
        laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, horms+renesas@verge.net.au
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Document R-Car M3-N IPMMU DT bindings
Message-ID: <20180326222335.yw7d3sspfvi5deyc@rob-hp-laptop>
References: <152152849171.7720.4760459385074072620.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <152152849171.7720.4760459385074072620.sendpatchset@little-apple>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Mar 20, 2018 at 03:48:11PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Update the IPMMU DT binding documentation to include the r8a77965 compat
> string for the IPMMU devices included in the R-Car M3-N SoC.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |    1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
