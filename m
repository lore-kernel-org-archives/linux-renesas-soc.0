Return-Path: <SRS0=YTPq=QU=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 826CFC282C2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 09:42:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50E23222BA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Feb 2019 09:42:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IgNy/l/R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733151AbfBMJm4 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Feb 2019 04:42:56 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40642 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733153AbfBMJm4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Feb 2019 04:42:56 -0500
Received: by mail-lf1-f66.google.com with SMTP id t14so1255812lfk.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Feb 2019 01:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hQQiEdaQIt8Oc6X3wVfJxsdUbFg9UlIve4GLDcA0k7w=;
        b=IgNy/l/Rhl2pUNw6696wNSowhIhOSeT92gVls1gqnuaK81T6XmmxJNsQCT13WsfSDw
         8rQm9mKVpFe2bQ3Q2K+MOnH5bf3SRI4+Y3gqEDhZWPm54O+NhSf2Nu4Xn6/udJE9lsQa
         PPMkz2lruIkcR+PAWYn5bEB26imlSI4LMzg1g3bIfn79PpJczyHPjIbbTzD25kCCJpt4
         NtZ3L2jny+pqOJw3rqRknF9F61nOYb97SWnPxQzF7IlXaYPAtHSF+eUbVbhbVF0stcw4
         oPfak+A77olFNTsk7mMYjU5kvZORTZFtii7QlndyCzbKsrFXrwstD8PrPSBlwvuzab5L
         O+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hQQiEdaQIt8Oc6X3wVfJxsdUbFg9UlIve4GLDcA0k7w=;
        b=sN+/6+YvTKo3BL6uwwiHrrAvUQE7OQbIZenfQWfm3vdrSiTKQNM3ZjaCAJ3w/Ddr7x
         npGt0fmpNJs8iRsmeXdcYOFgtG+rmGKZJXedVn/3ddRPINxoHekL+WlzP9Cig3ho0rEo
         5xjfIcCWWUYATMfFCVnmnEbcmjtdQb6P/8AGKEd29WjMdM3vR5giPO09EfX0xLBN0NgX
         J4v96ycCFiPttBq0Y6nnxGl/YZMo/b99TkPmYqvYAfBXv2BAO/4TqY4AEjjDU6CTzBfh
         6DNA2gTCT8tiCAhOTHwSif1v0EJ0rLR5tQK1Q2uxPZJTf/6DGP7Rsnk6C5w5rV7SL/XH
         VeHQ==
X-Gm-Message-State: AHQUAuZHsI/jTjyHU4qGmS6AjWJ2z3DP8lXECobOD9lqkrBbm5T8PfqL
        Dxm1MvtX+eVXLAHVGfc0TffYAdDITWxFYUnmtny4yFWv
X-Google-Smtp-Source: AHgI3IZeUAMz+Vu/iF/6rSo8LPN3YdKgvzqPvAbfbCD1iCr5QFB8OjPd9tap+jn4pykXpyfe3Kat4ef3Mti6i8pDeTY=
X-Received: by 2002:ac2:4343:: with SMTP id o3mr4770873lfl.129.1550050974343;
 Wed, 13 Feb 2019 01:42:54 -0800 (PST)
MIME-Version: 1.0
References: <20190212102104.32299-1-geert+renesas@glider.be>
In-Reply-To: <20190212102104.32299-1-geert+renesas@glider.be>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 13 Feb 2019 10:42:42 +0100
Message-ID: <CACRpkdbJAaxLDq7kVg==5m798fnze8Nz4bdC_RdJZuPkeG_kXw@mail.gmail.com>
Subject: Re: [git pull] pinctrl: sh-pfc: Updates for v5.1 (take two)
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Feb 12, 2019 at 11:48 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

> The following changes since commit 8e32e881947be98abaa917157fefc4a3319e90af:
>
>   pinctrl: sh-pfc: r8a7778: Fix HSPI pin numbers and names (2019-01-21 13:25:38 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v5.1-tag2
>
> for you to fetch changes up to 79dbbdbeccc6784d5e189710adcca750c03d3bd4:
>
>   pinctrl: sh-pfc: r8a77965: Add DRIF pins, groups and functions (2019-02-11 14:16:11 +0100)

Pulled into my "devel" branch for v5.1, thanks!

Yours,
Linus Walleij
