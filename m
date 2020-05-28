Return-Path: <SRS0=/ydl=7K=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57D8C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 May 2020 21:05:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5CD4208B8
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 28 May 2020 21:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590699944;
	bh=M+M0OwXpwFfyp4I3rGrE1vzCPv4wDFAy32vku1gValU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=i/RMZwvtG+wX7Swsj1re/PmCfzZWLStYncVEEN882dHaDQs873fiFa3atWImizayl
	 lHvhrS1gjAln13KLCY1euR2mTMDzPgNmyKektHfQf5NWJ4tEs76tjfUPJnaAY5Zefp
	 7AVD87gVBaNbn2xLWoHwxYWbHCW6xjUTxJgn59Tw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407487AbgE1VFk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 28 May 2020 17:05:40 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:40525 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2407482AbgE1VFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 May 2020 17:05:40 -0400
Received: by mail-io1-f67.google.com with SMTP id q8so6748iow.7;
        Thu, 28 May 2020 14:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=29jf1Zooxrd4HPvjeBWlauz9CudOA+jfuB/PK0xXVwQ=;
        b=qHU1CKyrr4RyqtPamDZJi/jdh11h2VDR7iBOaBDo7taARXiVUksJlKmIL4RSs5FSeN
         2dJulEVB1uQMsm1oZtSW/+2rcAe2FLZu8ZjYftJei19seaMh96XTmopmKJjCyp7x/nmU
         lnYnKOjZvu60f0PGf9ROAqUie2ub6R2nTi36KoYQhoulqOHRqiw2Bg8fUIMxgw+w7yiV
         NUkjoKOErZazD3YPu1GjDvBT1S/2lT7rfTREL0ynTTF6MXo9zN62/hPeINrdlh6FOPD6
         q2cemTY6coQDX+Tdc4//nEnjnlk2ZKSxkFYHeM3IgD6MbW++u2HVxDxxugEBxc012We8
         OXsg==
X-Gm-Message-State: AOAM533mAn223nQqfTJSlA/rpzOcn2DkGO6I7a6ZBzw3OUI0B9M5t7lT
        dg3NJghu2oGDC5Zg/2CsUtK2AoU=
X-Google-Smtp-Source: ABdhPJwguF2JSfWT8CFK0xQgIkwKnGKI9h7AcTVi051yhh3L8vEOjQdlGRbLBj5wI90WDX3GIRWAPA==
X-Received: by 2002:a6b:b489:: with SMTP id d131mr4020509iof.73.1590699938777;
        Thu, 28 May 2020 14:05:38 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id k18sm3026278ioj.54.2020.05.28.14.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 14:05:37 -0700 (PDT)
Received: (nullmailer pid 681482 invoked by uid 1000);
        Thu, 28 May 2020 21:05:37 -0000
Date:   Thu, 28 May 2020 15:05:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: Re: [PATCH] dt-bindings: media: Add missing clock domain description
Message-ID: <20200528210537.GA681250@bogus>
References: <20200519074229.22308-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200519074229.22308-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 19 May 2020 09:42:29 +0200, Geert Uytterhoeven wrote:
> make dtbs_check:
> 
>     arch/arm/boot/dts/r7s72100-genmai.dt.yaml: camera@e8210000: 'clocks', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Fix this by documenting the missing properties.
> Update the example to match reality.
> 
> Fixes: 7f464532b05dadc8 ("dt-bindings: Add missing 'additionalProperties: false'")
> Fixes: 58361eaa11d561f3 ("dt-bindings: media: renesas,ceu: Convert to yaml")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../devicetree/bindings/media/renesas,ceu.yaml        | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 

Applied, thanks!
