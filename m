Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([213.167.242.64]:57148 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726008AbeIESWZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Sep 2018 14:22:25 -0400
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 12/16] arm64: dts: renesas: r8a77990: Add I2C device nodes
Date: Wed, 05 Sep 2018 16:52:10 +0300
Message-ID: <29544886.q7ShKGYtv8@avalon>
In-Reply-To: <CAMuHMdUPQn4HgkXB1E-nkDef9-HTsb1jCMPNZGoD9oqxGkS2Tg@mail.gmail.com>
References: <20180904121027.24031-1-laurent.pinchart+renesas@ideasonboard.com> <20180904121027.24031-13-laurent.pinchart+renesas@ideasonboard.com> <CAMuHMdUPQn4HgkXB1E-nkDef9-HTsb1jCMPNZGoD9oqxGkS2Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Tuesday, 4 September 2018 17:32:32 EEST Geert Uytterhoeven wrote:
> On Tue, Sep 4, 2018 at 2:10 PM Laurent Pinchart wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > 
> > Add device nodes for I2C ch{0,1,2,3,4,5,6,7} to R-Car E3 R8A77990 device
> > tree.
> > 
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> 
> My
> 
>     Reviewed-by: Geert Uytterhoeven <geert+renesas@xxxxxxxxx>
>     Tested-by: Geert Uytterhoeven <geert+renesas@xxxxxxxxx>
> 
> are still valid.

Sorry for not picking them up. I've included the patch in my series as it's a 
necessary prerequisite, but was expecting it to be merged separately.

-- 
Regards,

Laurent Pinchart
