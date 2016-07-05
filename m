Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:33093 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932846AbcGEVYd (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 5 Jul 2016 17:24:33 -0400
Received: by mail-oi0-f48.google.com with SMTP id u201so246801607oie.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 05 Jul 2016 14:24:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1467366121-14120-4-git-send-email-peter.chen@nxp.com>
References: <1467366121-14120-1-git-send-email-peter.chen@nxp.com> <1467366121-14120-4-git-send-email-peter.chen@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Jul 2016 23:24:31 +0200
Message-ID: <CACRpkdYMn94brCXUzS2b+4GBTx7WVhKririVzmHjjeVb9CC7NQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] arm: mach-u300: regulator: add missing of_node_put
 after calling of_parse_phandle
To: Peter Chen <peter.chen@nxp.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 1, 2016 at 11:41 AM, Peter Chen <peter.chen@nxp.com> wrote:

> of_node_put needs to be called when the device node which is got
> from of_parse_phandle has finished using.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Peter Chen <peter.chen@nxp.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
