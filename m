Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor1.renesas.com ([210.160.252.171]:28671 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725977AbeKUBtB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Nov 2018 20:49:01 -0500
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-gpio@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [RFC v3 0/2] Request GPIO when enabling interrupt
Date: Tue, 20 Nov 2018 15:19:14 +0000
Message-Id: <1542727156-31432-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Dear All,

here is a new iteration of the fix for the pinmuxing issue while
requesting an interrupt.
I don't like this implementation either as:
* pinctrl_mux_gpio_request_enable is very similar to pinctrl_gpio_request,
  and the name I have picked up is not exactly brilliant...
* it may cause an error message like "Pin X is busy, can't configure it as
  GPIO." (for cd-gpios pins for example) as it can't check the status of the pin
  before requesting it (can it?)
* because it's discarding errors returned by pinctrl_mux_gpio_request_enable

This problem needs fixing, but the solutions proposed so far don't look
great, as they are not spectacularly neat.

What's the best way to fix this?

Ideas and comments very welcome!

Thanks,
Fab

Fabrizio Castro (2):
  pinctrl: core: Add pinctrl_mux_gpio_request_enable
  gpio: rcar: Set pin as a GPIO when configuring an interrupt

 drivers/gpio/gpio-rcar.c         |  3 +++
 drivers/pinctrl/core.c           | 34 ++++++++++++++++++++++++++++++++++
 include/linux/pinctrl/consumer.h |  6 ++++++
 3 files changed, 43 insertions(+)

-- 
2.7.4
