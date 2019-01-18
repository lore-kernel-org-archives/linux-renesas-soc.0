Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1FFC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:16:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 069F420652
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727382AbfARMQq convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 07:16:46 -0500
Received: from mail-vk1-f194.google.com ([209.85.221.194]:38773 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfARMQq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 07:16:46 -0500
Received: by mail-vk1-f194.google.com with SMTP id w72so3021862vkd.5;
        Fri, 18 Jan 2019 04:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8T9TuT3lVvk50kjeFUYGooZzta1JAGcd2CrTDXrQlFM=;
        b=FasesPpZeZVJC39TOLQq84LkykL2Av2eLNIJ0+ESXcquNMFxs5dYLDDHrIxjS3Uekz
         B9izm4NIUBzAotF8glclFTNH4ckB41VQ16/uC9gN4ZToKeQwHOOtvlATDS8LLJbHKhsd
         tQw3TVHJTZ8xG8VuBejou1bdY/haeMrjXUgbD1RCj1ZOMQAPbuKtaPHGyuaWsKExFL3M
         v6JT6DfsKKBHZ8zVF5HmicURerZvOxJ3YDjkQ8iCdL6ySMLPHZIDRUUMsca12/PUGvzJ
         ZoMrPxBwwAomOa0YgSxGLruUSUyX7iv/+K1b0vKZ4klug16YCxWIDlWvuMQnvSoBpza/
         VJfg==
X-Gm-Message-State: AJcUuke4nxqLoFcGyoIJrfCcVe4p3R3+ziVelfES43uyLZ4xw5cbLGF5
        Vxi1A4yiZ629auaxS6tIbZNzdo+c8BrfOduy+ys=
X-Google-Smtp-Source: ALg8bN7w6YHP5FSxi1rqlFjOyDdbvBt1k5jEDRAByqyXbXDGcbJA+rGKNd3JX6InZMLDdU3e9QNfC9X0qukL5tv1Egc=
X-Received: by 2002:a1f:2145:: with SMTP id h66mr7504185vkh.65.1547813805031;
 Fri, 18 Jan 2019 04:16:45 -0800 (PST)
MIME-Version: 1.0
References: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu> <1547808495-19509-2-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1547808495-19509-2-git-send-email-uli+renesas@fpond.eu>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 18 Jan 2019 13:16:33 +0100
Message-ID: <CAMuHMdWE2kq9WMYD4C2OJS99GQZpe-wUwx5c4vKizZaancP1WQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7779: add HSCIF0/1 pins
To:     Ulrich Hecht <uli+renesas@fpond.eu>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uli,

On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> Adds HSCIF0 and HSCIF1 pins, groups and functions for R8A7779.
>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Thanks for your patch!

> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7779.c
> @@ -1595,6 +1595,80 @@ static const unsigned int ether_magic_pins[] = {
>  static const unsigned int ether_magic_mux[] = {
>         ETH_MAGIC_MARK,
>  };
> +/* - HSCIF0 ----------------------------------------------------------------- */
> +static const unsigned int hscif0_data_pins[] = {
> +       RCAR_GP_PIN(4, 20), RCAR_GP_PIN(4, 21)

Can you please add TXD, RXD etc. comments, like are present for all other pin
groups?

> +static const unsigned int hscif1_b_clk_pins[] = {

error: ‘hscif1_clk_b_pins’ undeclared here

hscif1_clk_b_pins

> +       RCAR_GP_PIN(2, 4)
> +};
> +static const unsigned int hscif1_b_clk_mux[] = {

hscif1_clk_b_mux

> +       HSCK1_B_MARK
> +};
>  /* - HSPI0 ------------------------------------------------------------------ */
>  static const unsigned int hspi0_pins[] = {
>         /* CLK, CS, RX, TX */

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
