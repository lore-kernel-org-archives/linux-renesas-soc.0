Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33758 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750801AbcLMJko (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Dec 2016 04:40:44 -0500
Received: by mail-io0-f196.google.com with SMTP id p13so27422217ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Dec 2016 01:40:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481129088-22026-3-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481129088-22026-1-git-send-email-ulrich.hecht+renesas@gmail.com> <1481129088-22026-3-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Dec 2016 10:40:42 +0100
Message-ID: <CAMuHMdVdH9qXsb0qEpknWvU9faic4vviaKTuqKgLWWAjur_ZzA@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] pinctrl: sh-pfc: r8a7796: Add HSCIF pins, groups,
 and functions
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 7, 2016 at 5:44 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
> ---
>  drivers/pinctrl/sh-pfc/pfc-r8a7796.c | 283 +++++++++++++++++++++++++++++++++++
>  1 file changed, 283 insertions(+)
>
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> index dc9b671..ed4a877 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7796.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a7796.c

> +/* - HSCIF4 ----------------------------------------------------------------- */

> +static const unsigned int hscif4_ctrl_mux[] = {
> +       HRTS4_N_MARK, HCTS3_N_MARK,

HCTS4_N_MARK

Fixing up...

> +};

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
