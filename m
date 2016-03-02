Return-Path: <devicetree-owner@vger.kernel.org>
Date: Wed, 2 Mar 2016 15:55:59 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, mark.rutland@arm.com,
	laurent.pinchart+renesas@ideasonboard.com, geert+renesas@glider.be,
	pawel.moll@arm.com, ijc+devicetree@hellion.org.uk,
	linux-renesas-soc@vger.kernel.org,
	iommu@lists.linux-foundation.org, robh+dt@kernel.org,
	galak@codeaurora.org, horms+renesas@verge.net.au
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Add r8a7795 DT binding
Message-ID: <20160302145559.GU22747@8bytes.org>
References: <20160229143309.28517.77269.sendpatchset@little-apple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160229143309.28517.77269.sendpatchset@little-apple>
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Feb 29, 2016 at 11:33:09PM +0900, Magnus Damm wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> 
> Update the IPMMU DT binding documentation to include the r8a7795 compat
> string as well as the "renesas,ipmmu-main" property that on r8a7795 will
> be used to describe the topology and the relationship between the various
> cache IPMMU instances and the main IPMMU.
> 
> Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> ---
> 
>  Written against linux-next tag next-20160229
> 
>  Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.txt |   15 ++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)

Through which tree should this go?
