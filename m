Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD268C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 18:04:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 92ED420652
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 18:04:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="VPCEuO+2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729026AbfCFSEM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 13:04:12 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:40825 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727485AbfCFSEL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 13:04:11 -0500
Received: by mail-lf1-f65.google.com with SMTP id a8so9622843lfi.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Mar 2019 10:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=XhGxJDH5mS3FJsmVMemT7YPWgT4kHqX0C0O9m2xCt08=;
        b=VPCEuO+2PTiHBZ5E+gvVyCbU7TLNgqzHLIp3U8tcaMBdi8R5JP47jwfRegPFtYSn/f
         JKQUbbU81/XAdh1SSjYpHSFsahEwib+rzzwC9SL2fAsPLkmq/23yjoCh5FrVtXM2Ovbd
         til7HUTOzvfT1YvICo/H39IqmV0L7v+L25WsJtHT+tHtpa7R5w6Rw1G/AWJhAthv+s16
         FZZRfHH6+Lr2BND2X/ccc5Liy16q0D+GZLUtqRvCnxHPZqP+6dkloIm44lLk12bZg/GU
         AnEKB8Uuh2A69JVgevRCltGJCnP+X9k2U69lwgaOcBF2CeFzb7SvXLlEmzl5QMwoEBl/
         EYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=XhGxJDH5mS3FJsmVMemT7YPWgT4kHqX0C0O9m2xCt08=;
        b=GsanEVurZe1ls3KB4eWGCYUChf0dmJTH6pb1ZsbZOsmYBpVknEuiSfMotNVvg5Phpv
         OsgWUy4UrOBZjkfM4kK9LbWUGGQemltpdbkEt0ToB0ya0TLbTq7Qv0p2DkINfuXWgIgj
         aF1Rjeqis+joTRiLjlzyRxK5HjPuh8Nc+Ky+OCQpSqXUe6vN/cgdUXRH+dMIRDiq6s7r
         EiPn3Ysdf1MjbIOJtXxA0TdAP6pY8vxq8oxxoM3XGuJEn0Db/fkTmwk2jzTPYDfntGQh
         CN9LyhyJJw4OLCfdZ+agerRwKkoi4OdFkXK05kY7NC7r4mRcU1gIlXFnr3Cehd472b7Z
         ALpA==
X-Gm-Message-State: APjAAAV9HsycZWOCU0qyr2QdeGyYj20Y+Rer4dfR1iUPxvSZBDW4JqUY
        upTXCUVHOgHLM7NaCoVxRHuH9a7a9Do=
X-Google-Smtp-Source: APXvYqxEJsQFKprTRLBVCKkam38jnmEBI/Yi+la6SCI1c0nduTV2XoM+QMRe5RgA+0N4WfjL9PiWHA==
X-Received: by 2002:ac2:518d:: with SMTP id u13mr3342294lfi.133.1551895449457;
        Wed, 06 Mar 2019 10:04:09 -0800 (PST)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id b26sm426936lfa.5.2019.03.06.10.04.08
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2019 10:04:08 -0800 (PST)
From:   "Niklas =?iso-8859-1?Q?S=F6derlund?=" <niklas.soderlund@ragnatech.se>
X-Google-Original-From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date:   Wed, 6 Mar 2019 19:04:08 +0100
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Remove invalid compatible
 value for CSI40
Message-ID: <20190306180408.GA31006@bigcity.dyn.berto.se>
References: <20190306123926.10064-1-niklas.soderlund+renesas@ragnatech.se>
 <CAMuHMdXV_wNaXq388_r-20yB-+38y4ZDt0w=oOPf1Bz9Xe1arA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXV_wNaXq388_r-20yB-+38y4ZDt0w=oOPf1Bz9Xe1arA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2019-03-06 18:45:56 +0100, Geert Uytterhoeven wrote:
> Hi Niklas,
> 
> On Wed, Mar 6, 2019 at 4:14 PM Niklas Söderlund
> <niklas.soderlund+renesas@ragnatech.se> wrote:
> > The compatible value renesas,rcar-gen3-csi2 was used while prototyping
> > the R-Car CSI-2 driver but was removed before the driver was merged.
> > Remove the only occurrence of the compatible value which manage to make
> 
> Nah, there's a second one, in r8a774c0.dtsi ;-)

Not upstream that is in renesas/next :-)

I did not know that, thanks for pointing it out and I will handle that 
one as well.

> 
> > it upstream.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Regards,
Niklas Söderlund
