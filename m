Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:41635 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750737AbdLNIwR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Dec 2017 03:52:17 -0500
Received: by mail-qk0-f196.google.com with SMTP id 84so5345070qks.8
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Dec 2017 00:52:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <29f0046ac6a6e4f9337aa66c912d99fa4a30d592.1513206331.git-series.kieran.bingham@ideasonboard.com>
References: <cover.1a04e7d4a0006d06c345704eb5332e82c73312ee.1513206331.git-series.kieran.bingham@ideasonboard.com>
 <29f0046ac6a6e4f9337aa66c912d99fa4a30d592.1513206331.git-series.kieran.bingham@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Dec 2017 09:52:16 +0100
Message-ID: <CAMuHMdX2d8Ak6iekZXH9CO6kcnrM-eA=n5phNCnkh_OZWpK1sw@mail.gmail.com>
Subject: Re: [PATCH 4/4] kms++util: Add frame compare functionality
To: Kieran Bingham <kbingham@kernel.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Kieran,

On Thu, Dec 14, 2017 at 12:10 AM, Kieran Bingham <kbingham@kernel.org> wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> Provide a means to compare two identically sized framebuffers.
>
> This basic implementation expects the two buffers to have the same
> formats and sizes, and will return zero for identical frames, or a
> positive float representing and average difference otherwise.

an

> --- a/kms++util/src/verification.cpp
> +++ b/kms++util/src/verification.cpp
> @@ -18,4 +18,35 @@ void save_raw_frame(IFramebuffer& fb, const char *filename)
>                 os->write((char*)fb.map(i), fb.size(i));
>  }
>
> +float compare_framebuffers(IFramebuffer& a, IFramebuffer& b)
> +{

> +       // This expects a frame to be identical, including non-visible data.
> +       for (i = 0; i < a.size(0) && i < b.size(0); i++)
> +               diff += abs(pa[i] - pb[i]);

I think it's better to use "diff += abs(pa[i] - pb[i]) * abs(pa[i] - pb[i])",
to penalize larger differences.

See also https://en.wikipedia.org/wiki/Peak_signal-to-noise_ratio

> +
> +       return diff / pixels;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
