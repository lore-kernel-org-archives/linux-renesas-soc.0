Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:49335 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030470AbdIZLur (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Sep 2017 07:50:47 -0400
Received: by mail-wm0-f67.google.com with SMTP id r74so6925209wme.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Sep 2017 04:50:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170926100605.2313-12-laurent.pinchart+renesas@ideasonboard.com>
References: <20170926100605.2313-1-laurent.pinchart+renesas@ideasonboard.com> <20170926100605.2313-12-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 Sep 2017 13:50:46 +0200
Message-ID: <CAMuHMdXQ8J1cfGMnyAwhkxNQKCvR95gHESzxZswKrwoKMG_U9g@mail.gmail.com>
Subject: Re: [RFC 09/13] v4l: rcar-fcp: Configure the number of outstanding
 read transactions
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Tue, Sep 26, 2017 at 12:06 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The FCPV has a selectable number of outstanding read transactions.
> According to the documentation the value must be set based on the type
> of the VSP the FCPV is connected to. Set the register accordingly at
> probe time.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> @@ -228,12 +236,29 @@ static int rcar_fcp_setup(struct rcar_fcp_device *fcp)
>         dev_dbg(fcp->dev, "%s %s device found\n", models[fcp->type],
>                 versions[i].name);
>
> +       /* Set the processing mode (needed for FCPV only). */
> +       switch (fcp->type) {
> +       case RCAR_FCPV:
> +               /* 64 outstanding read transactions */
> +               rcar_fcp_write(fcp, FCP_CFG0, 0);
> +               break;
> +
> +       case RCAR_FCPVI:
> +               /* 16 outstanding read transactions */
> +               rcar_fcp_write(fcp, FCP_CFG0, FCP_CFG0_FCPVSEL);
> +               break;
> +
> +       default:
> +               break;
> +       }
> +
>         return 0;
>  }
>
>  static const struct of_device_id rcar_fcp_of_match[] = {
>         { .compatible = "renesas,fcpf", .data = (void *)RCAR_FCPF },
>         { .compatible = "renesas,fcpv", .data = (void *)RCAR_FCPV },
> +       { .compatible = "renesas,fcpvi", .data = (void *)RCAR_FCPVI },
>         { },

As you use "renesas,fcpv" as a fallback value, you may want to insert
the new and more specific "renesas,fvpci" handling above it, for clarity.

I believe it will return the RCAR_FCPVI match data anyway, based on
a higher match score for the more specific compatible value?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
