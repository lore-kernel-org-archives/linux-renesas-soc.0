Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:36537 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754255AbdCMQ5G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2017 12:57:06 -0400
Received: by mail-lf0-f46.google.com with SMTP id y193so66204360lfd.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 13 Mar 2017 09:57:05 -0700 (PDT)
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and
 hscif4_ctrl
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
 <1489423302-21296-2-git-send-email-geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <e5214bac-7bf9-1897-cf9f-f4735e6985e9@cogentembedded.com>
Date: Mon, 13 Mar 2017 19:57:02 +0300
MIME-Version: 1.0
In-Reply-To: <1489423302-21296-2-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/13/2017 07:41 PM, Geert Uytterhoeven wrote:

> Fix typos in hscif2_clk_[bc]_mux[] and hscif4_ctrl_mux[].

    Only seeing hscif2_clk_b_mux[] fix...

> Fixes: a56069c46c102710 ("pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> index 504d0c3d7f741849..6ba7ed15a4610366 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> @@ -2167,7 +2167,7 @@ static const unsigned int hscif2_clk_b_pins[] = {
>  	RCAR_GP_PIN(6, 21),
>  };
>  static const unsigned int hscif2_clk_b_mux[] = {
> -	HSCK1_B_MARK,
> +	HSCK2_B_MARK,
>  };
>  static const unsigned int hscif2_ctrl_b_pins[] = {
>  	/* RTS, CTS */
[...]

MBR, Sergei
