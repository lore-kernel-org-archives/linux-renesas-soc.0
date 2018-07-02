Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:36341 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752184AbeGBRJn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 2 Jul 2018 13:09:43 -0400
Received: by mail-lj1-f196.google.com with SMTP id o26-v6so13079848ljg.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Jul 2018 10:09:43 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1529933747.git.horms+renesas@verge.net.au>
References: <cover.1529933747.git.horms+renesas@verge.net.au>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 2 Jul 2018 10:09:41 -0700
Message-ID: <CAOesGMhZD0VS+NbZhgJOqhpP5A5X_pXVfUdkUnGmqLbnagJZaA@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC DT Updates for v4.19
To: Simon Horman <horms+renesas@verge.net.au>
Cc: ARM-SoC Maintainers <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jun 25, 2018 at 7:03 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM64 based SoC DT updates for v4.19.
>
>
> The following changes since commit ce397d215ccd07b8ae3f71db689aedb85d56ab40:
>
>   Linux 4.18-rc1 (2018-06-17 08:04:49 +0900)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-arm64-dt-for-v4.19
>
> for you to fetch changes up to 6b284a81307848b4331453b02cf7a33c09719d4b:
>
>   arm64: dts: renesas: r8a77995: Add MSIOF device nodes (2018-06-25 15:30:39 +0200)

Thanks, merged into next/dt.

I think you can still collapse some commits a bit further, for example
when a large number of devices are added to a new SoC, you don't need
a commit per device (i.e. the r8a77980 series).

It's not a problem if it's just a few, but like last merge window when
it really added to a lot of small trivial patches it's adding noise to
someone looking at changelogs -- it's harder to get a feel for what
new things are going in on a larger scope. Keep in mind that you, as
maintainer, should feel free to squash together patches when you apply
them if it makes sense -- just make sure you retain authorship and
credits/COO.


-Olof
