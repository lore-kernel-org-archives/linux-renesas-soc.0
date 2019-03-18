Return-Path: <SRS0=zXAj=RV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D21C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:38:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB85720854
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Mar 2019 10:38:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="IcYc6aDo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727462AbfCRKiX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Mar 2019 06:38:23 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53697 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727246AbfCRKiW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Mar 2019 06:38:22 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8CF2725B80E;
        Mon, 18 Mar 2019 21:38:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1552905500; bh=1/ZFXQheDW/9PFL9BSG9ficn10lx45OtGkongRr+hEM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IcYc6aDo4fb+NMqalkiVOADon/J8whhG5IJAD9PA8Iwp8PaB6B9Ke4+CnCmT+wk3C
         TVNrcOjX0dKPxcduUVbxHS/zZlUkeoESkWbd9Dte6AwB6eJh9hHDi6AYTCG55M7DFW
         wSd6t6JwsxG0DuentzSvq3xPqQuIa599xBaaaDlg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DACED9406ED; Mon, 18 Mar 2019 11:38:18 +0100 (CET)
Date:   Mon, 18 Mar 2019 11:38:18 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Mark Brown <broonie@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jiada Wang <jiada_wang@mentor.com>
Subject: Re: [PATCH 2/2] ASoC: rsnd: explain extended Audio DMAC peri peri
 address
Message-ID: <20190318103818.j22q6xly5fbgqeli@verge.net.au>
References: <87imwgye1k.wl-kuninori.morimoto.gx@renesas.com>
 <87ftrkye0f.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ftrkye0f.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 18, 2019 at 02:11:34PM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> If SoC has extended Audio DMAC peri peri address,
> DT needs to select it.
> Otherwise, it can select normal Audio DMAC peri peri address.
> Extended Audio DMAC peri peri address can use BUSIF4-7,
> normal address can't.
> 
> Reported-by: Jiada Wang <jiada_wang@mentor.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  Documentation/devicetree/bindings/sound/renesas,rsnd.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> index c58af45..b34afa6 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.txt
> @@ -283,6 +283,8 @@ Required properties:
>  				  required register is
>  				   SRU/ADG/SSI      if generation1
>  				   SRU/ADG/SSIU/SSI/AUDIO-DMAC-periperi if generation2/generation3
> +				   Select extended AUDIO-DMAC-periperi address if SoC has it,
> +				   otherwise select normal AUDIO-DMAC-periperi address.
>  - reg-names			: Should contain the register names.
>  				   scu/adg/ssi	if generation1
>  				   scu/adg/ssiu/ssi/audmapp if generation2/generation3
> -- 
> 2.7.4
> 
