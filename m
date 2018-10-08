Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:49022 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726078AbeJHWLj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Oct 2018 18:11:39 -0400
MIME-Version: 1.0
References: <20181005165848.3474-1-robh@kernel.org> <20181005165848.3474-6-robh@kernel.org>
 <CAMuHMdV=HaVhGf-7-21OHb05dCc0q9MDUNknAcybEiGSxATeEA@mail.gmail.com>
In-Reply-To: <CAMuHMdV=HaVhGf-7-21OHb05dCc0q9MDUNknAcybEiGSxATeEA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 8 Oct 2018 09:59:19 -0500
Message-ID: <CAL_JsqJGGRfoEb_TjZy2X9QwjfAdoxs_EB+cLNmszHOE8-OtHw@mail.gmail.com>
Subject: Re: [PATCH 05/36] dt-bindings: arm: renesas: Move 'renesas,prr'
 binding to its own doc
To: Geert Uytterhoeven <geert@linux-m68k.org>,
        Simon Horman <horms@verge.net.au>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
        <linux-arm-kernel@lists.infradead.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Grant Likely <glikely@secretlab.ca>,
        Kumar Gala <kumar.gala@linaro.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Mark Brown <broonie@kernel.org>, Tom Rini <trini@konsulko.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP"
        <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 8, 2018 at 2:05 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Rob,
>
> On Fri, Oct 5, 2018 at 6:58 PM Rob Herring <robh@kernel.org> wrote:
> > In preparation to convert board-level bindings to json-schema, move
> > various misc SoC bindings out to their own file.
> >
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Simon Horman <horms@verge.net.au>
> > Cc: Magnus Damm <magnus.damm@gmail.com>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-renesas-soc@vger.kernel.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Looks good to me, but needs a rebase, as the PRR section has been extended
> in -next.

Is this something you all can apply still for 4.20?

Rob
