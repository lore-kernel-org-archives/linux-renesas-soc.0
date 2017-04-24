Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f181.google.com ([209.85.223.181]:33103 "EHLO
        mail-io0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1166623AbdDXIWc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Apr 2017 04:22:32 -0400
MIME-Version: 1.0
In-Reply-To: <2637169.nvyUM18Pqy@avalon>
References: <1492608293-12435-1-git-send-email-ulrich.hecht+renesas@gmail.com>
 <CAO3366zJmCvNLkW4SjG2VbZjBPq8jxGq5fyBY7iMbp+mHhsg3Q@mail.gmail.com>
 <20170424074901.GB2047@verge.net.au> <2637169.nvyUM18Pqy@avalon>
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Date: Mon, 24 Apr 2017 10:22:31 +0200
Message-ID: <CAO3366xaWH7YtktGpJ07ypzxuudyJc63PxxAeVeOi98Rann1Lg@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: r8a7795-salvator-x: Enable PWM
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 24, 2017 at 9:59 AM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> How about using pwm1 for backlight as done in "[PATCH v2 09/13] arm64: dts:
> r8a7795: salvator-x: Add panel backlight support" ?

Makes sense. Simon, should that go in a separate patch, or should I
add it to this one?

CU
Uli
