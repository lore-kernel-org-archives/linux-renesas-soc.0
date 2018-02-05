Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:37646 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752997AbeBEGJb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 01:09:31 -0500
Date: Mon, 5 Feb 2018 00:09:29 -0600
From: Rob Herring <robh@kernel.org>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] DT: net: renesas,ravb: document R8A77980 bindings
Message-ID: <20180205060929.bg2b25fhzi7olhzi@rob-hp-laptop>
References: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eb6b81c-500e-ef21-7c21-e8bc7a1ff227@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 01, 2018 at 11:13:45PM +0300, Sergei Shtylyov wrote:
> Renesas R-Car V3H (R8A77980) SoC has the R-Car gen3 compatible EtherAVB
> device, so document the SoC specific bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> The patch is against DaveM's 'net-next.git' repo but I wouldn't mind if it's
> applied to 'net.git' instead. :-)
> 
>  Documentation/devicetree/bindings/net/renesas,ravb.txt |    1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Rob Herring <robh@kernel.org>
