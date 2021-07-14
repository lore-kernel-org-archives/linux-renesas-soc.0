Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E2CAC12002
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 14 Jul 2021 21:42:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED7D861260
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 14 Jul 2021 21:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230111AbhGNVo6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 14 Jul 2021 17:44:58 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:37469 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbhGNVo6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Jul 2021 17:44:58 -0400
Received: by mail-il1-f171.google.com with SMTP id o8so3064448ilf.4;
        Wed, 14 Jul 2021 14:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HNyxqUP4x4MwonkkSsPuo4EdEZPNoq+cX0dHKb+rfxg=;
        b=WFpIJeGonObbmGP/Vz/MsRZK/ngeTuyYKA0Im2/Lefza+uytTKrIeAWXxXKbj26CE/
         90CdDO3+T30npPwosvw8pcAPIYtFbu4NuepBOhMo9pXLg1EnW7hGNfUZj4elfPQM4ELB
         YE//brNrQkU6BcgQ5iNsr2cdGXfZrpoNVIwxmtA886mBv2y0ZpbFqPzjhGQ9UeQk0vdJ
         6fGR4gVZkRCv7T8M0c7Rd99DrauvxEguKdx8U/N+npLTFtcdwSabGA2Y2zch+GeF/zAg
         foT7sk67YHTYOtz6/l2fBwak0miGF43SK6KFDqm/knHOSX2gCdHFPxYNjw7Agm7k9GEU
         KmIg==
X-Gm-Message-State: AOAM533iaEqQWSEeukMgfykHts5VCtsn+COdDL8zBS/ub6x+R1hCCmnm
        IwEk7vumm4cBV0+EgdnI7A==
X-Google-Smtp-Source: ABdhPJwi0NoRw5ew7avbRsmhhvF8eJfBB591l/RnYgf98Dh2maBxcQ+QHHVsim4OApePaxIs9Wh2oA==
X-Received: by 2002:a92:660f:: with SMTP id a15mr8413285ilc.182.1626298925090;
        Wed, 14 Jul 2021 14:42:05 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b16sm1023075ioh.5.2021.07.14.14.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 14:42:04 -0700 (PDT)
Received: (nullmailer pid 3578879 invoked by uid 1000);
        Wed, 14 Jul 2021 21:42:02 -0000
Date:   Wed, 14 Jul 2021 15:42:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     devicetree@vger.kernel.org,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        linux-renesas-soc@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] dt-bindings: mfd: bd9571mwv: Convert to json-schema
Message-ID: <20210714214202.GA3578819@robh.at.kernel.org>
References: <d11f3ec58dd8213dfc8be59dd81db060b508b08c.1625147091.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d11f3ec58dd8213dfc8be59dd81db060b508b08c.1625147091.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 01 Jul 2021 15:51:21 +0200, Geert Uytterhoeven wrote:
> Convert the ROHM BD9571MWV/BD9574MWF Power Management Integrated Circuit
> (PMIC) Device Tree binding documentation to json-schema.
> 
> Make the "regulators" subnode optional, as not all users describe the
> regulators.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> I have listed Marek as the maintainer, as he wrote the original
> bindings.  Marek: Please scream if this is inappropriate ;-)
> ---
>  .../devicetree/bindings/mfd/bd9571mwv.txt     |  69 ----------
>  .../bindings/mfd/rohm,bd9571mwv.yaml          | 127 ++++++++++++++++++
>  2 files changed, 127 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/bd9571mwv.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd9571mwv.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
