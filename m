Return-Path: <devicetree-owner@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20180105224647.42262-1-chris.brandt@renesas.com>
References: <20180105224647.42262-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Jan 2018 08:36:39 +0100
Message-ID: <CAMuHMdV+1Y+OozRa0P2MJZQ-rT+ZfmW4iy2AYya1EMgrjb+y8Q@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] usb: renesas_usbhs: Add RZ/A1 support
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        USB list <linux-usb@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        devicetree@vger.kernel.org,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Fri, Jan 5, 2018 at 11:46 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> This series adds RZ/A1 gadget support to the renesas_usbhs driver.
> Basically, it's almost the same HW as the R-Car (and SH) parts.
> The only real difference is the some extra registers for the PHY.
>
> This was tested on an RSK board by connecting to a PC as an
> Ethernet CDC gadget.
>
> v3:
>  * Changed from "renesas,usbhs-r7s72100" to "renesas,rza1-usbhs"
>  * Removed "renesas,usbhs-r7s72100"
>  * Changed License of rza.c

Thanks for the update, but I think there has been a misunderstanding.
I didn't mean to drop "renesas,usbhs-r7s72100" everywhere, only from
the matching in the driver.

Summarized:
1. DT bindings should document _all_ compatible values (SoC-specific,
   and/or family-specific, generic, ...),
2. DTS should list _all applicable_ compatible values, ordered from
    most-specific to least-specific,
3. Drivers should match against the least-specific compatible value to get
   the job done.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
