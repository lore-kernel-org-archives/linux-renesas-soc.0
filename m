Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB1165D80A4642F5A2F27FB6AA8AEB0@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <1493281194-5200-1-git-send-email-jacopo+renesas@jmondi.org>
 <1493281194-5200-11-git-send-email-jacopo+renesas@jmondi.org>
 <CAMuHMdVHh_40pup1G-1qohS+wEYCFEn6jvOTCnYideQWMxSVLw@mail.gmail.com>
 <SG2PR06MB1165D46E83254B1757C790498A100@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CAMuHMdU2CvipQQQ8-wxsiniHZJQmUMHv-t52Pw=sHD3YTd7Yug@mail.gmail.com>
 <SG2PR06MB11650F50D93653212039A4348A130@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <CACRpkdbMpbr_eBnTYA+mBFN4YHUnn2VyuK8PGxz2-Cykv2j83w@mail.gmail.com> <SG2PR06MB1165D80A4642F5A2F27FB6AA8AEB0@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 11 May 2017 15:48:55 +0200
Message-ID: <CACRpkdb4-nDs2dPMgn5EBHqibeiKAcjKfiDyG3cu5y13nM3CCg@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 5, 2017 at 2:45 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, May 05, 2017, Linus Walleij wrote:
>> > This is the part of the whole "DT is for hardware description only" that
>> doesn't really make sense to me.
>>
>> OK yeah we do hardware description AND configuration.
>>
>> And we never do interpreted languages.
>>
>> And then there is a bunch of grayzone things. For example we have a
>> linux,input binding for connecting keypresses to certain Linux input codes.
>> That is really grayzone, but very useful.
>
> Ah....
>
>         compatible = "linux,grayzone";
>
> Thanks for the reply. I'll stop ranting now.
> Of course, I'll still probably screw it up again on a future patch somehow...

For this driver I remarked in some other thread that we may
end up with some

"renesas,bidirectional"

or so. But yeah, it's kinda grayzone too.

Yours,
Linus Walleij
