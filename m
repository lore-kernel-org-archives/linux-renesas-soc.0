Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:32889 "EHLO
	mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752156AbcF1JgX (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 28 Jun 2016 05:36:23 -0400
Received: by mail-oi0-f65.google.com with SMTP id w141so1814721oia.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Jun 2016 02:36:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467106492-1341-5-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1467106492-1341-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1467106492-1341-5-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Tue, 28 Jun 2016 11:36:21 +0200
Message-ID: <CAO3366wnwkwki=O5xeAcvkzP0W_t3FnDUA-CE=UuJvACQcrvdQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] arm64: dts: r8a7795: salvator: add serial console pins
To: linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

That should have said r8a7796, of course... :(

CU
Uli

On Tue, Jun 28, 2016 at 11:34 AM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Adds pin control for SCIF2.
>
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> index 9c52613..10fceaf 100644
> --- a/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dts
> @@ -31,11 +31,20 @@
>         };
>  };
>
> +&pfc {
> +       scif2_pins: scif2 {
> +               groups = "scif2_data_a";
> +               function = "scif2";
> +       };
> +};
> +
>  &extal_clk {
>         clock-frequency = <16666666>;
>  };
>
>  &scif2 {
> +       pinctrl-0 = <&scif2_pins>;
> +       pinctrl-names = "default";
>         status = "okay";
>  };
>
> --
> 2.7.4
>
