Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:50231 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752252AbdJTU2u (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 16:28:50 -0400
Received: by mail-oi0-f66.google.com with SMTP id q4so21871345oic.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Oct 2017 13:28:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cover.1506325468.git.horms+renesas@verge.net.au>
References: <cover.1506325468.git.horms+renesas@verge.net.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 20 Oct 2017 22:28:49 +0200
Message-ID: <CAK8P3a1e7TA+HzUhNMe4kd6RTiL4hNbcs98FkZcE886FJ1voag@mail.gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Drivers Updates for v4.15
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

On Mon, Sep 25, 2017 at 9:53 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Renesas ARM Based SoC Drivers Updates for v4.15
>
> Add basic support for R-Car V3M (R8A77970) SoC.
>
> Sergei Shtylyov says:
>
> * Add support for R-Car V3M (R8A77970) SoC power areas to the R-Car SYSC
>   driver
>
> * Add support for identifying the R-Car V3M (R8A77970) SoC
>
> * Add support for R-Car V3M (R8A77970) to the R-Car RST driver -- this
>   driver is  needed  for the clock driver to work

Pulled into next/drivers, thanks!

        Arnd
