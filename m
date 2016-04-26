Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34880 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752236AbcDZTMq (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 15:12:46 -0400
MIME-Version: 1.0
In-Reply-To: <1461686127-3217-2-git-send-email-wsa@the-dreams.de>
References: <1461686127-3217-1-git-send-email-wsa@the-dreams.de>
	<1461686127-3217-2-git-send-email-wsa@the-dreams.de>
Date: Tue, 26 Apr 2016 21:12:45 +0200
Message-ID: <CAMuHMdVNyeWn0esmetidN2sUMKKiWV6Q_ze8jQLB40VibT2CDw@mail.gmail.com>
Subject: Re: [PATCH V2 1/6] mmc: sh_mobile_sdhi: don't use array for DT configs
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Simon Horman <horms@verge.net.au>,
	Ulf Hansson <ulf.hansson@linaro.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Tue, Apr 26, 2016 at 5:55 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> --- a/drivers/mmc/host/sh_mobile_sdhi.c
> +++ b/drivers/mmc/host/sh_mobile_sdhi.c
> @@ -81,9 +79,9 @@ static const struct sh_mobile_sdhi_of_data of_rcar_gen3_compatible = {
>  static const struct of_device_id sh_mobile_sdhi_of_match[] = {
>         { .compatible = "renesas,sdhi-shmobile" },
>         { .compatible = "renesas,sdhi-sh7372" },

Care to receive bonus points for removing the compatible value for the
no longer supported sh7372 SoC?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
