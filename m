Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f176.google.com ([209.85.223.176]:35208 "EHLO
        mail-io0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753078AbdHBLvt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2017 07:51:49 -0400
Received: by mail-io0-f176.google.com with SMTP id m88so19311516iod.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 Aug 2017 04:51:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170718214339.7774-43-robh@kernel.org>
References: <20170718214339.7774-43-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 2 Aug 2017 13:51:47 +0200
Message-ID: <CACRpkdauP1T9bpp8C68wt6oK7gosAHt3pR7i=2+zRvPwXHo3ZA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Convert to using %pOF instead of full_name
To: Rob Herring <robh@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Barry Song <baohua@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/STI ARCHITECTURE" <kernel@stlinux.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 18, 2017 at 11:43 PM, Rob Herring <robh@kernel.org> wrote:

> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Lee Jones <lee@kernel.org>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Stefan Wahren <stefan.wahren@i2se.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Barry Song <baohua@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: kernel@stlinux.com
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org

Patch applied with the recieved ACKs.

Yours,
Linus Walleij
