Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:35033 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751653AbdITMka (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Sep 2017 08:40:30 -0400
MIME-Version: 1.0
In-Reply-To: <1504737358-23113-1-git-send-email-vladimir.barinov@cogentembedded.com>
References: <1504737267-22829-1-git-send-email-vladimir.barinov@cogentembedded.com>
 <1504737358-23113-1-git-send-email-vladimir.barinov@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Sep 2017 14:40:29 +0200
Message-ID: <CAMuHMdXi7KnV_YFS5LMCazxDrKm_ecxQOm-tsVS1tcv64SViwg@mail.gmail.com>
Subject: Re: [PATCH 07/18] arm64: dts: ulcb-kf: enable SCIF1
To: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vladimir,

On Thu, Sep 7, 2017 at 12:35 AM, Vladimir Barinov
<vladimir.barinov@cogentembedded.com> wrote:
> This supports SCIF1 on ULCB Kingfisher board
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> ---
>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 849f8b1..2449915 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -12,6 +12,7 @@
>  / {
>         aliases {
>                 serial1 = &hscif0;
> +               serial2 = &scif1;
>         };
>  };
>
> @@ -28,4 +29,16 @@
>                 groups = "hscif0_data", "hscif0_ctrl";
>                 function = "hscif0";
>         };
> +
> +       scif1_pins: scif1 {
> +               groups = "scif1_data_b";

As RTS/CTS is wired, you want to add "scif1_ctrl" here...

> +               function = "scif1";
> +       };
> +};
> +
> +&scif1 {
> +       pinctrl-0 = <&scif1_pins>;
> +       pinctrl-names = "default";
> +

... "uart-has-rtscts" here.

> +       status = "okay";
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
