Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:36127 "EHLO
        mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751443AbcKNPWh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 10:22:37 -0500
Received: by mail-yw0-f194.google.com with SMTP id r204so7084549ywb.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Nov 2016 07:22:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWwSF4-LaqBe_PWvvROkjgMeJPaPZh4uxQcx0j4rGBCuw@mail.gmail.com>
References: <1478884066-1090-1-git-send-email-ulrich.hecht+renesas@gmail.com> <CAMuHMdWwSF4-LaqBe_PWvvROkjgMeJPaPZh4uxQcx0j4rGBCuw@mail.gmail.com>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Mon, 14 Nov 2016 16:22:35 +0100
Message-ID: <CAO3366x-s_vipgvMv6Kp4aRjX+13SUbFwssfBDauOZRWSgqPNw@mail.gmail.com>
Subject: Re: [PATCH 00/10] Renesas R8A7795/Salvator-X HDMI output
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        David Airlie <airlied@linux.ie>,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 14, 2016 at 11:16 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Uli,
>
> On Fri, Nov 11, 2016 at 6:07 PM, Ulrich Hecht
> <ulrich.hecht+renesas@gmail.com> wrote:
>> This implements HDMI output support for the Renesas R8A7795 (H3) SoC and
>> Salvator-X board.  It is based on mainline v4.9-rc4 and depends on Geert's
>> "[PATCH v2 0/7] soc: renesas: Identify SoC and register with the SoC bus"
>> series.
[...]
> Is this safe to add to next renesas-drivers release?

I think it is.

CU
Uli
