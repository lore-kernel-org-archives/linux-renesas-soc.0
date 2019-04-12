Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F9AC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 11:05:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2F1102083E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 11:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726755AbfDLLFW (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 07:05:22 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:54042 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726753AbfDLLFW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 07:05:22 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id A37B725BE99;
        Fri, 12 Apr 2019 21:05:20 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 990539403FF; Fri, 12 Apr 2019 13:05:18 +0200 (CEST)
Date:   Fri, 12 Apr 2019 13:05:18 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, broonie@kernel.org,
        geert+renesas@glider.be, devicetree@vger.kernel.org,
        biju.das@bp.renesas.com, yoshihiro.shimoda.uh@renesas.com,
        kuninori.morimoto.gx@renesas.com, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH v2 18/20] sh_eth: Document r8a77470 bindings
Message-ID: <20190412110518.qb22lwmblhocgq64@verge.net.au>
References: <1554969262-15028-1-git-send-email-cv-dong@jinso.co.jp>
 <1554969262-15028-19-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1554969262-15028-19-git-send-email-cv-dong@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Dong-san,

On Thu, Apr 11, 2019 at 04:54:20PM +0900, Cao Van Dong wrote:
> Document SoC specific bindings for R-Car RZ/G1C(r8a77470) SoC.

I think it would be worth mentioning that no driver changes are required
because the renesas,rcar-gen2-ether fallaback compatibility string
will activate the correct code.

> 
> Signed-off-by: Cao Van Dong <cv-dong@jinso.co.jp>


I think this should be reposted including the following recipients:

"David S. Miller" <davem@davemloft.net>
Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Rob Herring <robh+dt@kernel.org>
Mark Rutland <mark.rutland@arm.com>
netdev@vger.kernel.org

As well as the following that are already included:
linux-renesas-soc@vger.kernel.org
devicetree@vger.kernel.org

The patch should be targeted at David Miller's net-next tree and thus
should have "net-next" included in the subject, something like this:

[PATCH net-next v2 18/20] sh_eth: Document r8a77470 bindings

Please see Documentation/networking/netdev-FAQ.rst for more information
on submitting patches to the Networking subsystem.

> ---
>  Documentation/devicetree/bindings/net/sh_eth.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/sh_eth.txt b/Documentation/devicetree/bindings/net/sh_eth.txt
> index abc3627..b184b29 100644
> --- a/Documentation/devicetree/bindings/net/sh_eth.txt
> +++ b/Documentation/devicetree/bindings/net/sh_eth.txt
> @@ -8,6 +8,7 @@ Required properties:
>  	      "renesas,gether-r8a7740" if the device is a part of R8A7740 SoC.
>  	      "renesas,ether-r8a7743"  if the device is a part of R8A7743 SoC.
>  	      "renesas,ether-r8a7745"  if the device is a part of R8A7745 SoC.
> +	      "renesas,ether-r8a77470"  if the device is a part of R8A77470 SoC.
>  	      "renesas,ether-r8a7778"  if the device is a part of R8A7778 SoC.
>  	      "renesas,ether-r8a7779"  if the device is a part of R8A7779 SoC.
>  	      "renesas,ether-r8a7790"  if the device is a part of R8A7790 SoC.
> -- 
> 2.7.4
> 
