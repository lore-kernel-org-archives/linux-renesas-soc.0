Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170719062220.wefnkqhd7javbcee@pengutronix.de>
References: <20170718214339.7774-1-robh@kernel.org> <20170719062220.wefnkqhd7javbcee@pengutronix.de>
From: Rob Herring <robh@kernel.org>
Date: Wed, 19 Jul 2017 10:35:20 -0500
Message-ID: <CAL_JsqK1Y3xhZwNxme934UF_t=6ZdSyqBtrMmceUC798ftL+mQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: Convert to using %pOF instead of full_name
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?=
        <u.kleine-koenig@pengutronix.de>
Cc: "arm@kernel.org" <arm@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiko Stuebner <heiko@sntech.de>,
        Tony Lindgren <tony@atomide.com>,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Jason Cooper <jason@lakedaemon.net>,
        Simon Horman <horms@verge.net.au>,
        Gregory Clement <gregory.clement@free-electrons.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Paul Walmsley <paul@pwsan.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 19, 2017 at 1:22 AM, Uwe Kleine-König
<u.kleine-koenig@pengutronix.de> wrote:
> On Tue, Jul 18, 2017 at 04:42:41PM -0500, Rob Herring wrote:
>> Now that we have a custom printf format specifier, convert users of
>> full_name to use %pOF instead. This is preparation to remove storing
>
> Oh nice. If the commit adding %pOF is already set in stone, i'd suggest
> to mention the commit id here in the commit log.

It is in 4.13, but I'm not really eager to update all 60 patches and
I'd prefer consistency in the commit msg as quite a few have already
been applied.

>> of the full path string for each node.

[...]

>> @@ -103,8 +103,8 @@ void __init arm_dt_init_cpu_maps(void)
>>                */
>>               cell = of_get_property(cpu, "reg", &prop_bytes);
>>               if (!cell || prop_bytes < sizeof(*cell)) {
>> -                     pr_debug(" * %s missing reg property\n",
>> -                                  cpu->full_name);
>> +                     pr_debug(" * %pOF missing reg property\n",
>> +                                  cpu);
>
> You could join lines here and in the next hunk. And there are two more
> further down.

Okay. I did that generally, but missed a few.

Rob
