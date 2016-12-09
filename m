Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36165 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751599AbcLIJmC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Dec 2016 04:42:02 -0500
Received: by mail-io0-f193.google.com with SMTP id b194so5640821ioa.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 09 Dec 2016 01:42:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1481129067-21949-1-git-send-email-ulrich.hecht+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 9 Dec 2016 10:42:01 +0100
Message-ID: <CAMuHMdVrrTPMb6HBhPX1jyPgUGnBgv08eZkrSVbq1zFAQ1_eNA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] r8a7796 SCIF integration
To: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Ulrich,

On Wed, Dec 7, 2016 at 5:44 PM, Ulrich Hecht
<ulrich.hecht+renesas@gmail.com> wrote:
> This revision fixes the completely incorrect DMA assignments (must have
> looked in the wrong datasheet), and adds dmac2 references and Reviewed-bys
> where appropriate.

You mean the dmas for SCIF2?
They are not (no longer?) present in the datasheet, but they do seem to work, on
both H3 and M3-W.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
