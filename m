Return-Path: <SRS0=TFpS=RJ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4627C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 17:46:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 84ACD20661
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  6 Mar 2019 17:46:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730529AbfCFRqJ convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 6 Mar 2019 12:46:09 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:43076 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbfCFRqJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 6 Mar 2019 12:46:09 -0500
Received: by mail-vs1-f68.google.com with SMTP id i15so2754050vsd.10
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Mar 2019 09:46:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gEVE4uP3eAfuYTenhskAqRDDN7oMkAJ3jQSejaUc/Og=;
        b=OCivEIy383AdqLDd+EluqXv6/egX6GCC8TmoCV0XpfMDF+ypBbOmcwYPXKpSUo4lxU
         iWL1XY7jLdqXtt7335d6HIWQnu/XLOe6L6V7o3lXSOvQTFSni7QA3Fw80E+KlwujIqTg
         GxXAL3H+4gwNXr/4WEZvDcLmb7+yKRZDgKByLiQObcuf1vtlbZOpaFtUjBnID3/NFZE8
         8+xPv+MN8UpNgLA+5egempzf2DumAbtumfy/hU3jgHMLVDR7IP6+IJZNnuVcUiXzvOah
         HvCoDgHO7UApccbnYZFIO6py/QgWkrn9MqJBpIkh81//8fd9eOVeUbuhWrdl7lqFLGbx
         02bQ==
X-Gm-Message-State: APjAAAXeKmFFeav+EtnTgwwcvn67sF4JULAvJqquV0//l9U1bKoUXEWw
        +eb7U0WG3mCxZk67Y8IKBIGnn82IX6OQj1OBwF81Gln0
X-Google-Smtp-Source: APXvYqwkX7NrO/z3PG3Qk81PYBY5cfu9/3lxoxtKMYL0ybt5crkISk8kOGeiNpFliIABVnU9A/WY9UpGJBDdOmSnLME=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr4492377vsc.152.1551894368598;
 Wed, 06 Mar 2019 09:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20190306123926.10064-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20190306123926.10064-1-niklas.soderlund+renesas@ragnatech.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 6 Mar 2019 18:45:56 +0100
Message-ID: <CAMuHMdXV_wNaXq388_r-20yB-+38y4ZDt0w=oOPf1Bz9Xe1arA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Remove invalid compatible
 value for CSI40
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas,

On Wed, Mar 6, 2019 at 4:14 PM Niklas Söderlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> The compatible value renesas,rcar-gen3-csi2 was used while prototyping
> the R-Car CSI-2 driver but was removed before the driver was merged.
> Remove the only occurrence of the compatible value which manage to make

Nah, there's a second one, in r8a774c0.dtsi ;-)

> it upstream.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
