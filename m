Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f50.google.com ([209.85.218.50]:33921 "EHLO
	mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751688AbcFNHEF (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 14 Jun 2016 03:04:05 -0400
Received: by mail-oi0-f50.google.com with SMTP id d132so139351427oig.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Jun 2016 00:04:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1465571485-8493-1-git-send-email-wsa@the-dreams.de>
References: <1465571485-8493-1-git-send-email-wsa@the-dreams.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 14 Jun 2016 09:04:03 +0200
Message-ID: <CACRpkdbp865-gdEx==_a_6kvkY_MqStU+-2J3LVo3KOnL6tvFw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: fix property name in bindings doc
To: Wolfram Sang <wsa@the-dreams.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 10, 2016 at 5:11 PM, Wolfram Sang <wsa@the-dreams.de> wrote:

> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> It must be "drive-strength", with a hyphen.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Geert are you queuing this too?

Yours,
Linus Walleij
