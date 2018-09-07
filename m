Return-Path: <SRS0=dCSK=LV=jinso.co.jp=na-hoan@vergenet.net>
From: Nguyen An Hoan <na-hoan@jinso.co.jp>
To: broonie@kernel.org, linux-renesas-soc@vger.kernel.org,
        geert+renesas@glider.be, horms+renesas@verge.net.au
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        h-inayoshi@jinso.co.jp, nv-dung@jinso.co.jp, cv-dong@jinso.co.jp,
        na-hoan@jinso.co.jp
Subject: Re: arm64: dts: salvator-common: Add PWM-2 channel
Date: Fri,  7 Sep 2018 17:56:59 +0900
Message-Id: <1536310619-30936-1-git-send-email-na-hoan@jinso.co.jp>
In-Reply-To: <1535535207-2800-2-git-send-email-na-hoan@jinso.co.jp　--cc=magnus.damm@gmail.com>
References: <1535535207-2800-2-git-send-email-na-hoan@jinso.co.jp　--cc=magnus.damm@gmail.com>
List-ID: <linux-renesas-soc.vger.kernel.org>


Dear Geert-san, Thank you very much for your comments!
CC: Simon-san

> Hi Hoan,
> 
> On Wed, Aug 29, 2018 at 11:33 AM Nguyen An Hoan <na-hoan@jinso.co.jp> wrote:
> > From: Hoan Nguyen An <na-hoan@jinso.co.jp>
> >
> > Add PWM-2 channel(CN28 - pin30) support for Salvator-X
> 
> Thanks for your patch!
> 
> Please explain why this is useful. Usually we do not enable random functionality
> on expansion connectors.

> In this case, this even has an (undocumented) impact on on-board devices,
> as the signal is also connected to the BD9571MWV PMIC.
> (Perhaps that was the actual intention of this patch? ;-) If yes,
> please explain)

> Thanks!

> Gr{oetje,eeting}s,

>                         Geert
> 


On this issue, with H3/M3 SoC there are 7 PWM channels but only 2 channels are supported: PWM1, PWM2. While PWM1 is connected to CN19 for LVDS service. So only remaining PWM2, I think simple, if you want to generate a signal with variable frequency and pulse width using M3/H3 (I used for testting Addition Tasks) then forced to use PWM2. Although I'm not sure the H3/M3 boards are not purposeful to use the PWM functions.

Thanks you!
Hoan
