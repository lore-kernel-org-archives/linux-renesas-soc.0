Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB11650F50D93653212039A4348A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdVHh_40pup1G-1qohS+wEYCFEn6jvOTCnYideQWMxSVLw@mail.gmail.com>
 <SG2PR06MB1165D46E83254B1757C790498A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdU2CvipQQQ8-wxsiniHZJQmUMHv-t52Pw=sHD3YTd7Yug@mail.gmail.com> <SG2PR06MB11650F50D93653212039A4348A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 5 May 2017 14:06:01 +0200
Message-ID: <CACRpkdbMpbr_eBnTYA+mBFN4YHUnn2VyuK8PGxz2-Cykv2j83w@mail.gmail.com>
Subject: Re: [PATCH v5 10/10] arm: dts: genmai: Add ethernet pin group
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 28, 2017 at 4:48 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:

I think this was written by me, not Geert...

>> DT describes hardware, not software limitations.
>
> Describing things is fine, but the kernel code takes the DT and then start configuring things based on it.
>
> For example, on the RSK board, that line is connected to P4_14. P4_14 can be configured as IRQ6...but IRQ6 comes out in 8 different pin choices, and I might want to use one of those other choices, so I don't want to describe P4_14 as an interrupt.
>
> If it was just describing that "pin 15 of the PHY chip is tied to pin Y19 of the RZ/A1H", that's fine because it's hardware connection that's not going to change.
> But...the DT also defines the pin muxing...which is a software decision (do I want to get interrupt or just manually poll or simple ignore it).
> This is the part of the whole "DT is for hardware description only" that doesn't really make sense to me.

OK yeah we do hardware description AND configuration.

And we never do interpreted languages.

And then there is a bunch of grayzone things. For example we have
a linux,input binding for connecting keypresses to certain Linux input
codes. That is really grayzone, but very useful.

Yours,
Linus Walleij
