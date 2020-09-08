Return-Path: <SRS0=caTn=CR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E64C2BC11
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Sep 2020 20:52:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 97E7321741
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  8 Sep 2020 20:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599598342;
	bh=mxEqibooUH0sO45nHnKhKZmXcn8yeqi5Onb6kYFqsJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=szGpPDgfuxkO0TQe9t11KCy+fjhla2Ij2Qcrp4Ub3jSuHDm6PTc4KpIrnfmVz6cgM
	 MxS/ql28R3HDZjdgAff4NLehjGAF11UD6vKCSg4/vbPkdGIVGpWiEhzAfPOm74hBsB
	 AiUdwFgpw+XaF7CmGpLb75mDWWPXVsed1SuYTGmA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729912AbgIHUwV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 8 Sep 2020 16:52:21 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34373 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726699AbgIHUwV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 16:52:21 -0400
Received: by mail-io1-f67.google.com with SMTP id m17so880814ioo.1;
        Tue, 08 Sep 2020 13:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JzepCYrGAGrYES9D47w2RisPkLkEF03INGsKvpBbxRY=;
        b=KxAiqQo1sgQEYEPjNtOsyWyCSuEguB+4OMXrm4Ig7CZ9boaG2GezSaCw2u3V1Sle4A
         b7nGOwJL/lxKDpl67n3FHOlyDEKvP4lZYkL7NkO+u1x4coMKmPncB+VHVY1DYSfAaHME
         yBR6aDY6FkpmLe8o+FaJ1laJMwmfgqIVo1iUdcTts5JEIe4cUNTbC3HWG0f/OUykXdCz
         ir/9/Wf0G1tIbR51P0surEZTG3WXgtyB8XB9iAz0T3fBVMsK3IDZFUlwckAPRnDEgvKS
         zjqpGOvjEqXwEycNSZi8jmA/YiuujbWxgB92hX7i+UEyppJN9pLW/1y4aW9oqRYYOI74
         nD8g==
X-Gm-Message-State: AOAM533AHRazEO4NvO1h8d+VgKg1hQBkYChlCilLvaHmVSoJ+FHHsW/Y
        STSc9+eDBSzDmj1M0/z+1A==
X-Google-Smtp-Source: ABdhPJxLB3kOj8pf6Yly17ORHTH8WuKy2jZOn9ohFBy9irVHuogpqDPXWV9q86vA+IYz8U0MDdVCYg==
X-Received: by 2002:a05:6638:22ba:: with SMTP id z26mr839301jas.55.1599598340138;
        Tue, 08 Sep 2020 13:52:20 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id r8sm199831iot.51.2020.09.08.13.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 13:52:19 -0700 (PDT)
Received: (nullmailer pid 898720 invoked by uid 1000);
        Tue, 08 Sep 2020 20:52:17 -0000
Date:   Tue, 8 Sep 2020 14:52:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas,rza2-pinctrl: Fix pin
 controller node name
Message-ID: <20200908205217.GA898665@bogus>
References: <20200821111127.3771-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821111127.3771-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 21 Aug 2020 13:11:27 +0200, Geert Uytterhoeven wrote:
> According to Devicetree Specification v0.2 and later, Section "Generic
> Names Recommendation", the node name for a pin controller device node
> should be "pinctrl".
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc for v5.10.
> 
>  .../devicetree/bindings/pinctrl/renesas,rza2-pinctrl.yaml       | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
