Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f43.google.com ([74.125.83.43]:38343 "EHLO
        mail-pg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751370AbdHPOdi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Aug 2017 10:33:38 -0400
Received: by mail-pg0-f43.google.com with SMTP id l64so23684080pge.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Aug 2017 07:33:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <2356788.ZAuqMOLJcJ@avalon>
References: <2356788.ZAuqMOLJcJ@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Aug 2017 16:33:37 +0200
Message-ID: <CAMuHMdUrC6_1A_w1+v=16JdcdVca0OJ_7k8Nas7cujTFBhhZzg@mail.gmail.com>
Subject: Re: [GIT PULL FOR renesas-drivers] R-Car H3 ES2.0 display support, v2
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Mon, Jun 26, 2017 at 8:58 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> The following changes implement display support for the R-Car H3 ES2.0. They
> have been split in two distinct branches:

> - tags/drm-h3-es2-vsp-du-20170626 contains the VSP changes and is based on top
> of the latest DRM -next branch
>
> The following changes since commit 047b8e21e3bfa9faa4ed9a0c337fe0c687710251:
>
>   Merge tag 'drm-misc-next-2017-06-19_0' of
> git://anongit.freedesktop.org/git/drm-misc into drm-next (2017-06-21 08:57:34
> +1000)
>
> are available in the git repository at:
>
>   git://linuxtv.org/pinchartl/media.git tags/drm-h3-es2-vsp-du-20170626
>
> for you to fetch changes up to 8d09cbf4a12a4c79619c0edf23f9e219e29f5749:
>
>   drm: rcar-du: Configure DPAD0 routing through last group on Gen3 (2017-06-26
> 19:08:54 +0300)

Dropped, as it looks like a newer version has been merged upstream.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
