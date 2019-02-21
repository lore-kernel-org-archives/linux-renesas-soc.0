Return-Path: <SRS0=UKHE=Q4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06000C43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 12:13:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C7C492086C
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 21 Feb 2019 12:13:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TiVlxyeF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbfBUMNj (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 21 Feb 2019 07:13:39 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42956 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbfBUMNj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Feb 2019 07:13:39 -0500
Received: by mail-qt1-f193.google.com with SMTP id b8so31118173qtr.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Feb 2019 04:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sg2LY8jTbmJsun9547ZrBXaEaXzJqga9/NNwjTxiHbw=;
        b=TiVlxyeF1GHZRPPkLR/P4+ldJD5xiBkUCfwbV6ieR1WYZg4pEQef4ZhVKrwGMXgHJH
         7/sy8GvIvW40GVcmE1EUYCzWes7jfnWfLeleqRipumYLddQFU/I7QVm4E5kt2XLpnOh6
         BDYL4Urgt5nfy1ehqJgFQT71Nk2xthvoITdPvRr4xn306AoUhAPKjiLj6V8xTInXIw8y
         iKr7Gz/gUfqSpW94YuF5xk9XVjKl4W0jPnx8S72wkVcOjXXF8ZpPiGtF499XeLxV1+6J
         OzO1+BA48drFxhZVsfcqBm1XtFHeeava6jrVDOj8o4mk/ouobptLnpYNEG+JRJYMUtZP
         XF0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sg2LY8jTbmJsun9547ZrBXaEaXzJqga9/NNwjTxiHbw=;
        b=W1uo80sI4/3id3i0VtfujrqXP7H+AW4cJDsnUYQr9zbdSQfI03ICqjfU14e+xEQzyP
         jqMRBcNm/YdopEsCxt94i7qI3RWnLBDXsGY+E1pWzJGyB6K55QvhC0DeuKJRnzxrwfQk
         PLH3CiAAdpQhUEqEQ6ewx+7wvtP1z5KYaUbhOgsxx7lD32SEmkL9eKOr1Fw0KrxnFWLK
         sNkBsQjBBU+EfCOg+fPShVqoIs3BV9eALVYwVAtWMN+DUutCyStLUHyMWfRc/yl45hcy
         V+S7habcKj5xCyQB/CVs8Kd0O5h5MCs5B6B+jCeLyIjRxbW6dY5KA51HsIVnGE3OXjow
         9dBw==
X-Gm-Message-State: AHQUAuZgUg5mihymn/MixOlYiyUJ3hHt5PBM+cqTEtxR/QjXYIjFBwEi
        n9Hdu3XRYYhGRpBY8D+EIAeJcXQWJqEA74b44FErsA==
X-Google-Smtp-Source: AHgI3Ibw7HlcyDh6SAb2RPRidDjxnDskdv4nfUwPMJCnIr+r5u1JMlpu5Pebi+X85GnkDOzHZoTuG+fW+tsNlCwD36E=
X-Received: by 2002:ac8:1bf7:: with SMTP id m52mr31990232qtk.200.1550751218482;
 Thu, 21 Feb 2019 04:13:38 -0800 (PST)
MIME-Version: 1.0
References: <20190220112430.13550-1-marek.vasut@gmail.com>
In-Reply-To: <20190220112430.13550-1-marek.vasut@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Feb 2019 13:13:26 +0100
Message-ID: <CACRpkdau-PmSQzd+7i4UW=qn3c1B57u8BdBF1QtEepG7+C=H5A@mail.gmail.com>
Subject: Re: [PATCH] gpio: of: Handle both enable-gpio{,s}
To:     Mark Vasut <marek.vasut@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Jan Kotas <jank@cadence.com>, Mark Brown <broonie@kernel.org>,
        Thierry Reding <treding@nvidia.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Feb 20, 2019 at 12:24 PM <marek.vasut@gmail.com> wrote:

> From: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Handle both enable-gpio and enable-gpios properties of the GPIO
> regulator in the quirk. The later is the preferred modern name
> of the property.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jan Kotas <jank@cadence.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-gpio@vger.kernel.org

This patch applied on top of Thierry's patch (which worked fine
so I guess this order was implied).

Yours,
Linus Walleij
