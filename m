Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f195.google.com ([74.125.82.195]:40465 "EHLO
        mail-ot0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751206AbdLUPWG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 10:22:06 -0500
Received: by mail-ot0-f195.google.com with SMTP id o39so3250287otd.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 21 Dec 2017 07:22:06 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <cover.1512553442.git.horms+renesas@verge.net.au>
References: <cover.1512553442.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Dec 2017 16:22:05 +0100
Message-ID: <CAK8P3a25kicb5dQi-U5tH0WdAjAGK5_CL4YXbNTWPM39dqFzdQ@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v4.16
To: Simon Horman <horms+renesas@verge.net.au>
Cc: arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 6, 2017 at 11:21 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Hi Olof, Hi Kevin, Hi Arnd,
>
> Please consider these Renesas ARM based SoC updates for v4.16.
>
>
> The following changes since commit 4fbd8d194f06c8a3fd2af1ce560ddb31f7ec8323:
>
>   Linux 4.15-rc1 (2017-11-26 16:01:47 -0800)
>
> are available in the git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git tags/renesas-soc-for-v4.16
>
> for you to fetch changes up to 90f0d2b344313a8a4c366ef60d0df33008d2be84:
>
>   soc: renesas: Identify R-Car M3-W ES1.1 (2017-11-27 11:40:57 +0100)
>
> ----------------------------------------------------------------
> Renesas ARM Based SoC Updates for v4.16
>
> * Identify R-Car M3-W ES1.1
>
>   Geert Uytterhoeven says "The Product Register of R-Car M3-W ES1.1
>   incorrectly identifies the SoC revision as ES2.0.  Add a workaround to
>   fix this."
>
>   It is my understanding that this is likely to be forwards-compatibile.
>\

Pulled into next/soc, thanks!

      Arnd
