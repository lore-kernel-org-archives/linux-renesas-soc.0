Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:33909 "EHLO
        mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755829AbcINMiP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Sep 2016 08:38:15 -0400
Received: by mail-oi0-f45.google.com with SMTP id m11so18803422oif.1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Sep 2016 05:38:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1473839968-7876-1-git-send-email-geert+renesas@glider.be>
References: <1473839968-7876-1-git-send-email-geert+renesas@glider.be>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Sep 2016 14:38:14 +0200
Message-ID: <CACRpkda_oH8UXAcYPqUgB0JAjF8-awVu0d0Uf_OuNH8PVQroUA@mail.gmail.com>
Subject: Re: [git pull] pinctrl: sh-pfc: Updates for v4.9 (take three)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 14, 2016 at 9:59 AM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:

>         Hi Linus,
>
> The following changes since commit 374cf6992de89fc38d4d923c89b40816d341d678:
>
>   pinctrl: sh-pfc: r8a7796: Add SDHI pins, groups and functions (2016-08-19 09:37:20 +0200)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/sh-pfc-for-v4.9-tag3
>
> for you to fetch changes up to 77fd4136e58c642482f03d293d5717658a569b4b:
>
>   pinctrl: sh-pfc: r8a7794: Implement voltage switching for SDHI (2016-09-14 09:26:54 +0200)

Thanks, pulled in and pushed to the autobuilders for test.

Yours,
Linus Walleij
