Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20170329173035.67477-5-chris.brandt@renesas.com>
References: <20170329173035.67477-1-chris.brandt@renesas.com> <20170329173035.67477-5-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Mar 2017 10:46:22 +0200
Message-ID: <CAMuHMdXvU7LQAH6h8StLqQdc4cD1kqr97Ajry18SNO61GCxn4Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] ARM: dts: r7s72100: add RTC_X clock inputs to
 device tree
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        RTCLINUX <rtc-linux@googlegroups.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 29, 2017 at 7:30 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> Add the RTC clocks to device tree. The frequencies must be fixed values
> according to the hardware manual.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
