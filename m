Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:35050 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751257AbdGQH2L (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jul 2017 03:28:11 -0400
MIME-Version: 1.0
In-Reply-To: <1500270596-22384-1-git-send-email-krzk@kernel.org>
References: <1500270596-22384-1-git-send-email-krzk@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Jul 2017 09:28:09 +0200
Message-ID: <CAMuHMdUnFCUKQdEcyFiKzVgkL5__ZLRMudCvkRxp6cBXgV6g=g@mail.gmail.com>
Subject: Re: [PATCH 1/6] ARM: multi_v7_defconfig: Cleanup from non-existing options
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Krzysztof,

On Mon, Jul 17, 2017 at 7:49 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Remove options which do not exist anymore:

<snip>

>  - DRM_RCAR_HDMI was merged to generic DRM bridge and is obsolete since
>    commit 5c602531feb3 ("drm: rcar-du: Replace manual bridge
>    implementation with DRM bridge");
>
>  - SND_SOC_RSRC_CARD was replaced by SND_SIMPLE_SCU_CARD in commit
>    d12c6216c4a5 ("ASoC: rsrc-card: rename rsrc-card to simple-scu-card
>    phase3");

These have already be fixed in the defconfig-for-v4.14 branch Simon Horman's
tree (git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git).
They're not yet in -next as v4.13-rc1 wasn't released at that time, and
Simon is noew on holidays.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
