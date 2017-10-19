Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:48484 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751885AbdJSVll (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Oct 2017 17:41:41 -0400
Received: by mail-oi0-f67.google.com with SMTP id m198so17208138oig.5
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Oct 2017 14:41:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1506676368.git.horms+renesas@verge.net.au>
References: <cover.1506676368.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 19 Oct 2017 23:41:40 +0200
Message-ID: <CAK8P3a2-DWSxLgPnj27T6g9mTS66YnoAY_RTzWhrrVnA3NnjkA@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Bindings Updates for v4.15
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

On Fri, Sep 29, 2017 at 1:52 PM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> ----------------------------------------------------------------
> Renesas ARM Based SoC DT Bindings Updates for v4.15
>
> * Consistently do not use ';' in documentation of compat strings
>   for boards. A misture of using and not using a trailing ';' had
>   krept in over time with not using being dominant.
>
> * Document bindings for
>   - Eagle board and r8a77970 (V3M) SoC bindings.
>     Eagle is a board for the V3M SoC
>   - Document Kingfisher board bindings.
>     Kingfisher is an extension board for the H3ULCB and M3ULCB boards.
>
> * Add r8a77970 (V3M) SYSC power domain definitions
>
>   Add macros usable by the device tree sources to reference r8a77970 SYSC
>   power domains by index.
>
> * Add Renesas SoC DT bindings doc to Renesas ARM section of MAINTAINERS file
>
> * Drop bogus node name suffix from example of /renesas,dw-hdmi binding
>
> * Document APMU and SMP enable method for r8a7745 (RZ/G1E) SoC

Pulled into next/dt, thanks!

      Arnd
