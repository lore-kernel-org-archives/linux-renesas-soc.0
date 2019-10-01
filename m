Return-Path: <SRS0=Vibg=X2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8253EC352AA
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  1 Oct 2019 22:22:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4954C2086A
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  1 Oct 2019 22:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1569968531;
	bh=nMiKyPVGp/vwJ1IL5q5eSm5oqpXz9Q41dD56GMpih0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GmwfhT0wNELaxDo8mc/rNztML8xBqxS98TaQLUEzredkF1YJOYQy3Ttwen/g5+cmU
	 425/zT0aEiN0//LibhwazLitmWyPVs/r7JkgEiUrhvV7Q91IsmV9tZa/gPfOV2Ndmc
	 ppb8o35bghYxj7rmeJ1IPS5U8DnU6tI8Y9YERNZc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfJAWWL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 1 Oct 2019 18:22:11 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:39986 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfJAWWK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 18:22:10 -0400
Received: by mail-io1-f68.google.com with SMTP id h144so52163698iof.7;
        Tue, 01 Oct 2019 15:22:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=z4ey9J+N5T2Sj8leCAjxj643ZrUTwZzAmdl1XRB6yEo=;
        b=TcMBzWE0ixiKrb5ZVws3N5s/ez1Yla0UgOOrBElP2/TxKUAMS9OlxwQV1tUMLOB/Or
         a0CgpCTiG1z9Ou53uxcqZfz0BH8hLOUJIdwsxY5VGMYM0mFp/X+Zomv9GFngbbSTWi92
         UWiLyM/fe2IQdcb0nXoAoxtGwIzKTxooXbtRkwc/klqLVRgvQTz0xprZy9dNtbzZN8O9
         ti4LB3n3yfAlvrhXWJ7uq4p4VRxfq4Zts377JtZxzKLnc7GHPwMlxgLo34ZzBAbS981m
         /Fm7ZAcEtFMWB6IBj8gPMN8SC8VYgZO/FgdtLG1ptQkQQVxR5/hGhIhjNa9jeVH0xgSo
         Bxww==
X-Gm-Message-State: APjAAAX23lmPyM8B39mtBEXh65gaZ5LDb4J6PlY294MfeaFxZ3jVz3RE
        +e33yDy1dtgyiTLz7yvl6w==
X-Google-Smtp-Source: APXvYqyxUG/8s6/g2lSG0IfTFR6cMMFCNCQUK8kR0W3grSZKzzuaQ1Q+SzfSfS8BHDqDQxrG7BTDbg==
X-Received: by 2002:a5e:8218:: with SMTP id l24mr518349iom.56.1569968529500;
        Tue, 01 Oct 2019 15:22:09 -0700 (PDT)
Received: from localhost ([2607:fb90:1780:6fbf:9c38:e932:436b:4079])
        by smtp.gmail.com with ESMTPSA id m5sm7658195ioh.69.2019.10.01.15.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2019 15:22:08 -0700 (PDT)
Date:   Tue, 1 Oct 2019 17:22:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pwm: renesas: tpu: convert bindings to
 json-schema
Message-ID: <20191001222206.GA29971@bogus>
References: <1569008189-10611-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569008189-10611-1-git-send-email-ykaneko0929@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Sat, Sep 21, 2019 at 04:36:29AM +0900, Yoshihiro Kaneko wrote:
> Convert Renesas R-Car Timer Pulse Unit PWM Controller bindings documentation
> to json-schema.
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
>  .../devicetree/bindings/pwm/renesas,tpu-pwm.txt    | 35 -----------
>  .../devicetree/bindings/pwm/renesas,tpu-pwm.yaml   | 69 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
>  create mode 100644 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml

Applied, thanks.

Rob
