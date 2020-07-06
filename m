Return-Path: <SRS0=yEp9=AR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03BC4C433E0
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  6 Jul 2020 15:48:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD83620720
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  6 Jul 2020 15:48:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729286AbgGFPsR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 6 Jul 2020 11:48:17 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38949 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729267AbgGFPsR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Jul 2020 11:48:17 -0400
Received: by mail-ot1-f66.google.com with SMTP id 18so31974212otv.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 06 Jul 2020 08:48:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1EUcbJgbBzEFDlbv+pkF55apKN6XwPyTfyZDRfR1on0=;
        b=Cp60lvR55Ns7VwU+oPsG4JAWHGCTXeZr0qhnuZuR/m8Et+W+mliexbrqgHxzdhSMgi
         sqT74c+bfLyIYe37yxZNoPzNM7JkKI81TOVB8//e+V5u1whihl9ZBFFeYdUZipZYhMr5
         dSVsNG+OUTzO9xES9SaR/jJywV5JQORm3CjrjveBWD5r6BoKa82EfDuXqdlI86I4j8lC
         qkR1IsR/BEJqUcYR9K/ujqz4dViCGQrmKjth0w+PNQpP/wUzz1OckHd+7fmZnnXgFwN5
         cesA+vPvksPPji9xZfLBPyBF4CdbWXgJxm9f8K70phZRPRGHZKHRHeuC21t/SyUaoaoZ
         YlKQ==
X-Gm-Message-State: AOAM530CTpbBH3c3sr5HHWaRMx2rwZwurMf9M9bzo3JFctcX/8DPot7n
        jDNp9YFGQt3YoonfqrDjU9UX75JYFIoZADZAEmU=
X-Google-Smtp-Source: ABdhPJxB10YBmPOVkmE4T7v7WRmySmznCIGl/iw923XtLWkznWmMhEsANM70l9FkI2X4Go6IxbvTbxkpWS7rdsaj8Ho=
X-Received: by 2002:a05:6830:1451:: with SMTP id w17mr29648201otp.250.1594050496399;
 Mon, 06 Jul 2020 08:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200703120642.5128-1-geert+renesas@glider.be>
 <20200703120642.5128-2-geert+renesas@glider.be> <CAK8P3a0GTf-NBAixvgefyvx_nRpLgYZ6gZdp_VAUNTOV2=+t0g@mail.gmail.com>
 <CAMuHMdVHXztUyvEbj6ozp-zHf5Afg_hLmf4OU8v50sF2vBmPxg@mail.gmail.com> <CAK8P3a3HSRjcnmpicvAKOxnrcuZe+OVrdsiqj=eVbPKbjEcYmg@mail.gmail.com>
In-Reply-To: <CAK8P3a3HSRjcnmpicvAKOxnrcuZe+OVrdsiqj=eVbPKbjEcYmg@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Jul 2020 17:48:05 +0200
Message-ID: <CAMuHMdXD3jtX0yhqKKyTp8jxB+j5MtdD4YLtrP19qf6u3hLePA@mail.gmail.com>
Subject: Re: [GIT PULL 1/2] Renesas ARM defconfig updates for v5.9
To:     Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc:     arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Arnd,

On Mon, Jul 6, 2020 at 5:41 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Jul 6, 2020 at 4:45 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Mon, Jul 6, 2020 at 4:37 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > > On Fri, Jul 3, 2020 at 2:07 PM Geert Uytterhoeven
> > > <geert+renesas@glider.be> wrote:
> > > > ----------------------------------------------------------------
> > > > Renesas ARM defconfig updates for v5.9
> > > >
> > > >   - Refresh shmobile_defconfig for v5.8-rc1
> > > >   - Enable additional support for Renesas platforms to
> > > >     shmobile_defconfig, multi_v7_defconfig, and the arm64 defconfig.
> > >
> > > As you write on one of the commits
> > >
> > >    "All of the above are modular, except for Ethernet support (HDMI Audio
> > >     support is an optional feature of the modular ADV7511 driver)."
> > >
> > > I'm starting to see some demand for making more drivers loadable modules
> > > that are traditionally built-in. Can you give a more specific reason why
> > > this one (and I guess CONFIG_RAVB next to it) should not a loadable module?
> >
> > We tend to make Ethernet built-in, to ease testing using nfsroot.
> > If that is no longer desirable, I guess we'll have to improve our initramfs
> > skills ;-)
>
> I'm not sure either. My feeling is that we should probably make all network
> support loadable modules eventually, it seems wrong to single out yours
> if your current workflow depends on the built-in driver today.

Most non-USB Ethernet drivers seem to be built-in?

> I'm pulling your branch for now, but I'll keep asking around what others
> think, and we might change all drivers that can to be loadable
> modules later on.

Thanks!

> In particular, a number of chips that primarily run Android are now
> changed so they can have even more fundamental drivers (pinctrl,
> clk, ...) as loadable modules, and it seems like a good idea to
> also support that in the defconfig.

Aren't the Android devices usually using WiFi, and no nfsroot?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
