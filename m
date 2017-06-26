Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33575 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751582AbdFZLpg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Jun 2017 07:45:36 -0400
Received: by mail-io0-f196.google.com with SMTP id j200so12548067ioe.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Jun 2017 04:45:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170621121730.22025-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20170621093133.5677-5-laurent.pinchart+renesas@ideasonboard.com> <20170621121730.22025-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jun 2017 13:45:34 +0200
Message-ID: <CAMuHMdUTn=dtDBs1_NJ+FEPG3oXJzeNzMm9f80Ymn4fe6u3LFQ@mail.gmail.com>
Subject: Re: [PATCH v2.1 4/7] arm64: dts: renesas: r8a7796: Add HDMI encoder instance
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jun 21, 2017 at 2:17 PM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Add the HDMI encoder to the R8A7796 DT in disabled state.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

(disclaimer: I'm no ports/endpoint expert).

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
