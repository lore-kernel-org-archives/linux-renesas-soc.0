Return-Path: <linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B8ACC64E8A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 30 Nov 2020 13:44:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6F69206D8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 30 Nov 2020 13:44:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726220AbgK3NoR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 30 Nov 2020 08:44:17 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35400 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbgK3NoR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Nov 2020 08:44:17 -0500
Received: by mail-oi1-f196.google.com with SMTP id c80so14181684oib.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Nov 2020 05:44:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2yotst0H5N3sZzmi/sQsfBHJ9yIMaYzCZ3JMJ9Im3Ws=;
        b=Cj+4ZWVx4OyTs4TpKpmU0L0MLffefc54oohKJxh6cnkeJyhHqi2pQuTUXLG5XA/qg8
         h2LyihTLiy1OngD5o5lyoCh270OD8Dzp8Khf9fgUSvDjmIjTBOvipGL+4ZyMu+3ChQ/v
         uIoIFYAsD579iimHsyNnXOuHjJmFKhTrTPKSLPKyMJ/WsA3Wsyk0t3i2fGo8McAdTbfN
         2otdp4VnoAc3kbEmgjcd/o7/uRUViLXw58z2d23XXr89Q4Qz22tnXnzXqoDn1fwKjV6i
         TCVKI3kco5NlcGbupLZCsRXz2l+0IF2R+XutcqeObnxg25DD2u2F70oVTo7c9ukX/UDN
         wmLQ==
X-Gm-Message-State: AOAM531z1eTqEYPyQXs8CQffSCl8ktlSL6/8O62AY8K9XoPL/hRb6uL/
        pqyPCkU4H7+Piq+WBymuEAUfZ1OMqDos1B6Ok7c=
X-Google-Smtp-Source: ABdhPJzszDOhzMuODwIS40Cq458+KogNdsKe9HgzbaVHnsmx/VGRcFVE3gIVD8WAHkjbiC9BXdW6NWmz7o5SB6E32Qk=
X-Received: by 2002:aca:1c0f:: with SMTP id c15mr14582399oic.54.1606743815799;
 Mon, 30 Nov 2020 05:43:35 -0800 (PST)
MIME-Version: 1.0
References: <20201126172154.25625-1-uli+renesas@fpond.eu> <20201126172154.25625-8-uli+renesas@fpond.eu>
In-Reply-To: <20201126172154.25625-8-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 30 Nov 2020 14:43:24 +0100
Message-ID: <CAMuHMdXXAS-jAHXKPcBguwHiARqA968xEW9xeUB-V7bHBKTnOQ@mail.gmail.com>
Subject: Re: [PATCH 07/11] pinctrl: renesas: r8a779a0: Add MSIOF pins, groups
 and functions
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>, hoai.luu.ub@renesas.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Thu, Nov 26, 2020 at 6:22 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This patch adds MSIOF0-5 pins, groups and functions to R8A779A0 (V3U)
> SoC.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

> --- a/drivers/pinctrl/renesas/pfc-r8a779a0.c
> +++ b/drivers/pinctrl/renesas/pfc-r8a779a0.c

> @@ -2256,6 +2520,31 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
>         SH_PFC_PIN_GROUP(mmc_wp),
>         SH_PFC_PIN_GROUP(mmc_ds),
>
> +       SH_PFC_PIN_GROUP(msiof0_clk),
> +       SH_PFC_PIN_GROUP(msiof0_sync),
> +       SH_PFC_PIN_GROUP(msiof0_ss1),
> +       SH_PFC_PIN_GROUP(msiof0_ss2),
> +       SH_PFC_PIN_GROUP(msiof0_txd),
> +       SH_PFC_PIN_GROUP(msiof0_rxd),
> +       SH_PFC_PIN_GROUP(msiof1_clk),
> +       SH_PFC_PIN_GROUP(msiof1_sync),
> +       SH_PFC_PIN_GROUP(msiof1_ss1),
> +       SH_PFC_PIN_GROUP(msiof1_ss2),
> +       SH_PFC_PIN_GROUP(msiof1_txd),
> +       SH_PFC_PIN_GROUP(msiof1_rxd),
> +       SH_PFC_PIN_GROUP(msiof2_clk),
> +       SH_PFC_PIN_GROUP(msiof2_sync),
> +       SH_PFC_PIN_GROUP(msiof2_ss1),
> +       SH_PFC_PIN_GROUP(msiof2_ss2),
> +       SH_PFC_PIN_GROUP(msiof2_txd),
> +       SH_PFC_PIN_GROUP(msiof2_rxd),
> +       SH_PFC_PIN_GROUP(msiof3_clk),
> +       SH_PFC_PIN_GROUP(msiof3_sync),
> +       SH_PFC_PIN_GROUP(msiof3_ss1),
> +       SH_PFC_PIN_GROUP(msiof3_ss2),
> +       SH_PFC_PIN_GROUP(msiof3_txd),
> +       SH_PFC_PIN_GROUP(msiof3_rxd),

What happened to msiof[45]?

> +
>         SH_PFC_PIN_GROUP(scif0_data),
>         SH_PFC_PIN_GROUP(scif0_clk),
>         SH_PFC_PIN_GROUP(scif0_ctrl),
> @@ -2459,6 +2748,42 @@ static const char * const mmc_groups[] = {
>         "mmc_ds",
>  };
>
> +static const char * const msiof0_groups[] = {
> +       "msiof0_clk",
> +       "msiof0_sync",
> +       "msiof0_ss1",
> +       "msiof0_ss2",
> +       "msiof0_txd",
> +       "msiof0_rxd",
> +};
> +
> +static const char * const msiof1_groups[] = {
> +       "msiof1_clk",
> +       "msiof1_sync",
> +       "msiof1_ss1",
> +       "msiof1_ss2",
> +       "msiof1_txd",
> +       "msiof1_rxd",
> +};
> +
> +static const char * const msiof2_groups[] = {
> +       "msiof2_clk",
> +       "msiof2_sync",
> +       "msiof2_ss1",
> +       "msiof2_ss2",
> +       "msiof2_txd",
> +       "msiof2_rxd",
> +};
> +
> +static const char * const msiof3_groups[] = {
> +       "msiof3_clk",
> +       "msiof3_sync",
> +       "msiof3_ss1",
> +       "msiof3_ss2",
> +       "msiof3_txd",
> +       "msiof3_rxd",
> +};

Likewise.

> +
>  static const char * const scif0_groups[] = {
>         "scif0_data",
>         "scif0_clk",
> @@ -2524,6 +2849,11 @@ static const struct sh_pfc_function pinmux_functions[] = {
>
>         SH_PFC_FUNCTION(mmc),
>
> +       SH_PFC_FUNCTION(msiof0),
> +       SH_PFC_FUNCTION(msiof1),
> +       SH_PFC_FUNCTION(msiof2),
> +       SH_PFC_FUNCTION(msiof3),

Likewise.

> +
>         SH_PFC_FUNCTION(scif0),
>         SH_PFC_FUNCTION(scif1),
>         SH_PFC_FUNCTION(scif3),

With the missing entries added:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
