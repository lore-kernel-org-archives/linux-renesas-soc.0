Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:40188 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932895AbeBVPYs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Feb 2018 10:24:48 -0500
Date: Thu, 22 Feb 2018 16:24:28 +0100
From: Simon Horman <horms@verge.net.au>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH/RFT v4] gpio: gpio-rcar: Support S2RAM
Message-ID: <20180222152428.rq53tj3yjlp4r4sw@verge.net.au>
References: <1517771702-16984-1-git-send-email-ykaneko0929@gmail.com>
 <CACRpkdYd1wh97-_668eCcnFPwvVh5rn92H-gDpFOq8ju+LCXEQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYd1wh97-_668eCcnFPwvVh5rn92H-gDpFOq8ju+LCXEQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 22, 2018 at 03:51:27PM +0100, Linus Walleij wrote:
> On Sun, Feb 4, 2018 at 8:15 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> 
> > From: Hien Dang <hien.dang.eb@renesas.com>
> >
> > This patch adds an implementation that saves and restores the state of
> > GPIO configuration on suspend and resume.
> >
> > Signed-off-by: Hien Dang <hien.dang.eb@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [Modify structure of the bank info to simplify a saving registers]
> > [Remove DEV_PM_OPS macro]
> > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> 
> This v4 version applied with Tested- and reviewed tags.

Excellent, thanks!
