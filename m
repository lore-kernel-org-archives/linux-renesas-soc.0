Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:33376 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751363AbdH3Tnz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Aug 2017 15:43:55 -0400
Date: Wed, 30 Aug 2017 14:43:53 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Biju Das <biju.das@bp.renesas.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org,
        Chris Paterson <chris.paterson2@renesas.com>,
        linux-pci@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        linux-renesas-soc@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH ] PCI: rcar: Add r8a7743/5 support
Message-ID: <20170830194353.GW8154@bhelgaas-glaptop.roam.corp.google.com>
References: <1503567344-5610-1-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1503567344-5610-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Aug 24, 2017 at 10:35:44AM +0100, Biju Das wrote:
> Add internal PCI bridge support for r8a7743/5 SoC. Renesas RZ/G1[ME]
> (R8A7743/5) internal PCI bridge is identical to the R-Car Gen2 family.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Applied with Simon's ack to pci/host-rcar, thanks!

> ---
> This patch is tested against Linux next tag next-20170824 and
> renesas-dev branch renesas-devel-20170822-v4.13-rc6. 
> 
>  Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
> index 07a7509..3d03863 100644
> --- a/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
> +++ b/Documentation/devicetree/bindings/pci/pci-rcar-gen2.txt
> @@ -6,11 +6,14 @@ AHB. There is one bridge instance per USB port connected to the internal
>  OHCI and EHCI controllers.
>  
>  Required properties:
> -- compatible: "renesas,pci-r8a7790" for the R8A7790 SoC;
> +- compatible: "renesas,pci-r8a7743" for the R8A7743 SoC;
> +	      "renesas,pci-r8a7745" for the R8A7745 SoC;
> +	      "renesas,pci-r8a7790" for the R8A7790 SoC;
>  	      "renesas,pci-r8a7791" for the R8A7791 SoC;
>  	      "renesas,pci-r8a7793" for the R8A7793 SoC;
>  	      "renesas,pci-r8a7794" for the R8A7794 SoC;
> -	      "renesas,pci-rcar-gen2" for a generic R-Car Gen2 compatible device
> +	      "renesas,pci-rcar-gen2" for a generic R-Car Gen2 or
> +				      RZ/G1 compatible device.
>  
>  
>  	      When compatible with the generic version, nodes must list the
> -- 
> 1.9.1
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
