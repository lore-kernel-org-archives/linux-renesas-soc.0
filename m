Return-Path: <SRS0=94f6=TP=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 490F4C04E53
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 May 2019 07:16:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C14F20881
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 15 May 2019 07:16:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Nx5hfMDZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726290AbfEOHQG (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 15 May 2019 03:16:06 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53437 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfEOHQG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 May 2019 03:16:06 -0400
Received: by mail-wm1-f66.google.com with SMTP id 198so1422816wme.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 15 May 2019 00:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=bmyHjZNyHivUvoK23ukxv4Nj9Dp9vXFDiA73FJcaCvw=;
        b=Nx5hfMDZKgnefIIAgQs8SbUtsBCrRfHUUmK1JNJVo0XJCP3elPtIQ6RSayZ/oFUTRo
         7/AtzjH3EswrK4+R7pP5bEiH+g09w0ptv1SJB7g1VvDQhOa5ULSmouhI70Rv4KtRdvF9
         ma4Wp88E+xiD5YYSA6QV8rrqIQORAZN/w9cvwCJND5j6Hnn5V30UaYeGUaKnsSsCVQcb
         j0en7BYL45JLvOLpaBmH7FP1mQY4+PRs+LiIUfVm0HL/65tmJeJ2mjOD8+kmjpJF/adj
         6xFahwnhKyE+Wbd3vI6nS1OTdlZv2CluVIECy2Nmng5uvw1dVQjFGlz5vAuPQWpN2r4o
         kR/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=bmyHjZNyHivUvoK23ukxv4Nj9Dp9vXFDiA73FJcaCvw=;
        b=gU/7WmSSQYGlSz5aWi05lDSGWQerSIp9gwmAOFviqNx9mAphFGN+MeOQhPOlOgLZ04
         stwjaBSUdcgjyI8xV9HV8IO9LfccwrIEtJym3G15LQTbusg/3fjInPKPdNSfGPdGxh9E
         jGzQ8RP7bHUukss32gAATgz6mpQQn6CDCWSyQdagFhYPp6LxH6frnIJ1I8iWFCzpY7Ao
         SORDEEdJCkBwMf3Di3+xidFXkBn6u7VULtTBuHveBlFQL+iELAdqqMttKQWhC/PTXRla
         vZQjEtDs3q/dEhK9E3eVGuxK7nrdld/89PQLp+P93qprzlA4ZB0Mf8QAmftogUoUdkfs
         A+cw==
X-Gm-Message-State: APjAAAWaZO9xpbm21LinAlZhcOGRgCMic6io+n1ypfi2Os+svuY/t2Zb
        +cb6gTDbi+pjKh37ftqZ+95NFw==
X-Google-Smtp-Source: APXvYqz7FxqoIBKKh2LSGlm3FW2p5aY8FKk6NC9YycD5Y1bD0YcUqRnXzXKoCONX8MhljKE5ZywNMg==
X-Received: by 2002:a1c:c5c3:: with SMTP id v186mr17138769wmf.60.1557904564394;
        Wed, 15 May 2019 00:16:04 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id i15sm1290359wre.30.2019.05.15.00.16.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2019 00:16:03 -0700 (PDT)
Date:   Wed, 15 May 2019 08:16:01 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     masonccyang@mxic.com.tw
Cc:     bbrezillon@kernel.org, broonie@kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>, juliensu@mxic.com.tw,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-spi@vger.kernel.org, marek.vasut@gmail.com,
        mark.rutland@arm.com, robh+dt@kernel.org,
        sergei.shtylyov@cogentembedded.com, zhengxunli@mxic.com.tw
Subject: Re: [PATCH v12 2/3] spi: Add Renesas R-Car Gen3 RPC-IF SPI
 controller driver
Message-ID: <20190515071601.GQ4319@dell>
References: <1556092536-17095-1-git-send-email-masonccyang@mxic.com.tw>
 <1556092536-17095-3-git-send-email-masonccyang@mxic.com.tw>
 <20190514065216.GL4319@dell>
 <OF794FCFCD.155B914B-ON482583FB.001EDBB3-482583FB.0020821B@mxic.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OF794FCFCD.155B914B-ON482583FB.001EDBB3-482583FB.0020821B@mxic.com.tw>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 15 May 2019, masonccyang@mxic.com.tw wrote:

> Hi Jones,
> 
> 
> > > +
> > > +struct rpc_spi {
> > > +   struct rpc_mfd *mfd;
> > 
> > The term MFD isn't a real thing.  What you're obtaining below is
> > driver data and is normally articulated as 'ddata' in drivers.
> 
> yes, it's just imply that data is from MFD.
> 
> Should I rename "mfd" ?

Yes please.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
