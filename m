Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDA3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:38:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C31420857
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:38:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="OUlmiriu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfCRKiK (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 06:38:10 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53681 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727246AbfCRKiK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 06:38:10 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 860A725B80E;
        Mon, 18 Mar 2019 21:38:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552905488; bh=BHLugXF0FOYQuwcDkMgN7kFuEbwjHlXUtSjOulzJIFk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OUlmiriuXqosb6EVEU292CY9Ux+cw4HYs7HtMir7Zf9wz/qxVt0ejVU/l/T4tbd8I
         Q2nZcms8HPtvTqCf35AeH0SCIZ6Vq2z4rcRLHeNkrw14eyZPVaMr1/n+5Mk0mqOLtA
         yvvdOdGvXnmrx0zGKJzdTurawA3l8G4jKnthnMpA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BA3A99406ED; Mon, 18 Mar 2019 11:38:06 +0100 (CET)
Date:   Mon, 18 Mar 2019 11:38:06 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jiada Wang <jiada_wang@mentor.com>
Subject: Re: [PATCH 1/2] ASoC: rsnd: add missing reg/reg-name at Document
Message-ID: <20190318103806.oqfugvu57jjdotey@verge.net.au>
References: <87imwgye1k.wl-kuninori.morimoto.gx@renesas.com>
 <87h8c0ye0n.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h8c0ye0n.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 18, 2019 at 02:11:27PM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> reg is missing "Audio DMAC peri peri" part,
> and reg-name itself is missing at Document.
> This patch add these.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> index 648d43e..c58af45 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> @@ -282,7 +282,10 @@ Required properties:
>  - reg				: Should contain the register physical address.
>  				  required register is
>  				   SRU/ADG/SSI      if generation1
> -				   SRU/ADG/SSIU/SSI if generation2
> +				   SRU/ADG/SSIU/SSI/AUDIO-DMAC-periperi if generation2/generation3
> +- reg-names			: Should contain the register names.
> +				   scu/adg/ssi	if generation1
> +				   scu/adg/ssiu/ssi/audmapp if generation2/generation3
>  - rcar_sound,ssi		: Should contain SSI feature.
>  				  The number of SSI subnode should be same as HW.
>  				  see below for detail.
> -- 
> 2.7.4
> 
