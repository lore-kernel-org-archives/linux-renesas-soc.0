Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36231 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757491AbcLAOms (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 09:42:48 -0500
MIME-Version: 1.0
In-Reply-To: <20161201140642.28583-1-chris.brandt@renesas.com>
References: <20161201140642.28583-1-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Dec 2016 15:42:46 +0100
Message-ID: <CAMuHMdU80M2qcK74YgPC8SZ20tNcKrZhj7MXo_Ok=6m4Aa0=-w@mail.gmail.com>
Subject: Re: [PATCH v2] sh_eth: remove unchecked interrupts
To: Chris Brandt <chris.brandt@renesas.com>
Cc: David Miller <davem@davemloft.net>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Chris,

On Thu, Dec 1, 2016 at 3:06 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> --- a/drivers/net/ethernet/renesas/sh_eth.c
> +++ b/drivers/net/ethernet/renesas/sh_eth.c
> @@ -518,7 +518,7 @@ static struct sh_eth_cpu_data r7s72100_data = {
>
>         .ecsr_value     = ECSR_ICD,
>         .ecsipr_value   = ECSIPR_ICDIP,
> -       .eesipr_value   = 0xff7f009f,
> +       .eesipr_value   = 0xe77f009f,

Comment not directly related to the merits of this patch: the EESIPR bit
definitions seem to be identical to those for EESR, so we can get rid of the
hardcoded values here?

>
>         .tx_check       = EESR_TC1 | EESR_FTC,
>         .eesr_err_check = EESR_TWB1 | EESR_TWB | EESR_TABT | EESR_RABT |

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
