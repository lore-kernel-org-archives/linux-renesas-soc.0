Return-Path: <SRS0=kNGB=SG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11874C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 15:40:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1B922082E
	for <linux-renesas-soc@archiver.kernel.org>; Thu,  4 Apr 2019 15:40:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BdbwwGs2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727525AbfDDPkh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 4 Apr 2019 11:40:37 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:37183 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728684AbfDDPkh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Apr 2019 11:40:37 -0400
Received: by mail-lj1-f195.google.com with SMTP id v13so2516121ljk.4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Apr 2019 08:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mzDsyCKY2RD/9qjrPF3MnhPNshlbTDrH+BI8td71Mr0=;
        b=BdbwwGs2BPhKe35ErWrdRsP7/ba/pgpgPfKnhRn46YGiQvfTVmx4vN1cHNdDDcD37e
         BpVbYyzSsL9x7B5fRsom3Y/tbZt6ssIIXdHgw/7+lOZe/d5K0PqblMEvnyvjSSt1SAth
         6TNDz1c5Lqg5+wENRd1nCCFmaN0MonoJ7P7xN34SkWbXbD2gGQwJp6h8w2KlVkkI/R/S
         G/IETxXDyk1vSbJaO7ZgfMHzkvFYMi0dQknNmABDINJDvrozbUhXsAkJMw3zt08nUkQO
         SzX5iicJqDD9GKQ2Wh3COeVdBcRlhv+iv+PIiXaoe+NoLPlRAVjtq335OGDJTpsX87s/
         4Gfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mzDsyCKY2RD/9qjrPF3MnhPNshlbTDrH+BI8td71Mr0=;
        b=aBEcyA0XPKi23Ywog83G8S/JM5AHRryQbIY41nRaGmlCGWx32K74CvbsWh0ExUxori
         RzHVNOgXcGDMY3XlszIuFTw9atV+M5k26x16iP1fTAF3it31EOlYKIzb4fnnCPCzHhcm
         hvosWLjJTWwiCUz8VxaITIz9mGpmB3xCTclp6GzSOPA0zM/n7TWKH4eAe4AOk0mBxU0u
         m6ssvOt/ajjhvEYNPTH1ZeRwBcIzVpLbso3vTPnBWwQNj2Gr/A/oVoQBMP0C6ViQL2lj
         kXuW/x1ihCPLV0S29vaf9OUELvtgkm+G710DJw+IzjO0Lh4QW+fVeMzBEUkOfxlobffy
         TIPg==
X-Gm-Message-State: APjAAAUSuSqcfML3fRyrfwkIes1F8S4a898ELCfZIay4oGm1x4czhNV6
        P1zkm7605a6njSY7RB+sPx8YkdnfpPIAdFLJoIlgJpmf
X-Google-Smtp-Source: APXvYqzAN/CqGdm+sZJyQVKD+YrmhBLFQxYTG9XBH5OD4qAB17B9+uBD9j0N1gwy4LjpM2gdZb7JGWFklIzexWL8xbE=
X-Received: by 2002:a2e:9a46:: with SMTP id k6mr3821041ljj.119.1554392435189;
 Thu, 04 Apr 2019 08:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190403124019.8947-1-wsa+renesas@sang-engineering.com> <20190403124019.8947-13-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190403124019.8947-13-wsa+renesas@sang-engineering.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 4 Apr 2019 22:40:23 +0700
Message-ID: <CACRpkdZFg_F95zm68vUtU51j0MzYPfFB2YFhCAnvHJqUEO8_GQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] i2c: gpio: flag atomic capability if possible
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Peter Rosin <peda@axentia.se>,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Apr 3, 2019 at 7:40 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> If switching GPIOs does not sleep, then we can support atomic transfers.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Neat and intuitive.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
