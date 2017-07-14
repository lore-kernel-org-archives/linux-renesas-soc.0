Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yb0-f193.google.com ([209.85.213.193]:36818 "EHLO
        mail-yb0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753124AbdGNQLy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jul 2017 12:11:54 -0400
Date: Fri, 14 Jul 2017 11:11:52 -0500
From: Rob Herring <robh@kernel.org>
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Tejun Heo <tj@kernel.org>, linux-ide@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] ata: sata_rcar: add gen[23] fallback compatibility
 strings
Message-ID: <20170714161152.665tg2xj2wmjycrl@rob-hp-laptop>
References: <1499773460-8930-1-git-send-email-horms+renesas@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1499773460-8930-1-git-send-email-horms+renesas@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 11, 2017 at 01:44:20PM +0200, Simon Horman wrote:
> Add fallback compatibility string for R-Car Gen 2 and 3.
> 
> In the case of Renesas R-Car hardware we know that there are generations of
> SoCs, e.g. Gen 1 and 2. But beyond that its not clear what the relationship
> between IP blocks might be. For example, I believe that r8a7790 is older
> than r8a7791 but that doesn't imply that the latter is a descendant of the
> former or vice versa.
> 
> We can, however, by examining the documentation and behaviour of the
> hardware at run-time observe that the current driver implementation appears
> to be compatible with the IP blocks on SoCs within a given generation.
> 
> For the above reasons and convenience when enabling new SoCs a
> per-generation fallback compatibility string scheme being adopted for
> drivers for Renesas SoCs.
> 
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
> Based on libata/for-next
> ---
>  Documentation/devicetree/bindings/ata/sata_rcar.txt | 14 +++++++++++---
>  drivers/ata/sata_rcar.c                             |  8 ++++++++
>  2 files changed, 19 insertions(+), 3 deletions(-)

Acked-by: Rob Herring <robh@kernel.org>
