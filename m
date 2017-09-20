Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:37126 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751955AbdITUwf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 16:52:35 -0400
Date: Wed, 20 Sep 2017 15:52:33 -0500
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: devicetree@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        linux-renesas-soc@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 6/8] arm64: renesas: document Eagle board bindings
Message-ID: <20170920205233.jjncu7fzi6cmoggq@rob-hp-laptop>
References: <20170915194442.464361390@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170915194442.464361390@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Sep 15, 2017 at 10:43:24PM +0300, Sergei Shtylyov wrote:
> Document the Eagle device tree bindings, listing it as a supported board.
> 
> This allows to use checkpatch.pl to validate .dts files referring to the
> Eagle board.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> Changes in version 2:
> - renamed the patch.
> 
>  Documentation/devicetree/bindings/arm/shmobile.txt |    2 ++
>  1 file changed, 2 insertions(+)
> 
> Index: renesas/Documentation/devicetree/bindings/arm/shmobile.txt
> ===================================================================
> --- renesas.orig/Documentation/devicetree/bindings/arm/shmobile.txt
> +++ renesas/Documentation/devicetree/bindings/arm/shmobile.txt
> @@ -59,6 +59,8 @@ Boards:
>      compatible = "renesas,bockw", "renesas,r8a7778"
>    - Draak (RTP0RC77995SEB0010S)
>      compatible = "renesas,draak", "renesas,r8a77995"
> +  - Eagle (RTP0RC77970SEB0010S)
> +    compatible = "renesas,eagle", "renesas,r8a77970";

You're not consistent here with the ';'.

Otherwise,

Acked-by: Rob Herring <robh@kernel.org>

>    - Genmai (RTK772100BC00000BR)
>      compatible = "renesas,genmai", "renesas,r7s72100"
>    - GR-Peach (X28A-M01-E/F)
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
