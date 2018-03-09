Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f180.google.com ([209.85.216.180]:46677 "EHLO
        mail-qt0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751096AbeCIM73 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Mar 2018 07:59:29 -0500
Received: by mail-qt0-f180.google.com with SMTP id m13so10517908qtg.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Mar 2018 04:59:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1550269.Ny8GyIV5Bq@avalon>
References: <1550269.Ny8GyIV5Bq@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Mar 2018 13:59:28 +0100
Message-ID: <CAMuHMdVtU-UJmtLv-f2uiYJ-3LOztR4qGDCQ7AS4L2JMUFgv7A@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] VSP1 dynamic BRU/BRS allocation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Wed, Mar 7, 2018 at 8:45 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The following changes since commit 15ea2df9143729a2b722d4ca2b52cfa14a819d8e:
>
>   media: ov2685: mark PM functions as __maybe_unused (2018-02-26 10:38:56
> -0500)
>
> are available in the Git repository at:
>
>   git://linuxtv.org/pinchartl/media.git tags/v4l2-vsp1-bru-brs-v1-20180226
>
> for you to fetch changes up to 66de53df73042978c8560a2a596a4e9b7a6bb485:
>
>   v4l: vsp1: Rename BRU to BRx (2018-03-07 21:41:34 +0200)

Thank you, merges cleanly into today's linux-next.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
