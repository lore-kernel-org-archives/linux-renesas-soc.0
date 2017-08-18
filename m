Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f43.google.com ([209.85.218.43]:34801 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751350AbdHRVNS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Aug 2017 17:13:18 -0400
Received: by mail-oi0-f43.google.com with SMTP id x3so108596262oia.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 18 Aug 2017 14:13:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1502961902.git.horms+renesas@verge.net.au>
References: <cover.1502961902.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 18 Aug 2017 23:13:17 +0200
Message-ID: <CAK8P3a1+=AuEjXw+r9SN+BSyYLA=iaXmOLrT7f8MAfMvpJh6OQ@mail.gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC DT Bindings
 Updates for v4.14
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

On Fri, Aug 18, 2017 at 10:20 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Second Round of Renesas ARM Based SoC DT Bindings Updates for v4.14
>
> * Add RZ/G1M (r8a7743) binding to apmu driver
>
>   This allows SMP to be supported on the RZ/G1M SoC
>
> * Add bindings for iW-RainboW-G22D-SODIMM RZ/G1E SODIMM development kit
>
>   This is in preparation for adding DTS to support this hardware

Pulled into next/dt, thanks!

      Arnd
