Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:35340 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751495AbdHOQBd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Aug 2017 12:01:33 -0400
Received: by mail-oi0-f66.google.com with SMTP id q70so1127674oic.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 15 Aug 2017 09:01:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1501509815.git.horms+renesas@verge.net.au>
References: <cover.1501509815.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 15 Aug 2017 18:01:32 +0200
Message-ID: <CAK8P3a2VnommvfALpR+q8Dh8sa421oF3z45ZH4W8s1qVjFo8zw@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM64 Based SoC Defconfig Updates for v4.14
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

On Mon, Jul 31, 2017 at 5:02 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:

> ----------------------------------------------------------------
> Renesas ARM64 Based SoC Defconfig Updates for v4.14
>
> * compile ak4613 and renesas sound as modules
>
>   This is intended to reduce the size of a kernel image compiled
>   using the defconfig. This is timely as it brings the kernel image
>   back below the size that can be booted in my environment, a limit
>   it crept over in v4.13-rc1.

Good idea, thanks! Pulled into next/arm64.

       Arnd
