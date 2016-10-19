Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f172.google.com ([209.85.223.172]:33687 "EHLO
        mail-io0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S942016AbcJSOkp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2016 10:40:45 -0400
Received: by mail-io0-f172.google.com with SMTP id q192so33876587iod.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Oct 2016 07:40:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1476829382-14785-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1476829382-14785-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Oct 2016 09:09:09 +0200
Message-ID: <CAMuHMdVDnqzcThuiF+7ztaY9CTiAK-6YDq1+PhH1hrHFLoJAyQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: r8a7779: Fix DU reg property
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 19, 2016 at 12:23 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The system uses one address cell and one size cell, not two. Fix the DU
> DT node.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
