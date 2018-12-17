Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EED0C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 09:21:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D9C12084D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 09:21:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="ZRELySwu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731958AbeLQJVm (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 04:21:42 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:37510 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbeLQJVm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 04:21:42 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B15B425B781;
        Mon, 17 Dec 2018 20:21:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545038501; bh=p3HLIKUQb5QxJUoTQ/uch11n8f64f/WTjQY02KCx8bM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZRELySwuS9+MhLIOnBuHEMdqXDFhzJELQ/wh06h8Ty4WKxwZ0B1PQWxJPdH9+dx+t
         M1yUwkVUEUZaJ3zT65vxoEORaeB/eGxD2WIHXzaU8KuYgGYAGdSj7JVWpI3Pin3hNN
         Dr0JPxRd005JX0W4HCQYYZKX9OKBwjaHyMch8fuQ=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C56C79402FB; Mon, 17 Dec 2018 10:21:38 +0100 (CET)
Date:   Mon, 17 Dec 2018 10:21:38 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: defconfig: Enable scu-simple-card driver
Message-ID: <20181217092138.g5kwssfxabiw7g7f@verge.net.au>
References: <20181214115650.12443-2-horms+renesas@verge.net.au>
 <874lbdj97x.wl-kuninori.morimoto.gx@renesas.com>
 <20181217083642.6s34yp6dh6k56iie@verge.net.au>
 <871s6gk0mr.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871s6gk0mr.wl-kuninori.morimoto.gx@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 05:49:34PM +0900, Kuninori Morimoto wrote:
> 
> Hi Simon
> 
> > Using renesas_defconfig as a base I find that without enabling
> > CONFIG_SND_SIMPLE_SCU_CARD the following are enabled:
> > 
> >    CONFIG_SND_AUDIO_GRAPH_CARD
> >    CONFIG_SND_SIMPLE_CARD
> > 
> > But I see:
> > 
> > [   12.209793] ALSA device list:
> > [   12.212799]   No soundcards found.
> > 
> > With CONFIG_SND_SIMPLE_SCU_CARD also enabled (in the defconfig) I see:
> > 
> > [   14.087191] ALSA device list:
> > [   14.090195]   #0: rsnd-ak4613
> 
> Thanks.
> 56629fcba94c698d8c5be3413981506479566869
> ("arm64: dts: renesas: ebisu: Enable Audio")
> is using "simple-scu-audio-card", but it should be "simple-audio-card".
> Can you add and test this patch ?
> CONFIG_SND_SIMPLE_SCU_CARD is no longer needed, I think.


Thanks Morimoto-san,

I confirm that Sound on Ebisu-4D appears to work with a)
CONFIG_SND_SIMPLE_SCU_CARD disabled and b) the following patch applied.

> 
> --------------
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> index 62bdddc..649d3fd 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> @@ -159,16 +159,13 @@
>  	};
>  
>  	rsnd_ak4613: sound {
> -		compatible = "simple-scu-audio-card";
> +		compatible = "simple-audio-card";
>  
>  		simple-audio-card,name = "rsnd-ak4613";
>  		simple-audio-card,format = "left_j";
>  		simple-audio-card,bitclock-master = <&sndcpu>;
>  		simple-audio-card,frame-master = <&sndcpu>;
>  
> -		simple-audio-card,prefix = "ak4613";
> -		simple-audio-card,routing = "ak4613 Playback", "DAI0 Playback",
> -		"DAI0 Capture", "ak4613 Capture";
>  		sndcpu: simple-audio-card,cpu {
>  			sound-dai = <&rcar_sound>;
>  		};
> --------------
> 
> 
> Best regards
> ---
> Kuninori Morimoto
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
