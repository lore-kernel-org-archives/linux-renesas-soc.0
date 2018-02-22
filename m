Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:37283 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932788AbeBVOv2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Feb 2018 09:51:28 -0500
Received: by mail-it0-f67.google.com with SMTP id d10so6781317itj.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Feb 2018 06:51:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1517771702-16984-1-git-send-email-ykaneko0929@gmail.com>
References: <1517771702-16984-1-git-send-email-ykaneko0929@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 22 Feb 2018 15:51:27 +0100
Message-ID: <CACRpkdYd1wh97-_668eCcnFPwvVh5rn92H-gDpFOq8ju+LCXEQ@mail.gmail.com>
Subject: Re: [PATCH/RFT v4] gpio: gpio-rcar: Support S2RAM
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Feb 4, 2018 at 8:15 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:

> From: Hien Dang <hien.dang.eb@renesas.com>
>
> This patch adds an implementation that saves and restores the state of
> GPIO configuration on suspend and resume.
>
> Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> [Modify structure of the bank info to simplify a saving registers]
> [Remove DEV_PM_OPS macro]
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

This v4 version applied with Tested- and reviewed tags.

Yours,
Linus Walleij
