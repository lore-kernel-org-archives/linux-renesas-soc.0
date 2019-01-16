Return-Path: <SRS0=SHeS=PY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80969C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 16:38:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 561F220657
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 16 Jan 2019 16:38:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387576AbfAPQiq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 16 Jan 2019 11:38:46 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:40172 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726593AbfAPQip (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jan 2019 11:38:45 -0500
Received: by mail-vk1-f194.google.com with SMTP id v70so1560857vkv.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Jan 2019 08:38:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gIWNyo1TV2KT/WwMRruVbcV0L6SPStUCAsYe9uAl2q0=;
        b=DAGHbsfgDDL3uMp7cXKDXeKqK661KYTu+j2t4o1Ps0c/+RuNab2JfU29QpM5bId363
         oLKdd/IVotFiai3yk1aQ/+2ONXY1Fh2i284P6rBpenVSaZTImNgiiDB+xO/GjrVsNWwb
         qOqBQDSBmHaU1iDpro0M23i8u87IAfpai8KMxCSWDXxIMcufWmr0k2sie+DZnXM1xURC
         /aza/GjzScJ7VvW9ARjqB2ez4WWg2zH3U8P5vZgRDH3Xw21pbq5XDYPh6fStWbQB4M7S
         uXv5OtYqb3YwMcV8DTkwVT2f2SdL38Jx7iQaKi4Xa6ErMncibhPrbPpvAhsJLD2YBmVM
         A/KQ==
X-Gm-Message-State: AJcUukdd1M9sgYq//wpRX6rfFosxd9S1Ua3yXpfYm5n//ZNH0zDfsz39
        hM12fC3VnVyGFF5tVsxDXBvGEej/0ycmcd3piYk=
X-Google-Smtp-Source: ALg8bN4Y+exG2v5XZiolYuo5vPbe1X+ICc+GGY+hWfT16yNjFxBz/siZBcMLPvcyDiWbZtcBrihSFuH5gOyXjcfSILg=
X-Received: by 2002:a1f:a414:: with SMTP id n20mr3948263vke.83.1547656723809;
 Wed, 16 Jan 2019 08:38:43 -0800 (PST)
MIME-Version: 1.0
References: <1547553668-4359-1-git-send-email-ykaneko0929@gmail.com>
In-Reply-To: <1547553668-4359-1-git-send-email-ykaneko0929@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 16 Jan 2019 17:38:31 +0100
Message-ID: <CAMuHMdVcXjeOGr-Xtvhyi5G2d7Y4Gi-raBPK+Qja02-KxBE0wQ@mail.gmail.com>
Subject: Re: [PATCH/RFT] pinctrl: sh-pfc: r8a77990: Add DRIF pins, groups and functions
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kaneko-san,

On Tue, Jan 15, 2019 at 1:01 PM Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds DRIF{0,1,2,3} pins, groups and functions to the R8A77990
> SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a77990.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77990.c

> @@ -3523,7 +3716,7 @@ enum {
>  };
>
>  static const struct {
> -       struct sh_pfc_pin_group common[241];
> +       struct sh_pfc_pin_group common[262];
>         struct sh_pfc_pin_group automotive[2];
>  } pinmux_groups = {
>         .common = {
> @@ -3555,6 +3748,27 @@ enum {
>                 SH_PFC_PIN_GROUP(can0_data),
>                 SH_PFC_PIN_GROUP(can1_data),
>                 SH_PFC_PIN_GROUP(can_clk),
> +               SH_PFC_PIN_GROUP(drif0_ctrl_a),
> +               SH_PFC_PIN_GROUP(drif0_data0_a),
> +               SH_PFC_PIN_GROUP(drif0_data1_a),
> +               SH_PFC_PIN_GROUP(drif0_ctrl_b),
> +               SH_PFC_PIN_GROUP(drif0_data0_b),
> +               SH_PFC_PIN_GROUP(drif0_data1_b),
> +               SH_PFC_PIN_GROUP(drif1_ctrl),
> +               SH_PFC_PIN_GROUP(drif1_data0),
> +               SH_PFC_PIN_GROUP(drif1_data1),
> +               SH_PFC_PIN_GROUP(drif2_ctrl_a),
> +               SH_PFC_PIN_GROUP(drif2_data0_a),
> +               SH_PFC_PIN_GROUP(drif2_data1_a),
> +               SH_PFC_PIN_GROUP(drif2_ctrl_b),
> +               SH_PFC_PIN_GROUP(drif2_data0_b),
> +               SH_PFC_PIN_GROUP(drif2_data1_b),
> +               SH_PFC_PIN_GROUP(drif3_ctrl_a),
> +               SH_PFC_PIN_GROUP(drif3_data0_a),
> +               SH_PFC_PIN_GROUP(drif3_data1_a),
> +               SH_PFC_PIN_GROUP(drif3_ctrl_b),
> +               SH_PFC_PIN_GROUP(drif3_data0_b),
> +               SH_PFC_PIN_GROUP(drif3_data1_b),

As RZ/G2E (r8a774c0) does not have the DRIF modules, the DRIF pin groups
should be added to the automotive section, instead of the common section.

>                 SH_PFC_PIN_GROUP(du_rgb666),
>                 SH_PFC_PIN_GROUP(du_rgb888),
>                 SH_PFC_PIN_GROUP(du_clk_in_0),

> @@ -4157,7 +4404,7 @@ enum {
>  };
>
>  static const struct {
> -       struct sh_pfc_function common[44];
> +       struct sh_pfc_function common[48];
>         struct sh_pfc_function automotive[2];
>  } pinmux_functions = {
>         .common = {
> @@ -4166,6 +4413,10 @@ enum {
>                 SH_PFC_FUNCTION(can0),
>                 SH_PFC_FUNCTION(can1),
>                 SH_PFC_FUNCTION(can_clk),
> +               SH_PFC_FUNCTION(drif0),
> +               SH_PFC_FUNCTION(drif1),
> +               SH_PFC_FUNCTION(drif2),
> +               SH_PFC_FUNCTION(drif3),

Likewise for the DRIF pin functions.

>                 SH_PFC_FUNCTION(du),
>                 SH_PFC_FUNCTION(hscif0),
>                 SH_PFC_FUNCTION(hscif1),

The rest looks good to me, so with the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
