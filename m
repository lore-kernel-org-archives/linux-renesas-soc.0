Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45818 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729166AbeJATRb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 1 Oct 2018 15:17:31 -0400
Date: Mon, 1 Oct 2018 14:39:49 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/3] ARM: dts: r9a06g032: Add pinctrl node
Message-ID: <20181001123949.4l47km37qqqclcq4@verge.net.au>
References: <20180926091053.21255-1-phil.edworthy@renesas.com>
 <20180926091053.21255-4-phil.edworthy@renesas.com>
 <CAMuHMdVg8XZQxpGM5ZB5P03SNbsr3y=kBg-pftNrRLt6xE-34w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVg8XZQxpGM5ZB5P03SNbsr3y=kBg-pftNrRLt6xE-34w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 26, 2018 at 01:41:39PM +0200, Geert Uytterhoeven wrote:
> On Wed, Sep 26, 2018 at 11:11 AM Phil Edworthy
> <phil.edworthy@renesas.com> wrote:
> > This provides a pinctrl driver for the Renesas R9A06G032 SoC
> >
> > Based on a patch originally written by Michel Pollet at Renesas.
> >
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.21.
